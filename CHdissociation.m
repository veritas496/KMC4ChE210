function [ystore,CCNTSP,NZE,Conf,CHDSP,CHPSP,CdiffusionSP,CH2PSP,C2FSP,C3FSP,CXFSP,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CBdiffusionSP]=CHdissociation(NZE,W,L,Conf,H,C,CHDSP,CHPSP,...
    C2,C3,CX,CdiffusionSP,CH2PSP,C2FSP,C3FSP,CXFSP,CH3,CH2,CH,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CCNTSP,CBdiffusionSP,ystore)
Hstore=zeros(4,2);

k=find(CHDSP);
N=ceil(rand(1)*numel(k));
ind=k(N);
n=ceil(ind/W);
m=ind-W*(n-1);
Cpickedup=[m n];  %pickup an random position for C

upCpicked=[Cpickedup(1),Cpickedup(2)+1];       %the position of its neighbours
downCpicked=[Cpickedup(1),Cpickedup(2)-1];
leftCpicked=[Cpickedup(1)-1,Cpickedup(2)];
rightCpicked=[Cpickedup(1)+1,Cpickedup(2)];

if upCpicked(2)<=L&&Conf(upCpicked(1),upCpicked(2))==0 %find the C neighbours which is empty to accommedate H
    Hstore(1,:)=upCpicked;
end
if downCpicked(2)>=1&&Conf(downCpicked(1),downCpicked(2))==0
    Hstore(2,:)=downCpicked;
end
if leftCpicked(1)>=1&&Conf(leftCpicked(1),leftCpicked(2))==0
    Hstore(3,:)=leftCpicked;
end
if rightCpicked(1)<=W&&Conf(rightCpicked(1),rightCpicked(2))==0
    Hstore(4,:)=rightCpicked;
end

index=find(Hstore(:,1));
row=ceil(rand(1)*length(index));
Hpickedup=Hstore(index(row),:);  % randomly pick up an position for H

upHpicked=[Hpickedup(1),Hpickedup(2)+1]; % find the neighbours of this H
downHpicked=[Hpickedup(1),Hpickedup(2)-1];
leftHpicked=[Hpickedup(1)-1,Hpickedup(2)];
rightHpicked=[Hpickedup(1)+1,Hpickedup(2)];                                         

Conf(Cpickedup(1),Cpickedup(2))=C;  % update the configuration of the lattice
Conf(Hpickedup(1),Hpickedup(2))=H;

CHPSP(Cpickedup(1),Cpickedup(2))=1;%addevent(CHPSP,Cpickedup,'CHPSP');
NZE(18)=NZE(18)+1;
CHDSP(Cpickedup(1),Cpickedup(2))=0; %remove CHdissociation at this site
NZE(8)=NZE(8)-1;
CBdiffusionSP(Cpickedup(1),Cpickedup(2))=1;%add C bulk diffusion at this site
NZE(20)=NZE(20)+1;

if (Cpickedup(1)==1)||(Cpickedup(1)==W)||(Cpickedup(2)==1)||(Cpickedup(2)==L)
     CCNTSP(Cpickedup(1),Cpickedup(2))=1;
     NZE(19)=NZE(19)+1;
end

[NZE,CdiffusionSP,CH2PSP,C2FSP,C3FSP,CXFSP,CHPSP,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,C3diffusionSP,CH4PSP]=CHDcheckNB(NZE,Conf,W,L,H,C,C2,C3,...
       CX,CdiffusionSP,CH2PSP,C2FSP,C3FSP,CXFSP,CHPSP,CH3,CH2,CH,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,C3diffusionSP,CH4PSP,...
             Cpickedup,upCpicked,downCpicked,leftCpicked,rightCpicked,Hpickedup,upHpicked,downHpicked,leftHpicked,rightHpicked);   
         
ystore=scanNBD(ystore,Conf,W,L,CX,upHpicked,downHpicked,leftHpicked,rightHpicked);

end