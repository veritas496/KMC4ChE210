function [ystore,NZE,Conf,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP]=Cdiffusion(NZE,W,L,Conf,C,CdiffusionSP,H,CH3,CH2,CH,C2,C3,...
    CX,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP,ystore)
        
EPstore=zeros(4,2);

k=find(CdiffusionSP);
N=ceil(rand(1)*numel(k));
ind=k(N);
n=ceil(ind/W);
m=ind-W*(n-1);
Cpickedup=[m n]; %pickup an random position for C

upCpicked=[Cpickedup(1),Cpickedup(2)+1];       %the position of its neighbours
downCpicked=[Cpickedup(1),Cpickedup(2)-1];
leftCpicked=[Cpickedup(1)-1,Cpickedup(2)];
rightCpicked=[Cpickedup(1)+1,Cpickedup(2)];

if upCpicked(2)<=L&&Conf(upCpicked(1),upCpicked(2))==0 %find the C neighbours which is 0 or outside of the lattice
    EPstore(1,:)=upCpicked;
end
if downCpicked(2)>=1&&Conf(downCpicked(1),downCpicked(2))==0
    EPstore(2,:)=downCpicked;
end
if leftCpicked(1)>=1&&Conf(leftCpicked(1),leftCpicked(2))==0
    EPstore(3,:)=leftCpicked;
end
if rightCpicked(1)<=W&&Conf(rightCpicked(1),rightCpicked(2))==0
    EPstore(4,:)=rightCpicked;
end

index=find(EPstore(:,1));
row=ceil(rand(1)*length(index));
EPpickedup=EPstore(index(row),:);  % randomly pick up an position which is 0 

upEPpicked=[EPpickedup(1),EPpickedup(2)+1]; % find the neighbours of this 0 site
downEPpicked=[EPpickedup(1),EPpickedup(2)-1];
leftEPpicked=[EPpickedup(1)-1,EPpickedup(2)];
rightEPpicked=[EPpickedup(1)+1,EPpickedup(2)];        

Conf(Cpickedup(1),Cpickedup(2))=0;  % update the configuration of the lattice
Conf(EPpickedup(1),EPpickedup(2))=C;   
    
CdiffusionSP(Cpickedup(1),Cpickedup(2))=0;%remove C diffusion at this site
CdiffusionSP(EPpickedup(1),EPpickedup(2))=1;%addevent(CdiffusionSP,EPpickedup,'CdiffusionSP');
CBdiffusionSP(Cpickedup(1),Cpickedup(2))=0;%remove C bulk diffusion at this site
CBdiffusionSP(EPpickedup(1),EPpickedup(2))=1;%add C bulk diffusion at this site


if (Cpickedup(1)==1)||(Cpickedup(1)==W)||(Cpickedup(2)==1)||(Cpickedup(2)==L)
     CCNTSP(Cpickedup(1),Cpickedup(2))=0;
     NZE(19)=NZE(19)-1;
end
                
if (EPpickedup(1)==1)||(EPpickedup(1)==W)||(EPpickedup(2)==1)||(EPpickedup(2)==L)
     CCNTSP(EPpickedup(1),EPpickedup(2))=1;
     NZE(19)=NZE(19)+1;
end


[NZE,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP]=CdiffusioncheckNB(NZE,Conf,W,L,H,C,CH3,CH2,CH,C2,C3,...
      CX,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,Cpickedup,upCpicked,downCpicked,leftCpicked,rightCpicked,...
           EPpickedup,upEPpicked,downEPpicked,leftEPpicked,rightEPpicked);
       
ystore=scanNBP(ystore,Conf,W,L,CX,Cpickedup,upCpicked,downCpicked,leftCpicked,rightCpicked,[],0,0,0,0);
ystore=scanNBD(ystore,Conf,W,L,CX,upEPpicked,downEPpicked,leftEPpicked,rightEPpicked);

end



    
    
