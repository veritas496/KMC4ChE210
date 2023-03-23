function [ystore,NZE,Conf,CH4DSP,CXFSP,C3diffusionSP,CdiffusionSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CCNTSP]=C3diffusion(NZE,W,L,...
    Conf,CH4DSP,CXFSP,C3diffusionSP,H,C,CH3,CH2,CH,C2,C3,CX,CdiffusionSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CCNTSP,ystore)
EPstore=zeros(4,2);

k=find(C3diffusionSP);
N=ceil(rand(1)*numel(k));
ind=k(N);
n=ceil(ind/W);
m=ind-W*(n-1);
C3pickedup=[m n];  %pickup an random position for C3

upC3picked=[C3pickedup(1),C3pickedup(2)+1];       %the position of its neighbours
downC3picked=[C3pickedup(1),C3pickedup(2)-1];
leftC3picked=[C3pickedup(1)-1,C3pickedup(2)];
rightC3picked=[C3pickedup(1)+1,C3pickedup(2)];

if upC3picked(2)<=L&&Conf(upC3picked(1),upC3picked(2))==0 %find the C3 neighbours which is 0 or outside of the lattice
    EPstore(1,:)=upC3picked;
end
if downC3picked(2)>=1&&Conf(downC3picked(1),downC3picked(2))==0
    EPstore(2,:)=downC3picked;
end
if leftC3picked(1)>=1&&Conf(leftC3picked(1),leftC3picked(2))==0
    EPstore(3,:)=leftC3picked;
end
if rightC3picked(1)<=W&&Conf(rightC3picked(1),rightC3picked(2))==0
    EPstore(4,:)=rightC3picked;
end

index=find(EPstore(:,1));
row=ceil(rand(1)*length(index));
EPpickedup=EPstore(index(row),:);  % randomly pick up an position which is 0 

upEPpicked=[EPpickedup(1),EPpickedup(2)+1]; % find the neighbours of this site
downEPpicked=[EPpickedup(1),EPpickedup(2)-1];
leftEPpicked=[EPpickedup(1)-1,EPpickedup(2)];
rightEPpicked=[EPpickedup(1)+1,EPpickedup(2)];   

Conf(C3pickedup(1),C3pickedup(2))=0;  % update the configuration of the lattice
Conf(EPpickedup(1),EPpickedup(2))=C3;   
    
C3diffusionSP(C3pickedup(1),C3pickedup(2))=0;%remove C3 diffusion at this site
C3diffusionSP(EPpickedup(1),EPpickedup(2))=1;%addevent(C3diffusionSP,EPpickedup,'C3diffusionSP');

if (C3pickedup(1)==1)||(C3pickedup(1)==W)||(C3pickedup(2)==1)||(C3pickedup(2)==L)
     CCNTSP(C3pickedup(1),C3pickedup(2))=0;
     NZE(19)=NZE(19)-1;
end

if (EPpickedup(1)==1)||(EPpickedup(1)==W)||(EPpickedup(2)==1)||(EPpickedup(2)==L)
     CCNTSP(EPpickedup(1),EPpickedup(2))=1;
     NZE(19)=NZE(19)+1;
end

[NZE,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=C3diffusioncheckNB(NZE,Conf,W,L,H,C,CH3,CH2,CH,C2,C3,...
            CX,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,...
            C3pickedup,upC3picked,downC3picked,leftC3picked,rightC3picked,EPpickedup,upEPpicked,downEPpicked,leftEPpicked,rightEPpicked);     
                    
ystore=scanNBP(ystore,Conf,W,L,CX,C3pickedup,upC3picked,downC3picked,leftC3picked,rightC3picked,[],0,0,0,0);
ystore=scanNBD(ystore,Conf,W,L,CX,upEPpicked,downEPpicked,leftEPpicked,rightEPpicked);

end