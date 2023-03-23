function [ystore,NZE,Conf,CH2DSP,CH2PSP,CH3PSP,CHDSP,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP]=CH2dissociation(NZE,W,L,Conf,H,CH,CH2DSP,...
    CH2PSP,CH3PSP,CHDSP,CH3,CH2,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP,ystore,CX)
Hstore=zeros(4,2);

k=find(CH2DSP);
N=ceil(rand(1)*numel(k));
ind=k(N);
n=ceil(ind/W);
m=ind-W*(n-1);
CHpickedup=[m n];  %pickup an random position for CH

upCHpicked=[CHpickedup(1),CHpickedup(2)+1];       %the position of its neighbours
downCHpicked=[CHpickedup(1),CHpickedup(2)-1];
leftCHpicked=[CHpickedup(1)-1,CHpickedup(2)];
rightCHpicked=[CHpickedup(1)+1,CHpickedup(2)];

if upCHpicked(2)<=L&&Conf(upCHpicked(1),upCHpicked(2))==0 %find the CH neighbours which is empty to accommedate H
    Hstore(1,:)=upCHpicked;
end
if downCHpicked(2)>=1&&Conf(downCHpicked(1),downCHpicked(2))==0
    Hstore(2,:)=downCHpicked;
end
if leftCHpicked(1)>=1&&Conf(leftCHpicked(1),leftCHpicked(2))==0
    Hstore(3,:)=leftCHpicked;
end
if rightCHpicked(1)<=W&&Conf(rightCHpicked(1),rightCHpicked(2))==0
    Hstore(4,:)=rightCHpicked;
end

index=find(Hstore(:,1));
row=ceil(rand(1)*length(index));
Hpickedup=Hstore(index(row),:);  % randomly pick up an position for H

upHpicked=[Hpickedup(1),Hpickedup(2)+1]; % find the neighbours of this H
downHpicked=[Hpickedup(1),Hpickedup(2)-1];
leftHpicked=[Hpickedup(1)-1,Hpickedup(2)];
rightHpicked=[Hpickedup(1)+1,Hpickedup(2)];                                         

Conf(CHpickedup(1),CHpickedup(2))=CH;  % update the configuration of the lattice
Conf(Hpickedup(1),Hpickedup(2))=H;

CH2PSP(CHpickedup(1),CHpickedup(2))=1;%addevent(CH2PSP,CHpickedup,'CH2PSP');
NZE(17)=NZE(17)+1;
CH2DSP(CHpickedup(1),CHpickedup(2))=0; %remove CH2dissociation at this site
NZE(7)=NZE(7)-1;

ystore=scanNBD(ystore,Conf,W,L,CX,upHpicked,downHpicked,leftHpicked,rightHpicked);

[NZE,CH2PSP,CH3PSP,CHDSP,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP]=CH2DcheckNB(NZE,Conf,W,L,H,CH2PSP,CH3PSP,CHDSP,...
          CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP,...
          CHpickedup,upCHpicked,downCHpicked,leftCHpicked,rightCHpicked,Hpickedup,upHpicked,downHpicked,leftHpicked,rightHpicked);           

end