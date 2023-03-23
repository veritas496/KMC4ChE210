function [NZE,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=redefineCCNTcheckC3NB(NZE,Conf,W,L,H,C,CH3,CH2,CH,C2,C3,...
    CX,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,C3pickedup,C3NBup,C3NBdown,C3NBleft,C3NBright)
%x is C3 pickedup;y is one of its neighbour
if C3NBup(2)<=L
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

if C3NBdown(2)>=1
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

if C3NBleft(1)>=1
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


if C3NBright(1)<=W
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

end