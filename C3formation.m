function [ystore,CCNTSP,NZE,Conf,C3diffusionSP,C3FSP,CXFSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,CBdiffusionSP]=C3formation(NZE,W,L,Conf,...
    C3diffusionSP,C,C3,C3FSP,C2,CX,CXFSP,H,CH3,CH2,CH,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,CCNTSP,CBdiffusionSP,ystore)
Cstore=zeros(4,2); 

k=find(C3FSP);
N=ceil(rand(1)*numel(k));
ind=k(N);
n=ceil(ind/W);
m=ind-W*(n-1);
C2pickedup=[m n];  %pickup an random position for C2

upC2picked=[C2pickedup(1),C2pickedup(2)+1];       %the position of its neighbours
downC2picked=[C2pickedup(1),C2pickedup(2)-1];
leftC2picked=[C2pickedup(1)-1,C2pickedup(2)];
rightC2picked=[C2pickedup(1)+1,C2pickedup(2)];

if upC2picked(2)<=L&&Conf(upC2picked(1),upC2picked(2))==C %find the C2 neighbours which is C 
    Cstore(1,:)=upC2picked;
end
if downC2picked(2)>=1&&Conf(downC2picked(1),downC2picked(2))==C
    Cstore(2,:)=downC2picked;
end
if leftC2picked(1)>=1&&Conf(leftC2picked(1),leftC2picked(2))==C
    Cstore(3,:)=leftC2picked;
end
if rightC2picked(1)<=W&&Conf(rightC2picked(1),rightC2picked(2))==C
    Cstore(4,:)=rightC2picked;
end

index=find(Cstore(:,1));
row=ceil(rand(1)*length(index));
Cpickedup=Cstore(index(row),:);   % randomly pick up an position which is C 

upCpicked=[Cpickedup(1),Cpickedup(2)+1]; % find the neighbours of this C
downCpicked=[Cpickedup(1),Cpickedup(2)-1];
leftCpicked=[Cpickedup(1)-1,Cpickedup(2)];
rightCpicked=[Cpickedup(1)+1,Cpickedup(2)];                                         

Conf(C2pickedup(1),C2pickedup(2))=C3;  % update the configuration of the lattice
Conf(Cpickedup(1),Cpickedup(2))=0;

C3diffusionSP(C2pickedup(1),C2pickedup(2))=1;%addevent(C3diffusionSP,C2pickedup,'C3diffusionSP');
NZE(4)=NZE(4)+1;
C3FSP(C2pickedup(1),C2pickedup(2))=0; %remove C3 formation at this site
NZE(10)=NZE(10)-1;
CBdiffusionSP(Cpickedup(1),Cpickedup(2))=0;%remove C bulk diffusion at this site
NZE(20)=NZE(20)-1;

if (C2pickedup(1)==1)||(C2pickedup(1)==W)||(C2pickedup(2)==1)||(C2pickedup(2)==L)
     CCNTSP(C2pickedup(1),C2pickedup(2))=1;
     NZE(19)=NZE(19)+1;
end

if (Cpickedup(1)==1)||(Cpickedup(1)==W)||(Cpickedup(2)==1)||(Cpickedup(2)==L)
     CCNTSP(Cpickedup(1),Cpickedup(2))=0;
     NZE(19)=NZE(19)-1;
end

[NZE,CXFSP,C3diffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,C3FSP]=C3FcheckNB(NZE,Conf,W,L,C,C2,C3,CX,CXFSP,C3diffusionSP,H,CH3,...
           CH2,CH,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,C3FSP,C2pickedup,upC2picked,downC2picked,leftC2picked,rightC2picked,...
                       Cpickedup,upCpicked,downCpicked,leftCpicked,rightCpicked); 

ystore=scanNBP(ystore,Conf,W,L,CX,Cpickedup,upCpicked,downCpicked,leftCpicked,rightCpicked,[],0,0,0,0);


end
