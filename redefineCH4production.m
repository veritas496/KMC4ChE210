function [ystore,NZE,CH4PSP,Conf,CH4DSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP]=redefineCH4production(NZE,CH4PSP,W,L,Conf,H,CH4DSP,...
    CH3,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP,ystore,CX)

u=find(CH3DSP);
N1=ceil(rand(1)*numel(u));
ind1=u(N1);
n1=ceil(ind1/W);
m1=ind1-W*(n1-1);
CH3pickedup=[m1 n1];  %pickup an random position for CH3

k=find(HdiffusionSP);
N2=ceil(rand(1)*numel(k));
ind2=k(N2);
n2=ceil(ind2/W);
m2=ind2-W*(n2-1);
Hpickedup=[m2 n2];  %pickup an random position for H

upCH3picked=[CH3pickedup(1),CH3pickedup(2)+1];       %the position of its neighbours
downCH3picked=[CH3pickedup(1),CH3pickedup(2)-1];
leftCH3picked=[CH3pickedup(1)-1,CH3pickedup(2)];
rightCH3picked=[CH3pickedup(1)+1,CH3pickedup(2)];

upHpicked=[Hpickedup(1),Hpickedup(2)+1]; % find the neighbours of this H
downHpicked=[Hpickedup(1),Hpickedup(2)-1];
leftHpicked=[Hpickedup(1)-1,Hpickedup(2)];
rightHpicked=[Hpickedup(1)+1,Hpickedup(2)];                                         
                                        
Conf(CH3pickedup(1),CH3pickedup(2))=0;  % update the configuration of the lattice
Conf(Hpickedup(1),Hpickedup(2))=0;

CH3DSP(CH3pickedup(1),CH3pickedup(2))=0;
NZE(6)=NZE(6)-1;
HdiffusionSP(Hpickedup(1),Hpickedup(2))=0;
NZE(1)=NZE(1)-1;

if sum((CH3pickedup-Hpickedup).^2)==1
    CH4DSP(CH3pickedup(1),CH3pickedup(2))=1;%addevent(CH4DSP,CH3pickedup,'CH4DSP');
    CH4DSP(Hpickedup(1),Hpickedup(2))=1;%addevent(CH4DSP,Hpickedup,'CH4DSP');
    NZE(5)=NZE(5)+2;

    CH4PSP(CH3pickedup(1),CH3pickedup(2))=0; %remove CH4production at this site
    NZE(15)=NZE(15)-1;

    [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=rdCH4PcheckNB(NZE,Conf,W,L,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
           CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,...
           CH3pickedup,upCH3picked,downCH3picked,leftCH3picked,rightCH3picked,Hpickedup,upHpicked,downHpicked,leftHpicked,rightHpicked);          
 
    ystore=scanNBP(ystore,Conf,W,L,CX,CH3pickedup,upCH3picked,downCH3picked,leftCH3picked,rightCH3picked,Hpickedup,upHpicked,downHpicked,leftHpicked,rightHpicked);
else
    

    [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=redefineCH4PcheckNB(NZE,Conf,W,L,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
           CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,...
           CH3pickedup,upCH3picked,downCH3picked,leftCH3picked,rightCH3picked,Hpickedup,upHpicked,downHpicked,leftHpicked,rightHpicked); 
    
    ystore=scanNBP(ystore,Conf,W,L,CX,CH3pickedup,upCH3picked,downCH3picked,leftCH3picked,rightCH3picked,Hpickedup,upHpicked,downHpicked,leftHpicked,rightHpicked);  
end
end