function [C1pickedup,C2pickedup,ystore,CCNTSP,NZE,Conf,C2FSP,CHPSP,C3FSP,CXFSP,CdiffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP,CBdiffusionSP]=redefineC2formation(NZE,W,L,Conf,C,C2,C2FSP,H,CX,...
    CHPSP,C3FSP,CXFSP,CdiffusionSP,CH3,CH2,CH,C3,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP,CCNTSP,CBdiffusionSP,ystore)

k=find(CdiffusionSP);
N=ceil(rand(1)*numel(k));
ind1=k(N);
if N==1
   ind2=k(N+1);
else
   ind2=k(N-1);
end
   
n1=ceil(ind1/W);
m1=ind1-W*(n1-1);
C1pickedup=[m1 n1];  %pickup an random position for C1

upC1picked=[C1pickedup(1),C1pickedup(2)+1];       %the position of C1 neighbours
downC1picked=[C1pickedup(1),C1pickedup(2)-1];
leftC1picked=[C1pickedup(1)-1,C1pickedup(2)];
rightC1picked=[C1pickedup(1)+1,C1pickedup(2)];

n2=ceil(ind2/W);
m2=ind2-W*(n2-1);
C2pickedup=[m2 n2];  %pickup an random position for C2

upC2picked=[C2pickedup(1),C2pickedup(2)+1]; % find the neighbours of this C2
downC2picked=[C2pickedup(1),C2pickedup(2)-1];
leftC2picked=[C2pickedup(1)-1,C2pickedup(2)];
rightC2picked=[C2pickedup(1)+1,C2pickedup(2)];                                         

Conf(C1pickedup(1),C1pickedup(2))=C2;  % update the configuration of the lattice
Conf(C2pickedup(1),C2pickedup(2))=0;
    
CBdiffusionSP(C1pickedup(1),C1pickedup(2))=0;%remove C bulk diffusion at this site
CBdiffusionSP(C2pickedup(1),C2pickedup(2))=0;%remove C bulk diffusion at this site
NZE(20)=NZE(20)-2;

CdiffusionSP(C1pickedup(1),C1pickedup(2))=0;%remove C bulk diffusion at this site
CdiffusionSP(C2pickedup(1),C2pickedup(2))=0;%remove C bulk diffusion at this site
NZE(3)=NZE(3)-2;

if (C1pickedup(1)==1)||(C1pickedup(1)==W)||(C1pickedup(2)==1)||(C1pickedup(2)==L)
      CCNTSP(C1pickedup(1),C1pickedup(2))=0;
      NZE(19)=NZE(19)-1;
end

if (C2pickedup(1)==1)||(C2pickedup(1)==W)||(C2pickedup(2)==1)||(C2pickedup(2)==L)
      CCNTSP(C2pickedup(1),C2pickedup(2))=0;
      NZE(19)=NZE(19)-1;
end

if sum((C1pickedup-C2pickedup).^2)==1  % C1 and C2 just sitting beside each other

    C2FSP(C1pickedup(1),C1pickedup(2))=0; %remove C2 formation at this site
    C2FSP(C2pickedup(1),C2pickedup(2))=0; %remove C2 formation at this site
    NZE(9)=NZE(9)-2;
    
    [NZE,CHPSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP]=rdC2FcheckNB(NZE,Conf,W,L,H,C,C2,CX,CHPSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,...
    CH3,CH2,CH,C3,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP,...
    C1pickedup,upC1picked,downC1picked,leftC1picked,rightC1picked,C2pickedup,upC2picked,downC2picked,leftC2picked,rightC2picked);           

else
    
    [NZE,CHPSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP]=redefineC2FcheckNB(NZE,Conf,W,L,H,C,C2,CX,CHPSP,C2FSP,C3FSP,...
        CXFSP,CdiffusionSP,CH3,CH2,CH,C3,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP,...
        C1pickedup,upC1picked,downC1picked,leftC1picked,rightC1picked,C2pickedup,upC2picked,downC2picked,leftC2picked,rightC2picked);           
end

ystore=scanNBP(ystore,Conf,W,L,CX,C2pickedup,upC2picked,downC2picked,leftC2picked,rightC2picked,[],0,0,0,0);

end
