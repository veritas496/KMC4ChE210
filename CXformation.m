function [CX1pickedup,ystore,NZE,CCNTSP,Conf,C2FSP,CdiffusionSP,C3FSP,C3diffusionSP,CXFSP,CHPSP,CBdiffusionSP,C2on]=CXformation(NZE,W,L,Conf,H,C,C2,C3,CX,C2FSP,CdiffusionSP,C3FSP,...
    C3diffusionSP,CXFSP,CHPSP,CCNTSP,CBdiffusionSP,C2on,ystore)
%C3+C=CX;C3+C2=CX;C3+C3=CX;CX+C=CX;CX+C3=CX;
Cstore=zeros(4,2); 

k=find(CXFSP);
N=ceil(rand(1)*numel(k));
ind=k(N);
n=ceil(ind/W);
m=ind-W*(n-1);
CX1pickedup=[m n];  %pickup an random position for CX1:CX or C3

upCX1picked=[CX1pickedup(1),CX1pickedup(2)+1];       %the position of its neighbours
downCX1picked=[CX1pickedup(1),CX1pickedup(2)-1];
leftCX1picked=[CX1pickedup(1)-1,CX1pickedup(2)];
rightCX1picked=[CX1pickedup(1)+1,CX1pickedup(2)];

CX1species=Conf(CX1pickedup(1),CX1pickedup(2));

