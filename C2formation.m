function [ystore,CCNTSP,NZE,Conf,C2FSP,CHPSP,C3FSP,CXFSP,CdiffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP,CBdiffusionSP]=C2formation(NZE,W,L,Conf,C,C2,C2FSP,H,CX,...
    CHPSP,C3FSP,CXFSP,CdiffusionSP,CH3,CH2,CH,C3,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP,CCNTSP,CBdiffusionSP,ystore)
Cstore=zeros(4,2);

k=find(C2FSP);
N=ceil(rand(1)*numel(k));
ind=k(N);
n=ceil(ind/W);
m=ind-W*(n-1);
C1pickedup=[m n];  %pickup an random position for C1

upC1picked=[C1pickedup(1),C1pickedup(2)+1];       %the position of its neighbours
downC1picked=[C1pickedup(1),C1pickedup(2)-1];
leftC1picked=[C1pickedup(1)-1,C1pickedup(2)];
rightC1picked=[C1pickedup(1)+1,C1pickedup(2)];

if upC1picked(2)<=L&&Conf(upC1picked(1),upC1picked(2))==C %find the C1 neighbours which is C 
    Cstore(1,:)=upC1picked;
end
if downC1picked(2)>=1&&Conf(downC1picked(1),downC1picked(2))==C
    Cstore(2,:)=downC1picked;
end
if leftC1picked(1)>=1&&Conf(leftC1picked(1),leftC1picked(2))==C
    Cstore(3,:)=leftC1picked;
end
if rightC1picked(1)<=W&&Conf(rightC1picked(1),rightC1picked(2))==C
    Cstore(4,:)=rightC1picked;
end

index=find(Cstore(:,1));
row=ceil(rand(1)*length(index));
C2pickedup=Cstore(index(row),:);  % randomly pick up an position which is C 

upC2picked=[C2pickedup(1),C2pickedup(2)+1]; % find the neighbours of this C2
downC2picked=[C2pickedup(1),C2pickedup(2)-1];
leftC2picked=[C2pickedup(1)-1,C2pickedup(2)];
rightC2picked=[C2pickedup(1)+1,C2pickedup(2)];                                         

Conf(C1pickedup(1),C1pickedup(2))=C2;  % update the configuration of the lattice
Conf(C2pickedup(1),C2pickedup(2))=0;

C2FSP(C1pickedup(1),C1pickedup(2))=0; %remove C2 formation at this site
C2FSP(C2pickedup(1),C2pickedup(2))=0; %remove C2 formation at this site
NZE(9)=NZE(9)-2;
CBdiffusionSP(C1pickedup(1),C1pickedup(2))=0;%remove C bulk diffusion at this site
CBdiffusionSP(C2pickedup(1),C2pickedup(2))=0;%remove C bulk diffusion at this site
NZE(20)=NZE(20)-2;

if (C1pickedup(1)==1)||(C1pickedup(1)==W)||(C1pickedup(2)==1)||(C1pickedup(2)==L)
     CCNTSP(C1pickedup(1),C1pickedup(2))=0;
     NZE(19)=NZE(19)-1;
end

if (C2pickedup(1)==1)||(C2pickedup(1)==W)||(C2pickedup(2)==1)||(C2pickedup(2)==L)
     CCNTSP(C2pickedup(1),C2pickedup(2))=0;
     NZE(19)=NZE(19)-1;
end

[NZE,CHPSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP]=C2FcheckNB(NZE,Conf,W,L,H,C,C2,CX,...
    CHPSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,CH3,CH2,CH,C3,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP,...
    C1pickedup,upC1picked,downC1picked,leftC1picked,rightC1picked,C2pickedup,upC2picked,downC2picked,leftC2picked,rightC2picked);

ystore=scanNBP(ystore,Conf,W,L,CX,C2pickedup,upC2picked,downC2picked,leftC2picked,rightC2picked,[],0,0,0,0);

end
