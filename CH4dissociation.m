function [CH3pickedup,Hpickedup,ystore,NZE,CH4DSP,Conf,CH4PSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,CH3PSP,CH2PSP,CHPSP,H2PSP]=CH4dissociation(NZE,CH4DSP,W,L,Conf,H,...
    CH3,CH4PSP,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,CH3PSP,CH2PSP,CHPSP,H2PSP,ystore,CX)
Hstore=zeros(4,2);

k=find(CH4DSP);
N=ceil(rand(1)*numel(k));
ind=k(N);
n=ceil(ind/W);
m=ind-W*(n-1);
CH3pickedup=[m n]; %pickup an random position for CH3

upCH3picked=[CH3pickedup(1),CH3pickedup(2)+1];       %the position of its neighbours
downCH3picked=[CH3pickedup(1),CH3pickedup(2)-1];
leftCH3picked=[CH3pickedup(1)-1,CH3pickedup(2)];
rightCH3picked=[CH3pickedup(1)+1,CH3pickedup(2)];
 
if upCH3picked(2)<=L&Conf(upCH3picked(1),upCH3picked(2))==0 %find the CH3 neighbours which is empty to accommedate H
    Hstore(1,:)=upCH3picked;
end
if downCH3picked(2)>=1&Conf(downCH3picked(1),downCH3picked(2))==0
    Hstore(2,:)=downCH3picked;
end
if leftCH3picked(1)>=1&Conf(leftCH3picked(1),leftCH3picked(2))==0
    Hstore(3,:)=leftCH3picked;
end
if rightCH3picked(1)<=W&Conf(rightCH3picked(1),rightCH3picked(2))==0
    Hstore(4,:)=rightCH3picked;
end

if Hstore==zeros(4,2)
    Hpickedup=0;
else
index=find(Hstore(:,1));
row=ceil(rand(1)*length(index));
Hpickedup=Hstore(index(row),:);  % randomly pick up an position which is 0 

upHpicked=[Hpickedup(1),Hpickedup(2)+1]; % find the neighbours of this H
downHpicked=[Hpickedup(1),Hpickedup(2)-1];
leftHpicked=[Hpickedup(1)-1,Hpickedup(2)];
rightHpicked=[Hpickedup(1)+1,Hpickedup(2)];                                         

Conf(CH3pickedup(1),CH3pickedup(2))=CH3;  % update the configuration of the lattice
Conf(Hpickedup(1),Hpickedup(2))=H;

CH4PSP(CH3pickedup(1),CH3pickedup(2))=1;%addevent(CH4PSP,CH3pickedup,'CH4PSP');
NZE(15)=NZE(15)+1;

CH4DSP(CH3pickedup(1),CH3pickedup(2))=0; %remove CH4dissociation at this site
CH4DSP(Hpickedup(1),Hpickedup(2))=0; %remove CH4dissociation at this site
NZE(5)=NZE(5)-2;


[NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,H2PSP]=CH4DcheckNB(NZE,Conf,W,L,H,CH3,CH2,CH,C,C3,...
      HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,H2PSP,...
          CH3pickedup,upCH3picked,downCH3picked,leftCH3picked,rightCH3picked,Hpickedup,upHpicked,downHpicked,leftHpicked,rightHpicked);  
      
ystore=scanNBD(ystore,Conf,W,L,CX,upCH3picked,downCH3picked,leftCH3picked,rightCH3picked);
ystore=scanNBD(ystore,Conf,W,L,CX,upHpicked,downHpicked,leftHpicked,rightHpicked);

end

end