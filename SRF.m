function [ lattice,MPST,MPNN,BCC ] = SRF( W,L,m,n,numstick,Natom )

round=0;
meetST=zeros(1,m);
meetNN=zeros(1,m);
BC=zeros(1,m);

while round<m
      lattice=zeros(W,L);    %initialize the lattice
      sp=zeros(Natom,2);
      stick=zeros(numstick,2);
      step=0;
      k=1;
      b=1;
      while k<=Natom     %set up random position of the atoms  
          kk=find(lattice==0);
          NN=ceil(rand(1)*numel(kk));
          ind=kk(NN);
          nn=ceil(ind/W);
          mm=ind-W*(nn-1);
          sp(k,:)=[mm nn];  %pickup an random position for 
          lattice(mm, nn)=1;
          k=k+1;
      end
      while b<=numstick
          kk1=find(lattice==0);
          NN1=ceil(rand(1)*numel(kk1));
          ind1=kk1(NN1);
          nn1=ceil(ind1/W);
          mm1=ind1-W*(nn1-1);
          stick(b,:)=[mm1 nn1];
          lattice(mm1, nn1)=2;
          b=b+1;
      end
      
            
      meetpointST=0;
      meetpointNN=0;
      BCpoint=0;
      
      
      for t=1:Natom
          Mpickedup=sp(t,:);%pickup an random position for 
          Mup=[Mpickedup(1),Mpickedup(2)+1];       %the position of its neighbours
          Mdown=[Mpickedup(1),Mpickedup(2)-1];
          Mleft=[Mpickedup(1)-1,Mpickedup(2)];
          Mright=[Mpickedup(1)+1,Mpickedup(2)];

          if Mup(2)<=L&&lattice(Mup(1),Mup(2))==1 
                meetpointNN=meetpointNN+1;
          elseif Mup(2)<=L&&lattice(Mup(1),Mup(2))==2
                meetpointST=meetpointST+1;
          end
          
          if Mdown(2)>=1&&lattice(Mdown(1),Mdown(2))==1
                meetpointNN=meetpointNN+1;
          elseif Mdown(2)>=1&&lattice(Mdown(1),Mdown(2))==2
                meetpointST=meetpointST+1;
          end
          
          if Mleft(1)>=1&&lattice(Mleft(1),Mleft(2))==1
                meetpointNN=meetpointNN+1;
          elseif Mleft(1)>=1&&lattice(Mleft(1),Mleft(2))==2
                meetpointST=meetpointST+1;
          end
          
          if Mright(1)<=W&&lattice(Mright(1),Mright(2))==1
                meetpointNN=meetpointNN+1;
          elseif Mright(1)<=W&&lattice(Mright(1),Mright(2))==2
                meetpointST=meetpointST+1;
          end          
      end
 
                        
      for p=1:Natom
          if sp(p,1)==1||sp(p,1)==W||sp(p,2)==1||sp(p,2)==W % calculate the BC point
                 BCpoint=BCpoint+1;
          end
      end
      
      stepmeetpointST=[];
      stepmeetpointNN=[];
      stepBCpoint=[];
      lop=0;  % counte the stuck lopp
      while step<n
            EPstore=zeros(4,2); 
            RN=rand(1);
            for j=1:Natom
                if RN<(j/Natom)
                    
                    Hpickedup=sp(j,:);%pickup an random position for H
                    up=[Hpickedup(1),Hpickedup(2)+1];       %the position of its neighbours
                    down=[Hpickedup(1),Hpickedup(2)-1];
                    left=[Hpickedup(1)-1,Hpickedup(2)];
                    right=[Hpickedup(1)+1,Hpickedup(2)];

                    if up(2)<=L&&lattice(up(1),up(2))==0 %find the H neighbours which is 0 
                       EPstore(1,:)=up;
                    end
                    if down(2)>=1&&lattice(down(1),down(2))==0
                       EPstore(2,:)=down;
                    end
                    if left(1)>=1&&lattice(left(1),left(2))==0
                       EPstore(3,:)=left;
                    end
                    if right(1)<=W&&lattice(right(1),right(2))==0
                       EPstore(4,:)=right;
                    end
                    
                    index=find(EPstore(:,1));
                    if isempty(index)~=1

                        [meetpointST,meetpointNN,BCpoint] = RDHpickedupcheckNB(W,L,lattice,meetpointST,meetpointNN,BCpoint,up,down,left,right);
                        
                        row=ceil(rand(1)*length(index));
                        sp(j,:)=EPstore(index(row),:);  % randomly pick up an position which is 0 and assign it to sp to update Natom position
                        EPpickedup=sp(j,:);
                        
                        upEPpicked=[EPpickedup(1),EPpickedup(2)+1]; % find the neighbours of this site
                        downEPpicked=[EPpickedup(1),EPpickedup(2)-1];
                        leftEPpicked=[EPpickedup(1)-1,EPpickedup(2)];
                        rightEPpicked=[EPpickedup(1)+1,EPpickedup(2)];  
                        
                        lattice(Hpickedup(1),Hpickedup(2))=0; % update the lattice
                        lattice(EPpickedup(1),EPpickedup(2))=1;  % update the lattice
                        step=step+1; 
                        
                        [meetpointST,meetpointNN,BCpoint] = RDEPpickedupcheckNB(W,L,lattice,meetpointST,meetpointNN,BCpoint,upEPpicked,downEPpicked,leftEPpicked,rightEPpicked);
                        stepmeetpointST=[stepmeetpointST meetpointST];
                        stepmeetpointNN=[stepmeetpointNN meetpointNN];
                        stepBCpoint=[stepBCpoint BCpoint];
                        break;
                    elseif isempty(index)==1
                        lop=lop+1;
                    end 
                end
            end
            
            if lop>0.9*n
                 break
            end  
      end
      round=round+1;
      meetST(round)=sum(stepmeetpointST);
      meetNN(round)=sum(stepmeetpointNN);
      BC(round)=sum(stepBCpoint);

end
MPST=sum(meetST)/m/n;
MPNN=sum(meetNN)/m/n;
BCC=sum(BC)/m/n;

end

