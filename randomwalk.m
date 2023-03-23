clear
clc
W=input('the size of the lattice');
L=W;
round=0;
m=input('round');%
meet=zeros(1,m);
BC=zeros(1,m);
n=input('step per round');%step per round
i=0;
MP=0;
Natom=input('number of atom');
sp=zeros(Natom,2);
while round<m
      lattice=zeros(W,L);    %initialize the lattice
       
      step=0;
      for k=1:Natom            %set up random position of the atoms
          RN1=ceil(rand(1)*W);
          RN2=ceil(rand(1)*W);
          sp(k,:)=[RN1 RN2]; 
          lattice(RN1, RN2)=1;
      end
      
      i=i+1;
      
      meetpoint=0;
      BCpoint=0;
      while step<n
            EPstore=zeros(4,2); 
            RN=rand(1);
            for j=1:Natom
                if RN<(j)/Natom
                    
                    Hpickedup=sp(j,:);%pickup an random position for H
                    up=[Hpickedup(1),Hpickedup(2)+1];       %the position of its neighbours
                    down=[Hpickedup(1),Hpickedup(2)-1];
                    left=[Hpickedup(1)-1,Hpickedup(2)];
                    right=[Hpickedup(1)+1,Hpickedup(2)];

                    if up(2)<=L&&lattice(up(1),up(2))~=1 %find the H neighbours which is 0 
                       EPstore(1,:)=up;
                    end
                    if down(2)>=1&&lattice(down(1),down(2))~=1
                       EPstore(2,:)=down;
                    end
                    if left(1)>=1&&lattice(left(1),left(2))~=1
                       EPstore(3,:)=left;
                    end
                    if right(1)<=W&&lattice(right(1),right(2))~=1
                       EPstore(4,:)=right;
                    end

                    index=find(EPstore(:,1));
                    if isempty(index)~=1
                        
                        row=ceil(rand(1)*length(index));
                        sp(j,:)=EPstore(index(row),:);  % randomly pick up an position which is 0 
                        va=sp(j,:);
                        lattice(Hpickedup(1),Hpickedup(2))=0;
                        lattice(va(1),va(2))=1;  
                        step=step+1;
                        
                        for t=1:Natom-1
                            for y=t+1:Natom
                                if sum((sp(t,:)-sp(y,:)).^2)==1
                                    meetpoint=meetpoint+1;
                                end
                            end
                        end
            
           
                        for p=1:Natom
                            if sp(p,1)==1||sp(p,1)==W||sp(p,2)==1||sp(p,2)==W % calculate the BC point
                            BCpoint=BCpoint+1;
                            end
                        end
                    end
                    break
               end
            end
            
      end
      round=round+1;
      meet(i)=meetpoint;
      BC(i)=BCpoint;

end
MP=sum(meet)/m/n
BCC=sum(BC)/m/n
%PR=lattice/(m*n)*100