switch(CX1species)
    case(C3)
       if upCX1picked(2)<=L&&(Conf(upCX1picked(1),upCX1picked(2))==C||Conf(upCX1picked(1),upCX1picked(2))==C2||Conf(upCX1picked(1),upCX1picked(2))==C3) %find the C3 neighbours which is C C2 C3 or CX
           Cstore(1,:)=upCX1picked;
       end 
       if downCX1picked(2)>=1&&(Conf(downCX1picked(1),downCX1picked(2))==C||Conf(downCX1picked(1),downCX1picked(2))==C2||Conf(downCX1picked(1),downCX1picked(2))==C3)
           Cstore(2,:)=downCX1picked;
       end
       if leftCX1picked(1)>=1&&(Conf(leftCX1picked(1),leftCX1picked(2))==C||Conf(leftCX1picked(1),leftCX1picked(2))==C2||Conf(leftCX1picked(1),leftCX1picked(2))==C3)
           Cstore(3,:)=leftCX1picked;
       end
       if rightCX1picked(1)<=W&&(Conf(rightCX1picked(1),rightCX1picked(2))==C||Conf(rightCX1picked(1),rightCX1picked(2))==C2||Conf(rightCX1picked(1),rightCX1picked(2))==C3)
           Cstore(4,:)=rightCX1picked;
       end 

       index=find(Cstore(:,1));
       row=ceil(rand(1)*length(index));
       CX2pickedup=Cstore(index(row),:);     % randomly pick up an position which is C, C2 C3 or CX

       upCX2picked=[CX2pickedup(1),CX2pickedup(2)+1]; % find the neighbours of this CX2 Species
       downCX2picked=[CX2pickedup(1),CX2pickedup(2)-1];
       leftCX2picked=[CX2pickedup(1)-1,CX2pickedup(2)];
       rightCX2picked=[CX2pickedup(1)+1,CX2pickedup(2)]; 
               
       CX2species=Conf(CX2pickedup(1),CX2pickedup(2));
       switch(CX2species)
           case(C)   % CX1=C3;CX2=C ==> CX1=CX;CX2=CX
                Conf(CX1pickedup(1),CX1pickedup(2))=CX;  % update the configuration of the lattice
                Conf(CX2pickedup(1),CX2pickedup(2))=CX;
                CBdiffusionSP(CX2pickedup(1),CX2pickedup(2))=0;%remove C bulk diffusion at this site
                NZE(20)=NZE(20)-1;
                
                CXFSP(CX1pickedup(1),CX1pickedup(2))=0; %remove CX formation at this C3 site
                NZE(11)=NZE(11)-1;
                
                if (CX1pickedup(1)==1)||(CX1pickedup(1)==W)||(CX1pickedup(2)==1)||(CX1pickedup(2)==L)
                    CCNTSP(CX1pickedup(1),CX1pickedup(2))=0;
                    NZE(19)=NZE(19)-1;
                end
                
                if (CX2pickedup(1)==1)||(CX2pickedup(1)==W)||(CX2pickedup(2)==1)||(CX2pickedup(2)==L)
                    CCNTSP(CX2pickedup(1),CX2pickedup(2))=0;
                    NZE(19)=NZE(19)-1;
                end

               [NZE,Conf,CXFSP,C3diffusionSP]=CXFcheckC3NB(NZE,Conf,W,L,C,C2,C3,CX,CXFSP,C3diffusionSP,CX1pickedup,CX2pickedup,upCX1picked,downCX1picked,leftCX1picked,rightCX1picked);           
               [NZE,Conf,CHPSP,C2FSP,C3FSP,CXFSP,CdiffusionSP]=CXFcheckCNB(NZE,Conf,W,L,H,C,C2,C3,CX,CHPSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,CX1pickedup,CX2pickedup,upCX2picked,downCX2picked,leftCX2picked,rightCX2picked);
                
           case(C2)
                Conf(CX1pickedup(1),CX1pickedup(2))=CX;  % update the configuration of the lattice
                Conf(CX2pickedup(1),CX2pickedup(2))=CX;
                CXFSP(CX1pickedup(1),CX1pickedup(2))=0; %remove CX formation at this C3 site
                NZE(11)=NZE(11)-1;
                
                C2on=C2on-1;
                
                if (CX1pickedup(1)==1)||(CX1pickedup(1)==W)||(CX1pickedup(2)==1)||(CX1pickedup(2)==L)
                    CCNTSP(CX1pickedup(1),CX1pickedup(2))=0;
                    NZE(19)=NZE(19)-1;
                end
                
                [NZE,Conf,CXFSP,C3diffusionSP]=CXFcheckC3NB(NZE,Conf,W,L,C,C2,C3,CX,CXFSP,C3diffusionSP,CX1pickedup,CX2pickedup,upCX1picked,downCX1picked,leftCX1picked,rightCX1picked);
                [NZE,Conf,C3FSP,CXFSP]=CXFcheckC2NB(NZE,Conf,W,L,C,C3,C3FSP,CXFSP,CX1pickedup,CX2pickedup,upCX2picked,downCX2picked,leftCX2picked,rightCX2picked);
  
           case(C3)
                  Conf(CX1pickedup(1),CX1pickedup(2))=CX;  % update the configuration of the lattice
                  Conf(CX2pickedup(1),CX2pickedup(2))=CX;
                  CXFSP(CX1pickedup(1),CX1pickedup(2))=0; %remove CX formation at this C3 site
                  NZE(11)=NZE(11)-1;
                  CXFSP(CX2pickedup(1),CX2pickedup(2))=0; %remove CX formation at this C3 site
                  NZE(11)=NZE(11)-1;
                  
                  if (CX1pickedup(1)==1)||(CX1pickedup(1)==W)||(CX1pickedup(2)==1)||(CX1pickedup(2)==L)
                      CCNTSP(CX1pickedup(1),CX1pickedup(2))=0;
                      NZE(19)=NZE(19)-1;
                  end
                
                  if (CX2pickedup(1)==1)||(CX2pickedup(1)==W)||(CX2pickedup(2)==1)||(CX2pickedup(2)==L)
                      CCNTSP(CX2pickedup(1),CX2pickedup(2))=0;
                      NZE(19)=NZE(19)-1;
                  end
                  [NZE,Conf,CXFSP,C3diffusionSP]=CXFcheckC3NB(NZE,Conf,W,L,C,C2,C3,CX,CXFSP,C3diffusionSP,CX1pickedup,CX2pickedup,upCX1picked,downCX1picked,leftCX1picked,rightCX1picked);
                  [NZE,Conf,CXFSP,C3diffusionSP]=CXFcheckC3NB(NZE,Conf,W,L,C,C2,C3,CX,CXFSP,C3diffusionSP,CX2pickedup,CX1pickedup,upCX2picked,downCX2picked,leftCX2picked,rightCX2picked);
                                        
       end
      
    case(CX)
       
       if upCX1picked(2)<=L&&(Conf(upCX1picked(1),upCX1picked(2))==C||Conf(upCX1picked(1),upCX1picked(2))==C3) %find the C3 neighbours which is C or C3
           Cstore(1,:)=upCX1picked;
       end 
       if downCX1picked(2)>=1&&(Conf(downCX1picked(1),downCX1picked(2))==C||Conf(downCX1picked(1),downCX1picked(2))==C3)
           Cstore(2,:)=downCX1picked;
       end
       if leftCX1picked(1)>=1&&(Conf(leftCX1picked(1),leftCX1picked(2))==C||Conf(leftCX1picked(1),leftCX1picked(2))==C3)
           Cstore(3,:)=leftCX1picked;
       end
       if rightCX1picked(1)<=W&&(Conf(rightCX1picked(1),rightCX1picked(2))==C||Conf(rightCX1picked(1),rightCX1picked(2))==C3)
           Cstore(4,:)=rightCX1picked;
       end 

       index=find(Cstore(:,1));
       row=ceil(rand(1)*length(index));
       CX2pickedup=Cstore(index(row),:);   % randomly pick up an position which is C, or C3

       upCX2picked=[CX2pickedup(1),CX2pickedup(2)+1]; % find the neighbours of this CX2 Species
       downCX2picked=[CX2pickedup(1),CX2pickedup(2)-1];
       leftCX2picked=[CX2pickedup(1)-1,CX2pickedup(2)];
       rightCX2picked=[CX2pickedup(1)+1,CX2pickedup(2)]; 
               
       CX2species=Conf(CX2pickedup(1),CX2pickedup(2));
        
       switch(CX2species)
           case(C)
                Conf(CX2pickedup(1),CX2pickedup(2))=CX;  % update the configuration of the lattice
                CXFSP(CX1pickedup(1),CX1pickedup(2))=CXFSP(CX1pickedup(1),CX1pickedup(2))-1; %remove CX formation at this site
                if CXFSP(CX1pickedup(1),CX1pickedup(2))==0;
                    NZE(11)=NZE(11)-1;
                end
                CBdiffusionSP(CX2pickedup(1),CX2pickedup(2))=0;%remove C bulk diffusion at this site
                NZE(20)=NZE(20)-1;
                
                if (CX2pickedup(1)==1)||(CX2pickedup(1)==W)||(CX2pickedup(2)==1)||(CX2pickedup(2)==L)
                    CCNTSP(CX2pickedup(1),CX2pickedup(2))=0;
                    NZE(19)=NZE(19)-1;
                end
                
                [NZE,Conf,CHPSP,C2FSP,C3FSP,CXFSP,CdiffusionSP]=CXFcheckCNB(NZE,Conf,W,L,H,C,C2,C3,CX,CHPSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,...
                    CX1pickedup,CX2pickedup,upCX2picked,downCX2picked,leftCX2picked,rightCX2picked);
              
           case(C3)
                Conf(CX2pickedup(1),CX2pickedup(2))=CX;  % update the configuration of the lattice
                CXFSP(CX1pickedup(1),CX1pickedup(2))=CXFSP(CX1pickedup(1),CX1pickedup(2))-1; %remove CX formation at this site
                if CXFSP(CX1pickedup(1),CX1pickedup(2))==0;
                    NZE(11)=NZE(11)-1;
                end
                
                if (CX2pickedup(1)==1)||(CX2pickedup(1)==W)||(CX2pickedup(2)==1)||(CX2pickedup(2)==L)
                    CCNTSP(CX2pickedup(1),CX2pickedup(2))=0;
                    NZE(19)=NZE(19)-1;
                end
             
               [NZE,Conf,CXFSP,C3diffusionSP]=CXFcheckC3NB(NZE,Conf,W,L,C,C2,C3,CX,CXFSP,C3diffusionSP,...
                   CX2pickedup,CX1pickedup,upCX2picked,downCX2picked,leftCX2picked,rightCX2picked);
               
       end
       
end

ystore=scanCXempty(ystore,Conf,W,L,CX1pickedup,upCX1picked,downCX1picked,leftCX1picked,rightCX1picked,...
    CX2pickedup,upCX2picked,downCX2picked,leftCX2picked,rightCX2picked);
end
        