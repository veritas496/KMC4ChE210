function [ystore,CCNTSP,NZE,Conf,CHDSP,CHPSP,CH2PSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CBdiffusionSP]=redefineCHproduction(NZE,...
                    W,L,Conf,H,CH,CHDSP,CHPSP,C,C2,C3,CX,CH2PSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,CH3,CH2,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,...
                    C3diffusionSP,CH4PSP,CCNTSP,CBdiffusionSP,ystore)

u=find(CdiffusionSP);
N1=ceil(rand(1)*numel(u));
ind1=u(N1);
n1=ceil(ind1/W);
m1=ind1-W*(n1-1);
Cpickedup=[m1 n1];  %pickup an random position for C

k=find(HdiffusionSP);
N2=ceil(rand(1)*numel(k));
ind2=k(N2);
n2=ceil(ind2/W);
m2=ind2-W*(n2-1);
Hpickedup=[m2 n2];  %pickup an random position for H

upCpicked=[Cpickedup(1),Cpickedup(2)+1];       %the position of its neighbours
downCpicked=[Cpickedup(1),Cpickedup(2)-1];
leftCpicked=[Cpickedup(1)-1,Cpickedup(2)];
rightCpicked=[Cpickedup(1)+1,Cpickedup(2)];

upHpicked=[Hpickedup(1),Hpickedup(2)+1]; % find the neighbours of this H
downHpicked=[Hpickedup(1),Hpickedup(2)-1];
leftHpicked=[Hpickedup(1)-1,Hpickedup(2)];
rightHpicked=[Hpickedup(1)+1,Hpickedup(2)];                                         

Conf(Cpickedup(1),Cpickedup(2))=CH;  % update the configuration of the lattice
Conf(Hpickedup(1),Hpickedup(2))=0;

CBdiffusionSP(Cpickedup(1),Cpickedup(2))=0;%remove C bulk diffusion at this site
NZE(20)=NZE(20)-1;

CdiffusionSP(Cpickedup(1),Cpickedup(2))=0;
NZE(3)=NZE(3)-1;
HdiffusionSP(Hpickedup(1),Hpickedup(2))=0;
NZE(1)=NZE(1)-1;

if (Cpickedup(1)==1)||(Cpickedup(1)==W)||(Cpickedup(2)==1)||(Cpickedup(2)==L)
      CCNTSP(Cpickedup(1),Cpickedup(2))=0;
      NZE(19)=NZE(19)-1;
end

if sum((Cpickedup-Hpickedup).^2)==1
    
    CHDSP(Cpickedup(1),Cpickedup(2))=1;%addevent(CHDSP,Cpickedup,'CHDSP');
    NZE(8)=NZE(8)+1;
    
    CHPSP(Cpickedup(1),Cpickedup(2))=0; %remove CH production at this site
    NZE(18)=NZE(18)-1;


   [NZE,CHDSP,CH2PSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,CHPSP,C3diffusionSP,CH4PSP]=rdCHPcheckNB(NZE,Conf,W,L,H,C,C2,C3,...
               CX,CHDSP,CH2PSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,CH3,CH2,CH,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,CHPSP,C3diffusionSP,CH4PSP,...
                            Cpickedup,upCpicked,downCpicked,leftCpicked,rightCpicked,Hpickedup,upHpicked,downHpicked,leftHpicked,rightHpicked);           
    
    ystore=scanNBP(ystore,Conf,W,L,CX,[],upCpicked,downCpicked,leftCpicked,rightCpicked,Hpickedup,upHpicked,downHpicked,leftHpicked,rightHpicked);

else
    ystore=scanNBP(ystore,Conf,W,L,CX,[],upCpicked,downCpicked,leftCpicked,rightCpicked,Hpickedup,upHpicked,downHpicked,leftHpicked,rightHpicked);

    
    [NZE,CHDSP,CH2PSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,CHPSP,C3diffusionSP,CH4PSP]=redefineCHPcheckNB(NZE,Conf,W,L,H,C,C2,C3,...
    CX,CHDSP,CH2PSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,CH3,CH2,CH,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,CHPSP,C3diffusionSP,CH4PSP,...
    Cpickedup,upCpicked,downCpicked,leftCpicked,rightCpicked,Hpickedup,upHpicked,downHpicked,leftHpicked,rightHpicked); 

end
end