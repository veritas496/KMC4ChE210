function [ystore,NZE,Conf,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP]=Cbulkdiffusion(NZE,W,L,Conf,C,CdiffusionSP,H,CH3,CH2,CH,C2,C3,...
    CX,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP,ystore)
        
k=find(CBdiffusionSP);
N=ceil(rand(1)*numel(k));
ind=k(N);
n=ceil(ind/W);
m=ind-W*(n-1);
Cpickedup=[m n]; %pickup an random position for C

upCpicked=[Cpickedup(1),Cpickedup(2)+1];       %the position of its neighbours
downCpicked=[Cpickedup(1),Cpickedup(2)-1];
leftCpicked=[Cpickedup(1)-1,Cpickedup(2)];
rightCpicked=[Cpickedup(1)+1,Cpickedup(2)];

Conf(Cpickedup(1),Cpickedup(2))=0;  % update the configuration of the lattice
  
    
CBdiffusionSP(Cpickedup(1),Cpickedup(2))=0;%remove C bulk diffusion at this site
NZE(20)=NZE(20)-1;

if (Cpickedup(1)==1)||(Cpickedup(1)==W)||(Cpickedup(2)==1)||(Cpickedup(2)==L)
     CCNTSP(Cpickedup(1),Cpickedup(2))=0;
     NZE(19)=NZE(19)-1;
end

[NZE,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP]=CbulkdiffusioncheckNB(NZE,Conf,W,L,H,C,CH3,CH2,CH,C2,C3,...
            CX,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,...
            Cpickedup,upCpicked,downCpicked,leftCpicked,rightCpicked);
                    
ystore=scanNBP(ystore,Conf,W,L,CX,Cpickedup,upCpicked,downCpicked,leftCpicked,rightCpicked,[],0,0,0,0);

end



    
    
