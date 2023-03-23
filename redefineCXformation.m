function [CX1pickedup,CX2pickedup,CXcheck2,CCC,ystore,NZE,CCNTSP,Conf,C2FSP,CdiffusionSP,C3FSP,C3diffusionSP,CXFSP,CHPSP,CBdiffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP]=redefineCXformation(NZE,W,L,Conf,H,CH3,CH2,CH,C,C2,C3,CX,C2FSP,CdiffusionSP,C3FSP,...
    C3diffusionSP,CXFSP,CHPSP,CCNTSP,CBdiffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,ystore,CCC)
%C3+C=CX;CX+C=CX;not CX+C3=CX;C3+C2=CX;C3+C3=CX for here;
%when C3 and C are neighbors, both C3 and C were updates to CX;
%when C3 and C are not neighbors, only C3 were updated to CX;
CX2pickedup=[0 0];
CXcheck2=[0 0];
k=find(C3diffusionSP);
yst=find(ystore);    

k=[k;yst];
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
       u=find(CdiffusionSP);
       %x=find(C3diffusionSP);
       %u=[u;x];
       N1=ceil(rand(1)*numel(u));
       ind1=u(N1);
       n1=ceil(ind1/W);
       m1=ind1-W*(n1-1);
       CX2pickedup=[m1 n1];  %pickup an random position for C or maybe C3

       upCX2picked=[CX2pickedup(1),CX2pickedup(2)+1]; % find the neighbours of this CX2 Species
       downCX2picked=[CX2pickedup(1),CX2pickedup(2)-1];
       leftCX2picked=[CX2pickedup(1)-1,CX2pickedup(2)];
       rightCX2picked=[CX2pickedup(1)+1,CX2pickedup(2)]; 
               
       CX2species=Conf(CX2pickedup(1),CX2pickedup(2));
       %CXcheck2=[0 0];
   
       switch(CX2species)
           case(C)
               if sum((CX1pickedup-CX2pickedup).^2)==1       % when C3 and C are sitting beside each other
                     Conf(CX1pickedup(1),CX1pickedup(2))=CX;  % update the configuration of the lattice
                     Conf(CX2pickedup(1),CX2pickedup(2))=CX;
                     CBdiffusionSP(CX2pickedup(1),CX2pickedup(2))=0;%remove C bulk diffusion at this site
                     NZE(20)=NZE(20)-1;
                
                     CXFSP(CX1pickedup(1),CX1pickedup(2))=0; %remove CX formation at this C3 site
                     NZE(11)=NZE(11)-1;
                     
                     C3diffusionSP(CX1pickedup(1),CX1pickedup(2))=0;
                     NZE(4)=NZE(4)-1;
                     CdiffusionSP(CX2pickedup(1),CX2pickedup(2))=0;
                     NZE(3)=NZE(3)-1;
                
                     if (CX1pickedup(1)==1)||(CX1pickedup(1)==W)||(CX1pickedup(2)==1)||(CX1pickedup(2)==L)
                         CCNTSP(CX1pickedup(1),CX1pickedup(2))=0;
                         NZE(19)=NZE(19)-1;
                     end
                
                     if (CX2pickedup(1)==1)||(CX2pickedup(1)==W)||(CX2pickedup(2)==1)||(CX2pickedup(2)==L)
                         CCNTSP(CX2pickedup(1),CX2pickedup(2))=0;
                         NZE(19)=NZE(19)-1;
                     end

                    [NZE,Conf,CXFSP,C3diffusionSP]=rdCXFcheckC3NB(NZE,Conf,W,L,C,C2,C3,CX,CXFSP,C3diffusionSP,CX1pickedup,CX2pickedup,upCX1picked,downCX1picked,leftCX1picked,rightCX1picked);           
                    [NZE,Conf,CHPSP,C2FSP,C3FSP,CXFSP,CdiffusionSP]=rdCXFcheckCNB(NZE,Conf,W,L,H,C,C2,C3,CX,CHPSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,CX1pickedup,CX2pickedup,upCX2picked,downCX2picked,leftCX2picked,rightCX2picked);
       
                    ystore=scanCXempty(ystore,Conf,W,L,CX1pickedup,upCX1picked,downCX1picked,leftCX1picked,rightCX1picked,CX2pickedup,upCX2picked,downCX2picked,leftCX2picked,rightCX2picked);
               else        % when C3 and C are not neighbors
                    Conf(CX1pickedup(1),CX1pickedup(2))=CX;  % update the configuration of the lattice
                    Conf(CX2pickedup(1),CX2pickedup(2))=0;
                    C3diffusionSP(CX1pickedup(1),CX1pickedup(2))=0;
                    NZE(4)=NZE(4)-1;
                    CdiffusionSP(CX2pickedup(1),CX2pickedup(2))=0; %remove C diffusion at this site
                    NZE(3)=NZE(3)-1;
                    CBdiffusionSP(CX2pickedup(1),CX2pickedup(2))=0;%remove C bulk diffusion at this site
                    NZE(20)=NZE(20)-1;
                    ystore=scanNBP(ystore,Conf,W,L,CX,CX2pickedup,upCX2picked,downCX2picked,leftCX2picked,rightCX2picked,[],0,0,0,0);
                    ystore=scanCXempty(ystore,Conf,W,L,CX1pickedup,upCX1picked,downCX1picked,leftCX1picked,rightCX1picked,[],0,0,0,0);

                    if CCNTSP(CX1pickedup(1),CX1pickedup(2))>0    
                        CCNTSP(CX1pickedup(1),CX1pickedup(2))=0;
                        NZE(19)=NZE(19)-1;
                    end
                    if CCNTSP(CX2pickedup(1),CX2pickedup(2))>0    
                        CCNTSP(CX2pickedup(1),CX2pickedup(2))=0;
                        NZE(19)=NZE(19)-1;
                    end
                    
                    [NZE,Conf,CXFSP,C3diffusionSP]=redefineCXFcheckC3NB(NZE,Conf,W,L,C,C2,C3,CX,CXFSP,C3diffusionSP,...
                        CX1pickedup,upCX1picked,downCX1picked,leftCX1picked,rightCX1picked);                           
                    [NZE,CXFSP,C3diffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,C3FSP]=redefineCXFcheckCNB(NZE,Conf,W,L,C,C2,C3,CX,CXFSP,C3diffusionSP,H,CH3,...
                            CH2,CH,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,C3FSP,...
                            CX2pickedup,upCX2picked,downCX2picked,leftCX2picked,rightCX2picked); 
                    
               end
       end
  
    case(CX)
       
       u=find(CdiffusionSP);
       %x=find(C3diffusionSP);
       %u=[u;x];
       N1=ceil(rand(1)*numel(u));
       ind1=u(N1);
       n1=ceil(ind1/W);
       m1=ind1-W*(n1-1);
       CX2pickedup=[m1 n1];  %pickup an random position for C or maybe C3

       upCX2picked=[CX2pickedup(1),CX2pickedup(2)+1]; % find the neighbours of this CX2 Species
       downCX2picked=[CX2pickedup(1),CX2pickedup(2)-1];
       leftCX2picked=[CX2pickedup(1)-1,CX2pickedup(2)];
       rightCX2picked=[CX2pickedup(1)+1,CX2pickedup(2)]; 
               
       CX2species=Conf(CX2pickedup(1),CX2pickedup(2));
        
       switch(CX2species)
           case(C)
               if sum((CX1pickedup-CX2pickedup).^2)==1       % when CX and C are sitting besides each other
                    Conf(CX2pickedup(1),CX2pickedup(2))=CX;  % update the configuration of the lattice
                    CXFSP(CX1pickedup(1),CX1pickedup(2))=CXFSP(CX1pickedup(1),CX1pickedup(2))-1; %remove CX formation at this site
                    if CXFSP(CX1pickedup(1),CX1pickedup(2))==0;
                        NZE(11)=NZE(11)-1;
                    end
                    CBdiffusionSP(CX2pickedup(1),CX2pickedup(2))=0;%remove C bulk diffusion at this site
                    NZE(20)=NZE(20)-1;
                    CdiffusionSP(CX2pickedup(1),CX2pickedup(2))=0; %remove C diffusion at this site
                    NZE(3)=NZE(3)-1;
                
                    if (CX2pickedup(1)==1)||(CX2pickedup(1)==W)||(CX2pickedup(2)==1)||(CX2pickedup(2)==L)
                        CCNTSP(CX2pickedup(1),CX2pickedup(2))=0;
                        NZE(19)=NZE(19)-1;
                    end
                
                    [NZE,Conf,CHPSP,C2FSP,C3FSP,CXFSP,CdiffusionSP]=rdCXFcheckCNB(NZE,Conf,W,L,H,C,C2,C3,CX,CHPSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,...
                        CX1pickedup,CX2pickedup,upCX2picked,downCX2picked,leftCX2picked,rightCX2picked);
         
                    ystore=scanCXempty(ystore,Conf,W,L,CX1pickedup,upCX1picked,downCX1picked,leftCX1picked,rightCX1picked,CX2pickedup,upCX2picked,downCX2picked,leftCX2picked,rightCX2picked);
               else  % thet are not neigbors
                    % find the CX' empty neighbor and update this neighbour empty site to CX
                    if upCX1picked(2)<=L&&Conf(upCX1picked(1),upCX1picked(2))==0 
                        Conf(upCX1picked(1),upCX1picked(2))=CX;
                        CXcheck2=upCX1picked;  
                    elseif downCX1picked(2)>=1&&Conf(downCX1picked(1),downCX1picked(2))==0
                        Conf(downCX1picked(1),downCX1picked(2))=CX;
                        CXcheck2=downCX1picked;
                    elseif leftCX1picked(1)>=1&&Conf(leftCX1picked(1),leftCX1picked(2))==0
                        Conf(leftCX1picked(1),leftCX1picked(2))=CX;
                        CXcheck2=leftCX1picked;
                    elseif rightCX1picked(1)<=W&&Conf(rightCX1picked(1),rightCX1picked(2))==0
                        Conf(rightCX1picked(1),rightCX1picked(2))=CX;
                        CXcheck2=rightCX1picked;
                    end
                    
                    upCXcheck2=[CXcheck2(1),CXcheck2(2)+1];       %the position of its neighbours
                    downCXcheck2=[CXcheck2(1),CXcheck2(2)-1];
                    leftCXcheck2=[CXcheck2(1)-1,CXcheck2(2)];
                    rightCXcheck2=[CXcheck2(1)+1,CXcheck2(2)];
                        
                    
                    Conf(CX2pickedup(1),CX2pickedup(2))=0;
                    CdiffusionSP(CX2pickedup(1),CX2pickedup(2))=0; %remove C diffusion at this site
                    NZE(3)=NZE(3)-1;
                    CBdiffusionSP(CX2pickedup(1),CX2pickedup(2))=0;%remove C bulk diffusion at this site
                    NZE(20)=NZE(20)-1;
                    
                    if CCNTSP(CX2pickedup(1),CX2pickedup(2))>0    
                        CCNTSP(CX2pickedup(1),CX2pickedup(2))=0;
                        NZE(19)=NZE(19)-1;
                    end
                    
                    [NZE,CXFSP,C3diffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,C3FSP]=redefineCXFcheckCNB2(NZE,Conf,W,L,C,C2,C3,CX,CXFSP,C3diffusionSP,H,CH3,...
                            CH2,CH,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,C3FSP,...
                            CX1pickedup,CXcheck2,CX2pickedup,upCX2picked,downCX2picked,leftCX2picked,rightCX2picked);
                    [NZE,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=redefineCXFcheckCXNB(NZE,Conf,W,L,H,C,CH3,CH2,CH,C2,C3,CX,CdiffusionSP,CH4DSP,...
                        CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,...
                        CX1pickedup,CX2pickedup,CXcheck2,upCXcheck2,downCXcheck2,leftCXcheck2,rightCXcheck2);
                    
                    ystore=scanNBP(ystore,Conf,W,L,CX,CX2pickedup,upCX2picked,downCX2picked,leftCX2picked,rightCX2picked,[],0,0,0,0);
                    ystore=scanCXempty(ystore,Conf,W,L,CX1pickedup,upCX1picked,downCX1picked,leftCX1picked,rightCX1picked,CXcheck2,upCXcheck2,downCXcheck2,leftCXcheck2,rightCXcheck2);
                    ystore=scanNBD(ystore,Conf,W,L,CX,upCXcheck2,downCXcheck2,leftCXcheck2,rightCXcheck2);
                    CCC=CCC+1;
               end                 
       end
       
end

end