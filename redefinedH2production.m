function [ystore,NZE,Conf,H2PSP,H2Num,CH4DSP,HdiffusionSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP]=redefinedH2production(NZE,W,L,Conf,H,...
    H2PSP,H2Num,CH4DSP,CH3,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP,ystore,CX)


k=find(HdiffusionSP);
N=ceil(rand(1)*numel(k));
ind1=k(N);
if N==1
   ind2=k(N+1);
else
   ind2=k(N-1);
end
   
n1=ceil(ind1/W);
m1=ind1-W*(n1-1);
H1pickedup=[m1 n1];  %pickup an random position for H1

upH1picked=[H1pickedup(1),H1pickedup(2)+1];       %the position of its neighbours
downH1picked=[H1pickedup(1),H1pickedup(2)-1];
leftH1picked=[H1pickedup(1)-1,H1pickedup(2)];
rightH1picked=[H1pickedup(1)+1,H1pickedup(2)];

n2=ceil(ind2/W);
m2=ind2-W*(n2-1);
H2pickedup=[m2 n2];  %pickup an random position for H1

upH2picked=[H2pickedup(1),H2pickedup(2)+1]; % find the neighbours of this H2
downH2picked=[H2pickedup(1),H2pickedup(2)-1];
leftH2picked=[H2pickedup(1)-1,H2pickedup(2)];
rightH2picked=[H2pickedup(1)+1,H2pickedup(2)];                                         

Conf(H1pickedup(1),H1pickedup(2))=0;  % update the configuration of the lattice
Conf(H2pickedup(1),H2pickedup(2))=0;
H2Num=H2Num+1;

HdiffusionSP(H1pickedup(1),H1pickedup(2))=0;
HdiffusionSP(H2pickedup(1),H2pickedup(2))=0;
NZE(1)=NZE(1)-2;

if sum((H1pickedup-H2pickedup).^2)==1
               
    CH4DSP(H1pickedup(1),H1pickedup(2))=1;%addevent(CH4DSP,H1pickedup,'CH4DSP');
    CH4DSP(H2pickedup(1),H2pickedup(2))=1;%addevent(CH4DSP,H2pickedup,'CH4DSP');
    NZE(5)=NZE(5)+2;
    H2PSP(H1pickedup(1),H1pickedup(2))=0; %remove H2production at this site
    H2PSP(H2pickedup(1),H2pickedup(2))=0;% %remove H2production at this site
    NZE(12)=NZE(12)-2;

   [NZE,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP]=rdH2PcheckNB(NZE,Conf,W,L,H,...
       CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP,...
       H1pickedup,upH1picked,downH1picked,leftH1picked,rightH1picked,H2pickedup,upH2picked,downH2picked,leftH2picked,rightH2picked);           
   
    ystore=scanNBP(ystore,Conf,W,L,CX,H1pickedup,upH1picked,downH1picked,leftH1picked,rightH1picked,H2pickedup,upH2picked,downH2picked,leftH2picked,rightH2picked);
    
else   % two H not neighbors
    ystore=scanNBP(ystore,Conf,W,L,CX,H1pickedup,upH1picked,downH1picked,leftH1picked,rightH1picked,H2pickedup,upH2picked,downH2picked,leftH2picked,rightH2picked);


    [NZE,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP]=redifineH2PcheckNB(NZE,Conf,W,L,H,CH3,CH2,CH,C,C3,...
         HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP,H1pickedup,upH1picked,downH1picked,leftH1picked,rightH1picked,...
         H2pickedup,upH2picked,downH2picked,leftH2picked,rightH2picked);                           
    
end

end