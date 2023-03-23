function [C2pickedup,Cpickedup,ystore,CCNTSP,NZE,Conf,C3diffusionSP,C3FSP,CXFSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,CBdiffusionSP]=redefineC3formation(NZE,W,L,Conf,C3diffusionSP,C,C3,C3FSP,C2,CX,...
    CXFSP,H,CH3,CH2,CH,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,CCNTSP,CBdiffusionSP,ystore)

u=find(CdiffusionSP);
N1=ceil(rand(1)*numel(u));
ind1=u(N1);
n1=ceil(ind1/W);
m1=ind1-W*(n1-1);
Cpickedup=[m1 n1];  %pickup an random position for C

k=find(Conf==C2);
N2=ceil(rand(1)*numel(k));
ind2=k(N2);
n2=ceil(ind2/W);
m2=ind2-W*(n2-1);
C2pickedup=[m2 n2];  %pickup an random position for C2

upCpicked=[Cpickedup(1),Cpickedup(2)+1]; % find the neighbours of this C
downCpicked=[Cpickedup(1),Cpickedup(2)-1];
leftCpicked=[Cpickedup(1)-1,Cpickedup(2)];
rightCpicked=[Cpickedup(1)+1,Cpickedup(2)];   

upC2picked=[C2pickedup(1),C2pickedup(2)+1];       %the position of its neighbours
downC2picked=[C2pickedup(1),C2pickedup(2)-1];
leftC2picked=[C2pickedup(1)-1,C2pickedup(2)];
rightC2picked=[C2pickedup(1)+1,C2pickedup(2)];

Conf(C2pickedup(1),C2pickedup(2))=C3;  % update the configuration of the lattice
Conf(Cpickedup(1),Cpickedup(2))=0;

CdiffusionSP(Cpickedup(1),Cpickedup(2))=0;%remove C bulk diffusion at this site
NZE(3)=NZE(3)-1;

CBdiffusionSP(Cpickedup(1),Cpickedup(2))=0;%remove C bulk diffusion at this site
NZE(20)=NZE(20)-1;

if CCNTSP(Cpickedup(1),Cpickedup(2))>0    % when C is sitting on the BC site
     CCNTSP(Cpickedup(1),Cpickedup(2))=0;
     NZE(19)=NZE(19)-1;
end

if C2pickedup(1)==1||C2pickedup(1)==W||C2pickedup(2)==1||C2pickedup(2)==W % when C2 is sitting on the BC site
      CCNTSP(C2pickedup(1),C2pickedup(2))=1;
       NZE(19)=NZE(19)+1;
end

if sum((Cpickedup-C2pickedup).^2)==1

    C3diffusionSP(C2pickedup(1),C2pickedup(2))=1;%addevent(C3diffusionSP,C2pickedup,'C3diffusionSP');
    NZE(4)=NZE(4)+1;
    C3FSP(C2pickedup(1),C2pickedup(2))=0; %remove C3 formation at this site
    NZE(10)=NZE(10)-1;

   [NZE,CXFSP,C3diffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,C3FSP]=rdC3FcheckNB(NZE,Conf,W,L,C,C2,C3,CX,CXFSP,C3diffusionSP,H,CH3,...
               CH2,CH,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,C3FSP,...
               C2pickedup,upC2picked,downC2picked,leftC2picked,rightC2picked,Cpickedup,upCpicked,downCpicked,leftCpicked,rightCpicked);   
                        
    ystore=scanNBP(ystore,Conf,W,L,CX,Cpickedup,upCpicked,downCpicked,leftCpicked,rightCpicked,[],0,0,0,0);
    
else 
    
    [NZE,CXFSP,C3diffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,C3FSP]=redefineC3FcheckNB(NZE,Conf,W,L,C,C2,C3,CX,CXFSP,C3diffusionSP,H,CH3,...
                            CH2,CH,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,C3FSP,...
                            C2pickedup,upC2picked,downC2picked,leftC2picked,rightC2picked,Cpickedup,upCpicked,downCpicked,leftCpicked,rightCpicked); 
                        
    ystore=scanNBP(ystore,Conf,W,L,CX,Cpickedup,upCpicked,downCpicked,leftCpicked,rightCpicked,[],0,0,0,0);
   
end

end
