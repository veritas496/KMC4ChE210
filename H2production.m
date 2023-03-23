function [ystore,NZE,Conf,H2PSP,H2Num,CH4DSP,HdiffusionSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP]=H2production(NZE,W,L,Conf,H,H2PSP,H2Num,...
    CH4DSP,CH3,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP,ystore,CX)
Hstore=zeros(4,2);

k=find(H2PSP);
N=ceil(rand(1)*numel(k));
ind=k(N);
n=ceil(ind/W);
m=ind-W*(n-1);
H1pickedup=[m n];  %pickup an random position for H1


upH1picked=[H1pickedup(1),H1pickedup(2)+1];       %the position of its neighbours
downH1picked=[H1pickedup(1),H1pickedup(2)-1];
leftH1picked=[H1pickedup(1)-1,H1pickedup(2)];
rightH1picked=[H1pickedup(1)+1,H1pickedup(2)];

if upH1picked(2)<=L&&Conf(upH1picked(1),upH1picked(2))==H %find the H neighbours which is H 
    Hstore(1,:)=upH1picked;
end
if downH1picked(2)>=1&&Conf(downH1picked(1),downH1picked(2))==H
    Hstore(2,:)=downH1picked;
end
if leftH1picked(1)>=1&&Conf(leftH1picked(1),leftH1picked(2))==H
    Hstore(3,:)=leftH1picked;
end
if rightH1picked(1)<=W&&Conf(rightH1picked(1),rightH1picked(2))==H
    Hstore(4,:)=rightH1picked;
end

index=find(Hstore(:,1));
row=ceil(rand(1)*length(index));
H2pickedup=Hstore(index(row),:);  % randomly pick up an position which is H 

upH2picked=[H2pickedup(1),H2pickedup(2)+1]; % find the neighbours of this H2
downH2picked=[H2pickedup(1),H2pickedup(2)-1];
leftH2picked=[H2pickedup(1)-1,H2pickedup(2)];
rightH2picked=[H2pickedup(1)+1,H2pickedup(2)];                                         

Conf(H1pickedup(1),H1pickedup(2))=0;  % update the configuration of the lattice
Conf(H2pickedup(1),H2pickedup(2))=0;
H2Num=H2Num+1;
               
CH4DSP(H1pickedup(1),H1pickedup(2))=1;%addevent(CH4DSP,H1pickedup,'CH4DSP');
CH4DSP(H2pickedup(1),H2pickedup(2))=1;%addevent(CH4DSP,H2pickedup,'CH4DSP');
NZE(5)=NZE(5)+2;
H2PSP(H1pickedup(1),H1pickedup(2))=0; %remove H2production at this site
H2PSP(H2pickedup(1),H2pickedup(2))=0;% %remove H2production at this site
NZE(12)=NZE(12)-2;

ystore=scanNBP(ystore,Conf,W,L,CX,H1pickedup,upH1picked,downH1picked,leftH1picked,rightH1picked,H2pickedup,upH2picked,downH2picked,leftH2picked,rightH2picked);


[NZE,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP]=H2PcheckNB(NZE,Conf,W,L,H,CH3,CH2,CH,C,C3,...
 HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP,...
 H1pickedup,upH1picked,downH1picked,leftH1picked,rightH1picked,H2pickedup,upH2picked,downH2picked,leftH2picked,rightH2picked);           
 
end