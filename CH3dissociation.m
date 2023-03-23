function [ystore,NZE,Conf,CH3DSP,CH3PSP,CH2DSP,CH4PSP,HdiffusionSP,CH4DSP,H2PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP]=CH3dissociation(NZE,W,L,Conf,H,CH2,CH3DSP,...
    CH3PSP,CH2DSP,CH4PSP,CH3,CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,ystore,CX)
Hstore=zeros(4,2);

k=find(CH3DSP);
N=ceil(rand(1)*numel(k));
ind=k(N);
n=ceil(ind/W);
m=ind-W*(n-1);
CH2pickedup=[m n];  %pickup an random position for CH2

upCH2picked=[CH2pickedup(1),CH2pickedup(2)+1];       %the position of its neighbours
downCH2picked=[CH2pickedup(1),CH2pickedup(2)-1];
leftCH2picked=[CH2pickedup(1)-1,CH2pickedup(2)];
rightCH2picked=[CH2pickedup(1)+1,CH2pickedup(2)];

if upCH2picked(2)<=L&&Conf(upCH2picked(1),upCH2picked(2))==0 %find the CH2 neighbours which is empty to accommedate H
    Hstore(1,:)=upCH2picked;
end
if downCH2picked(2)>=1&&Conf(downCH2picked(1),downCH2picked(2))==0
    Hstore(2,:)=downCH2picked;
end
if leftCH2picked(1)>=1&&Conf(leftCH2picked(1),leftCH2picked(2))==0
    Hstore(3,:)=leftCH2picked;
end
if rightCH2picked(1)<=W&&Conf(rightCH2picked(1),rightCH2picked(2))==0
    Hstore(4,:)=rightCH2picked;
end

index=find(Hstore(:,1));
row=ceil(rand(1)*length(index));
Hpickedup=Hstore(index(row),:);  % randomly pick up an position for H

upHpicked=[Hpickedup(1),Hpickedup(2)+1]; % find the neighbours of this H
downHpicked=[Hpickedup(1),Hpickedup(2)-1];
leftHpicked=[Hpickedup(1)-1,Hpickedup(2)];
rightHpicked=[Hpickedup(1)+1,Hpickedup(2)];                                         

Conf(CH2pickedup(1),CH2pickedup(2))=CH2;  % update the configuration of the lattice
Conf(Hpickedup(1),Hpickedup(2))=H;

CH3PSP(CH2pickedup(1),CH2pickedup(2))=1;%addevent(CH3PSP,CH2pickedup,'CH3PSP');
NZE(16)=NZE(16)+1;
CH3DSP(CH2pickedup(1),CH2pickedup(2))=0; %remove CH3dissociation at this site
NZE(6)=NZE(6)-1;

[NZE,CH2DSP,CH3PSP,CH4PSP,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP]=CH3DcheckNB(NZE,Conf,W,L,H,CH2DSP,CH3PSP,CH4PSP,...
         CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,...
         CH2pickedup,upCH2picked,downCH2picked,leftCH2picked,rightCH2picked,Hpickedup,upHpicked,downHpicked,leftHpicked,rightHpicked); 
 
ystore=scanNBD(ystore,Conf,W,L,CX,upHpicked,downHpicked,leftHpicked,rightHpicked);


end