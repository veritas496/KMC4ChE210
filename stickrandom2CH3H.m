clear
clc
W=input('the size of the lattice');
L=W;
round=0;
m=input('round');%
meet=zeros(1,m);
n=input('step per round');%step per round

numstick=input('number of stick'); % number of non-movable atoms
Natom=input('number of atom');% number of movable atoms
sp=zeros(Natom,2);
stick=zeros(numstick,2);
while round<m
      lattice=zeros(W,L);    %initialize the lattice
       
      step=0;
      for b=1:numstick
          RN1=ceil(rand(1)*W);
          RN2=ceil(rand(1)*W);
          stick(b,:)=[RN1 RN2]; %set up a stick point
          lattice(RN1, RN2)=1;
      end
      
      pickedup=stick(1,:);%pickup an random position for H
      up=[pickedup(1),pickedup(2)+1];       %the position of its neighbours
      down=[pickedup(1),pickedup(2)-1];
      left=[pickedup(1)-1,pickedup(2)];
      right=[pickedup(1)+1,pickedup(2)];
      
      Pstore=zeros(4,2); 

      if up(2)<=L&&lattice(up(1),up(2))~=1 %find the H neighbours which is 0 
           Pstore(1,:)=up;
      end
      if down(2)>=1&&lattice(down(1),down(2))~=1
           Pstore(2,:)=down;
      end
      if left(1)>=1&&lattice(left(1),left(2))~=1
           Pstore(3,:)=left;
      end
      if right(1)<=W&&lattice(right(1),right(2))~=1
           Pstore(4,:)=right;
      end

      index=find(Pstore(:,1));
      row=ceil(rand(1)*length(index));
      sp(1,:)=Pstore(index(row),:);  % randomly pick up an position which is 0 
      
      if Natom>1
          for k=2:Natom            %set up random position of the atoms
              RN1=ceil(rand(1)*W);
              RN2=ceil(rand(1)*W);
              sp(k,:)=[RN1 RN2]; 
              lattice(RN1, RN2)=1;
          end
      end
      
            
      meetpoint=0;
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
                    row=ceil(rand(1)*length(index));
                    sp(j,:)=EPstore(index(row),:);  % randomly pick up an position which is 0 
                    va=sp(j,:);
                    lattice(Hpickedup(1),Hpickedup(2))=0;
                    lattice(va(1),va(2))=1;   
                    
                    break
                end
            end
            for x=1:numstick
                for t=1:Natom
                    if sum((sp(t,:)-stick(x,:)).^2)==1
                            meetpoint=meetpoint+1;
                    end
                end
            end

            step=step+1;
      end
      round=round+1;
      meet(round)=meetpoint;

end
averagemeetpoint=sum(meet)/m
%PR=lattice/(m*n)*100

