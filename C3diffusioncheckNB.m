function [NZE,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=C3diffusioncheckNB(NZE,Conf,W,L,H,C,CH3,CH2,CH,C2,C3,...
    CX,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,C3pickedup,C3NBup,C3NBdown,C3NBleft,C3NBright,EPpickedup,EPNBup,EPNBdown,EPNBleft,EPNBright)
%x is C3 pickedup;y is one of its neighbour

if (C3NBup(2)<=L)&sum((C3NBup~=EPpickedup).^2)~=0
    Checkspecies=Conf(C3NBup(1),C3NBup(2)); %check C3 neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(C3pickedup(1),C3pickedup(2))=CH4DSP(C3pickedup(1),C3pickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(C3pickedup(1),C3pickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(C3NBup(1),C3NBup(2))=CH4DSP(C3NBup(1),C3NBup(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(C3NBup(1),C3NBup(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(C3NBup(1),C3NBup(2))=HdiffusionSP(C3NBup(1),C3NBup(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(C3NBup(1),C3NBup(2))==1
                NZE(1)=NZE(1)+1;
            end
        case(CH3)
            CH3DSP(C3NBup(1),C3NBup(2))=CH3DSP(C3NBup(1),C3NBup(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(C3NBup(1),C3NBup(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH2DSP(C3NBup(1),C3NBup(2))=CH2DSP(C3NBup(1),C3NBup(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(C3NBup(1),C3NBup(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CHDSP(C3NBup(1),C3NBup(2))=CHDSP(C3NBup(1),C3NBup(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(C3NBup(1),C3NBup(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CdiffusionSP(C3NBup(1),C3NBup(2))=CdiffusionSP(C3NBup(1),C3NBup(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(C3NBup(1),C3NBup(2))==1
                NZE(3)=NZE(3)+1;
            end
            CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))-1;%removeevent(CXFSP,x,'CXFSP');
            if CXFSP(C3pickedup(1),C3pickedup(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(C2)
            CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))-1;%removeevent(CXFSP,x,'CXFSP');
            if CXFSP(C3pickedup(1),C3pickedup(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(C3)
            C3diffusionSP(C3NBup(1),C3NBup(2))=C3diffusionSP(C3NBup(1),C3NBup(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP'); 
            if C3diffusionSP(C3NBup(1),C3NBup(2))==1
                NZE(4)=NZE(4)+1;
            end
            CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))-1;%removeevent(CXFSP,x,'CXFSP');
            if CXFSP(C3pickedup(1),C3pickedup(2))==0
                NZE(11)=NZE(11)-1;
            end
            CXFSP(C3NBup(1),C3NBup(2))=CXFSP(C3NBup(1),C3NBup(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C3NBup(1),C3NBup(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(CX)
            CXFSP(C3NBup(1),C3NBup(2))=CXFSP(C3NBup(1),C3NBup(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C3NBup(1),C3NBup(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end
    
if (C3NBdown(2)>=1)&sum((C3NBdown~=EPpickedup).^2)~=0
    Checkspecies=Conf(C3NBdown(1),C3NBdown(2)); %check C3 neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(C3pickedup(1),C3pickedup(2))=CH4DSP(C3pickedup(1),C3pickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(C3pickedup(1),C3pickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(C3NBdown(1),C3NBdown(2))=CH4DSP(C3NBdown(1),C3NBdown(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(C3NBdown(1),C3NBdown(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(C3NBdown(1),C3NBdown(2))=HdiffusionSP(C3NBdown(1),C3NBdown(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(C3NBdown(1),C3NBdown(2))==1
                NZE(1)=NZE(1)+1;
            end
        case(CH3)
            CH3DSP(C3NBdown(1),C3NBdown(2))=CH3DSP(C3NBdown(1),C3NBdown(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(C3NBdown(1),C3NBdown(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH2DSP(C3NBdown(1),C3NBdown(2))=CH2DSP(C3NBdown(1),C3NBdown(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(C3NBdown(1),C3NBdown(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CHDSP(C3NBdown(1),C3NBdown(2))=CHDSP(C3NBdown(1),C3NBdown(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(C3NBdown(1),C3NBdown(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CdiffusionSP(C3NBdown(1),C3NBdown(2))=CdiffusionSP(C3NBdown(1),C3NBdown(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(C3NBdown(1),C3NBdown(2))==1
                NZE(3)=NZE(3)+1;
            end
            CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))-1;%removeevent(CXFSP,x,'CXFSP');
            if CXFSP(C3pickedup(1),C3pickedup(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(C2)
            CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))-1;%removeevent(CXFSP,x,'CXFSP');
            if CXFSP(C3pickedup(1),C3pickedup(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(C3)
            C3diffusionSP(C3NBdown(1),C3NBdown(2))=C3diffusionSP(C3NBdown(1),C3NBdown(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP'); 
            if C3diffusionSP(C3NBdown(1),C3NBdown(2))==1
                NZE(4)=NZE(4)+1;
            end
            CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))-1;%removeevent(CXFSP,x,'CXFSP');
            if CXFSP(C3pickedup(1),C3pickedup(2))==0
                NZE(11)=NZE(11)-1;
            end
            CXFSP(C3NBdown(1),C3NBdown(2))=CXFSP(C3NBdown(1),C3NBdown(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C3NBdown(1),C3NBdown(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(CX)
            CXFSP(C3NBdown(1),C3NBdown(2))=CXFSP(C3NBdown(1),C3NBdown(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C3NBdown(1),C3NBdown(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end

if (C3NBleft(1)>=1)&sum((C3NBleft~=EPpickedup).^2)~=0
    Checkspecies=Conf(C3NBleft(1),C3NBleft(2)); %check C3 neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(C3pickedup(1),C3pickedup(2))=CH4DSP(C3pickedup(1),C3pickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(C3pickedup(1),C3pickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(C3NBleft(1),C3NBleft(2))=CH4DSP(C3NBleft(1),C3NBleft(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(C3NBleft(1),C3NBleft(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(C3NBleft(1),C3NBleft(2))=HdiffusionSP(C3NBleft(1),C3NBleft(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(C3NBleft(1),C3NBleft(2))==1
                NZE(1)=NZE(1)+1;
            end
        case(CH3)
            CH3DSP(C3NBleft(1),C3NBleft(2))=CH3DSP(C3NBleft(1),C3NBleft(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(C3NBleft(1),C3NBleft(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH2DSP(C3NBleft(1),C3NBleft(2))=CH2DSP(C3NBleft(1),C3NBleft(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(C3NBleft(1),C3NBleft(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CHDSP(C3NBleft(1),C3NBleft(2))=CHDSP(C3NBleft(1),C3NBleft(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(C3NBleft(1),C3NBleft(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CdiffusionSP(C3NBleft(1),C3NBleft(2))=CdiffusionSP(C3NBleft(1),C3NBleft(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(C3NBleft(1),C3NBleft(2))==1
                NZE(3)=NZE(3)+1;
            end
            CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))-1;%removeevent(CXFSP,x,'CXFSP');
            if CXFSP(C3pickedup(1),C3pickedup(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(C2)
            CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))-1;%removeevent(CXFSP,x,'CXFSP');
            if CXFSP(C3pickedup(1),C3pickedup(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(C3)
            C3diffusionSP(C3NBleft(1),C3NBleft(2))=C3diffusionSP(C3NBleft(1),C3NBleft(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP'); 
            if C3diffusionSP(C3NBleft(1),C3NBleft(2))==1
                NZE(4)=NZE(4)+1;
            end
            CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))-1;%removeevent(CXFSP,x,'CXFSP');
            if CXFSP(C3pickedup(1),C3pickedup(2))==0
                NZE(11)=NZE(11)-1;
            end
            CXFSP(C3NBleft(1),C3NBleft(2))=CXFSP(C3NBleft(1),C3NBleft(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C3NBleft(1),C3NBleft(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(CX)
            CXFSP(C3NBleft(1),C3NBleft(2))=CXFSP(C3NBleft(1),C3NBleft(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C3NBleft(1),C3NBleft(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end

if (C3NBright(1)<=W)&sum((C3NBright~=EPpickedup).^2)~=0
    Checkspecies=Conf(C3NBright(1),C3NBright(2)); %check C3 neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(C3pickedup(1),C3pickedup(2))=CH4DSP(C3pickedup(1),C3pickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(C3pickedup(1),C3pickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(C3NBright(1),C3NBright(2))=CH4DSP(C3NBright(1),C3NBright(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(C3NBright(1),C3NBright(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(C3NBright(1),C3NBright(2))=HdiffusionSP(C3NBright(1),C3NBright(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(C3NBright(1),C3NBright(2))==1
                NZE(1)=NZE(1)+1;
            end
        case(CH3)
            CH3DSP(C3NBright(1),C3NBright(2))=CH3DSP(C3NBright(1),C3NBright(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(C3NBright(1),C3NBright(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH2DSP(C3NBright(1),C3NBright(2))=CH2DSP(C3NBright(1),C3NBright(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(C3NBright(1),C3NBright(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CHDSP(C3NBright(1),C3NBright(2))=CHDSP(C3NBright(1),C3NBright(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(C3NBright(1),C3NBright(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CdiffusionSP(C3NBright(1),C3NBright(2))=CdiffusionSP(C3NBright(1),C3NBright(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(C3NBright(1),C3NBright(2))==1
                NZE(3)=NZE(3)+1;
            end
            CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))-1;%removeevent(CXFSP,x,'CXFSP');
            if CXFSP(C3pickedup(1),C3pickedup(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(C2)
            CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))-1;%removeevent(CXFSP,x,'CXFSP');
            if CXFSP(C3pickedup(1),C3pickedup(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(C3)
            C3diffusionSP(C3NBright(1),C3NBright(2))=C3diffusionSP(C3NBright(1),C3NBright(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP'); 
            if C3diffusionSP(C3NBright(1),C3NBright(2))==1
                NZE(4)=NZE(4)+1;
            end
            CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))-1;%removeevent(CXFSP,x,'CXFSP');
            if CXFSP(C3pickedup(1),C3pickedup(2))==0
                NZE(11)=NZE(11)-1;
            end
            CXFSP(C3NBright(1),C3NBright(2))=CXFSP(C3NBright(1),C3NBright(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C3NBright(1),C3NBright(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(CX)
            CXFSP(C3NBright(1),C3NBright(2))=CXFSP(C3NBright(1),C3NBright(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C3NBright(1),C3NBright(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end

if (EPNBup(2)<=L)&sum((EPNBup~=C3pickedup).^2)~=0
    
    Checkspecies=Conf(EPNBup(1),EPNBup(2)); %check EP 0 neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(EPpickedup(1),EPpickedup(2))=CH4DSP(EPpickedup(1),EPpickedup(2))-1;%removeevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(EPpickedup(1),EPpickedup(2))==0
                NZE(5)=NZE(5)-1;
            end
            CH4DSP(EPNBup(1),EPNBup(2))=CH4DSP(EPNBup(1),EPNBup(2))-1;%removeevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(EPNBup(1),EPNBup(2))==0
                NZE(5)=NZE(5)-1;
            end
            C3diffusionSP(EPpickedup(1),EPpickedup(2))=C3diffusionSP(EPpickedup(1),EPpickedup(2))+1;%addevent(C3diffusionSP,x,'C3diffusionSP');
            
        case(H)
            HdiffusionSP(EPNBup(1),EPNBup(2))=HdiffusionSP(EPNBup(1),EPNBup(2))-1;%removeevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(EPNBup(1),EPNBup(2))==0
                NZE(1)=NZE(1)-1;
            end
        case(CH3)
            CH3DSP(EPNBup(1),EPNBup(2))=CH3DSP(EPNBup(1),EPNBup(2))-1;%removeevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(EPNBup(1),EPNBup(2))==0
                NZE(6)=NZE(6)-1;
            end
        case(CH2)
            CH2DSP(EPNBup(1),EPNBup(2))=CH2DSP(EPNBup(1),EPNBup(2))-1;%removeevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(EPNBup(1),EPNBup(2))==0
                NZE(7)=NZE(7)-1;
            end
        case(CH)
            CHDSP(EPNBup(1),EPNBup(2))=CHDSP(EPNBup(1),EPNBup(2))-1;%removeevent(CHDSP,y,'CHDSP');
            if CHDSP(EPNBup(1),EPNBup(2))==0
                NZE(8)=NZE(8)-1;
            end
        case(C)
            CdiffusionSP(EPNBup(1),EPNBup(2))=CdiffusionSP(EPNBup(1),EPNBup(2))-1;%removeevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(EPNBup(1),EPNBup(2))==0
                NZE(3)=NZE(3)-1;
            end
            CXFSP(EPpickedup(1),EPpickedup(2))=CXFSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(EPpickedup(1),EPpickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C2)
            CXFSP(EPpickedup(1),EPpickedup(2))=CXFSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(EPpickedup(1),EPpickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C3)
            C3diffusionSP(EPNBup(1),EPNBup(2))=C3diffusionSP(EPNBup(1),EPNBup(2))-1;%removeevent(C3diffusionSP,y,'C3diffusionSP');
            if C3diffusionSP(EPNBup(1),EPNBup(2))==0
                NZE(4)=NZE(4)-1;
            end
            CXFSP(EPpickedup(1),EPpickedup(2))=CXFSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(EPpickedup(1),EPpickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
            CXFSP(EPNBup(1),EPNBup(2))=CXFSP(EPNBup(1),EPNBup(2))+1;%addevent(CXFSP,y,'CXFSP');
            if CXFSP(EPNBup(1),EPNBup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(CX)
            CXFSP(EPNBup(1),EPNBup(2))=CXFSP(EPNBup(1),EPNBup(2))+1;%addevent(CXFSP,y,'CXFSP');  
            if CXFSP(EPNBup(1),EPNBup(2))==1
                NZE(11)=NZE(11)+1;
            end
    end
end
    
if (EPNBdown(2)>=1)&sum((EPNBdown~=C3pickedup).^2)~=0
    
    Checkspecies=Conf(EPNBdown(1),EPNBdown(2)); %check EP 0 neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(EPpickedup(1),EPpickedup(2))=CH4DSP(EPpickedup(1),EPpickedup(2))-1;%removeevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(EPpickedup(1),EPpickedup(2))==0
                NZE(5)=NZE(5)-1;
            end
            CH4DSP(EPNBdown(1),EPNBdown(2))=CH4DSP(EPNBdown(1),EPNBdown(2))-1;%removeevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(EPNBdown(1),EPNBdown(2))==0
                NZE(5)=NZE(5)-1;
            end
            C3diffusionSP(EPpickedup(1),EPpickedup(2))=C3diffusionSP(EPpickedup(1),EPpickedup(2))+1;%addevent(C3diffusionSP,x,'C3diffusionSP');
            
        case(H)
            HdiffusionSP(EPNBdown(1),EPNBdown(2))=HdiffusionSP(EPNBdown(1),EPNBdown(2))-1;%removeevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(EPNBdown(1),EPNBdown(2))==0
                NZE(1)=NZE(1)-1;
            end
        case(CH3)
            CH3DSP(EPNBdown(1),EPNBdown(2))=CH3DSP(EPNBdown(1),EPNBdown(2))-1;%removeevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(EPNBdown(1),EPNBdown(2))==0
                NZE(6)=NZE(6)-1;
            end
        case(CH2)
            CH2DSP(EPNBdown(1),EPNBdown(2))=CH2DSP(EPNBdown(1),EPNBdown(2))-1;%removeevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(EPNBdown(1),EPNBdown(2))==0
                NZE(7)=NZE(7)-1;
            end
        case(CH)
            CHDSP(EPNBdown(1),EPNBdown(2))=CHDSP(EPNBdown(1),EPNBdown(2))-1;%removeevent(CHDSP,y,'CHDSP');
            if CHDSP(EPNBdown(1),EPNBdown(2))==0
                NZE(8)=NZE(8)-1;
            end
        case(C)
            CdiffusionSP(EPNBdown(1),EPNBdown(2))=CdiffusionSP(EPNBdown(1),EPNBdown(2))-1;%removeevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(EPNBdown(1),EPNBdown(2))==0
                NZE(3)=NZE(3)-1;
            end
            CXFSP(EPpickedup(1),EPpickedup(2))=CXFSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(EPpickedup(1),EPpickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C2)
            CXFSP(EPpickedup(1),EPpickedup(2))=CXFSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(EPpickedup(1),EPpickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C3)
            C3diffusionSP(EPNBdown(1),EPNBdown(2))=C3diffusionSP(EPNBdown(1),EPNBdown(2))-1;%removeevent(C3diffusionSP,y,'C3diffusionSP');
            if C3diffusionSP(EPNBdown(1),EPNBdown(2))==0
                NZE(4)=NZE(4)-1;
            end
            CXFSP(EPpickedup(1),EPpickedup(2))=CXFSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(EPpickedup(1),EPpickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
            CXFSP(EPNBdown(1),EPNBdown(2))=CXFSP(EPNBdown(1),EPNBdown(2))+1;%addevent(CXFSP,y,'CXFSP');
            if CXFSP(EPNBdown(1),EPNBdown(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(CX)
            CXFSP(EPNBdown(1),EPNBdown(2))=CXFSP(EPNBdown(1),EPNBdown(2))+1;%addevent(CXFSP,y,'CXFSP');  
            if CXFSP(EPNBdown(1),EPNBdown(2))==1
                NZE(11)=NZE(11)+1;
            end
    end
end

if (EPNBleft(1)>=1)&sum((EPNBleft~=C3pickedup).^2)~=0
    
    Checkspecies=Conf(EPNBleft(1),EPNBleft(2)); %check EP 0 neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(EPpickedup(1),EPpickedup(2))=CH4DSP(EPpickedup(1),EPpickedup(2))-1;%removeevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(EPpickedup(1),EPpickedup(2))==0
                NZE(5)=NZE(5)-1;
            end
            CH4DSP(EPNBleft(1),EPNBleft(2))=CH4DSP(EPNBleft(1),EPNBleft(2))-1;%removeevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(EPNBleft(1),EPNBleft(2))==0
                NZE(5)=NZE(5)-1;
            end
            C3diffusionSP(EPpickedup(1),EPpickedup(2))=C3diffusionSP(EPpickedup(1),EPpickedup(2))+1;%addevent(C3diffusionSP,x,'C3diffusionSP');
            
        case(H)
            HdiffusionSP(EPNBleft(1),EPNBleft(2))=HdiffusionSP(EPNBleft(1),EPNBleft(2))-1;%removeevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(EPNBleft(1),EPNBleft(2))==0
                NZE(1)=NZE(1)-1;
            end
        case(CH3)
            CH3DSP(EPNBleft(1),EPNBleft(2))=CH3DSP(EPNBleft(1),EPNBleft(2))-1;%removeevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(EPNBleft(1),EPNBleft(2))==0
                NZE(6)=NZE(6)-1;
            end
        case(CH2)
            CH2DSP(EPNBleft(1),EPNBleft(2))=CH2DSP(EPNBleft(1),EPNBleft(2))-1;%removeevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(EPNBleft(1),EPNBleft(2))==0
                NZE(7)=NZE(7)-1;
            end
        case(CH)
            CHDSP(EPNBleft(1),EPNBleft(2))=CHDSP(EPNBleft(1),EPNBleft(2))-1;%removeevent(CHDSP,y,'CHDSP');
            if CHDSP(EPNBleft(1),EPNBleft(2))==0
                NZE(8)=NZE(8)-1;
            end
        case(C)
            CdiffusionSP(EPNBleft(1),EPNBleft(2))=CdiffusionSP(EPNBleft(1),EPNBleft(2))-1;%removeevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(EPNBleft(1),EPNBleft(2))==0
                NZE(3)=NZE(3)-1;
            end
            CXFSP(EPpickedup(1),EPpickedup(2))=CXFSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(EPpickedup(1),EPpickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C2)
            CXFSP(EPpickedup(1),EPpickedup(2))=CXFSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(EPpickedup(1),EPpickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C3)
            C3diffusionSP(EPNBleft(1),EPNBleft(2))=C3diffusionSP(EPNBleft(1),EPNBleft(2))-1;%removeevent(C3diffusionSP,y,'C3diffusionSP');
            if C3diffusionSP(EPNBleft(1),EPNBleft(2))==0
                NZE(4)=NZE(4)-1;
            end
            CXFSP(EPpickedup(1),EPpickedup(2))=CXFSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(EPpickedup(1),EPpickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
            CXFSP(EPNBleft(1),EPNBleft(2))=CXFSP(EPNBleft(1),EPNBleft(2))+1;%addevent(CXFSP,y,'CXFSP');
            if CXFSP(EPNBleft(1),EPNBleft(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(CX)
            CXFSP(EPNBleft(1),EPNBleft(2))=CXFSP(EPNBleft(1),EPNBleft(2))+1;%addevent(CXFSP,y,'CXFSP');  
            if CXFSP(EPNBleft(1),EPNBleft(2))==1
                NZE(11)=NZE(11)+1;
            end
    end
end

if (EPNBright(1)<=W)&sum((EPNBright~=C3pickedup).^2)~=0
    
    Checkspecies=Conf(EPNBright(1),EPNBright(2)); %check EP 0 neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(EPpickedup(1),EPpickedup(2))=CH4DSP(EPpickedup(1),EPpickedup(2))-1;%removeevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(EPpickedup(1),EPpickedup(2))==0
                NZE(5)=NZE(5)-1;
            end
            CH4DSP(EPNBright(1),EPNBright(2))=CH4DSP(EPNBright(1),EPNBright(2))-1;%removeevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(EPNBright(1),EPNBright(2))==0
                NZE(5)=NZE(5)-1;
            end
            C3diffusionSP(EPpickedup(1),EPpickedup(2))=C3diffusionSP(EPpickedup(1),EPpickedup(2))+1;%addevent(C3diffusionSP,x,'C3diffusionSP');
            
        case(H)
            HdiffusionSP(EPNBright(1),EPNBright(2))=HdiffusionSP(EPNBright(1),EPNBright(2))-1;%removeevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(EPNBright(1),EPNBright(2))==0
                NZE(1)=NZE(1)-1;
            end
        case(CH3)
            CH3DSP(EPNBright(1),EPNBright(2))=CH3DSP(EPNBright(1),EPNBright(2))-1;%removeevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(EPNBright(1),EPNBright(2))==0
                NZE(6)=NZE(6)-1;
            end
        case(CH2)
            CH2DSP(EPNBright(1),EPNBright(2))=CH2DSP(EPNBright(1),EPNBright(2))-1;%removeevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(EPNBright(1),EPNBright(2))==0
                NZE(7)=NZE(7)-1;
            end
        case(CH)
            CHDSP(EPNBright(1),EPNBright(2))=CHDSP(EPNBright(1),EPNBright(2))-1;%removeevent(CHDSP,y,'CHDSP');
            if CHDSP(EPNBright(1),EPNBright(2))==0
                NZE(8)=NZE(8)-1;
            end
        case(C)
            CdiffusionSP(EPNBright(1),EPNBright(2))=CdiffusionSP(EPNBright(1),EPNBright(2))-1;%removeevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(EPNBright(1),EPNBright(2))==0
                NZE(3)=NZE(3)-1;
            end
            CXFSP(EPpickedup(1),EPpickedup(2))=CXFSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(EPpickedup(1),EPpickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C2)
            CXFSP(EPpickedup(1),EPpickedup(2))=CXFSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(EPpickedup(1),EPpickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C3)
            C3diffusionSP(EPNBright(1),EPNBright(2))=C3diffusionSP(EPNBright(1),EPNBright(2))-1;%removeevent(C3diffusionSP,y,'C3diffusionSP');
            if C3diffusionSP(EPNBright(1),EPNBright(2))==0
                NZE(4)=NZE(4)-1;
            end
            CXFSP(EPpickedup(1),EPpickedup(2))=CXFSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(EPpickedup(1),EPpickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
            CXFSP(EPNBright(1),EPNBright(2))=CXFSP(EPNBright(1),EPNBright(2))+1;%addevent(CXFSP,y,'CXFSP');
            if CXFSP(EPNBright(1),EPNBright(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(CX)
            CXFSP(EPNBright(1),EPNBright(2))=CXFSP(EPNBright(1),EPNBright(2))+1;%addevent(CXFSP,y,'CXFSP');  
            if CXFSP(EPNBright(1),EPNBright(2))==1
                NZE(11)=NZE(11)+1;
            end
    end
end

end