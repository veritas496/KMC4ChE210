function [NZE,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=CCNTcheckC3NB(NZE,Conf,H,C,CH3,CH2,CH,C2,C3,...
    CX,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,C3pickedup,C3NB1,C3NB2,C3NB3)
%x is C3 pickedup;y is one of its neighbour
Checkspecies=Conf(C3NB1(1),C3NB1(2)); %check C3 neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(C3pickedup(1),C3pickedup(2))=CH4DSP(C3pickedup(1),C3pickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(C3pickedup(1),C3pickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(C3NB1(1),C3NB1(2))=CH4DSP(C3NB1(1),C3NB1(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(C3NB1(1),C3NB1(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(C3NB1(1),C3NB1(2))=HdiffusionSP(C3NB1(1),C3NB1(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(C3NB1(1),C3NB1(2))==1
                NZE(1)=NZE(1)+1;
            end
        case(CH3)
            CH3DSP(C3NB1(1),C3NB1(2))=CH3DSP(C3NB1(1),C3NB1(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(C3NB1(1),C3NB1(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH2DSP(C3NB1(1),C3NB1(2))=CH2DSP(C3NB1(1),C3NB1(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(C3NB1(1),C3NB1(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CHDSP(C3NB1(1),C3NB1(2))=CHDSP(C3NB1(1),C3NB1(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(C3NB1(1),C3NB1(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CdiffusionSP(C3NB1(1),C3NB1(2))=CdiffusionSP(C3NB1(1),C3NB1(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(C3NB1(1),C3NB1(2))==1
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
            C3diffusionSP(C3NB1(1),C3NB1(2))=C3diffusionSP(C3NB1(1),C3NB1(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP'); 
            if C3diffusionSP(C3NB1(1),C3NB1(2))==1
                NZE(4)=NZE(4)+1;
            end
            CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))-1;%removeevent(CXFSP,x,'CXFSP');
            if CXFSP(C3pickedup(1),C3pickedup(2))==0
                NZE(11)=NZE(11)-1;
            end
            CXFSP(C3NB1(1),C3NB1(2))=CXFSP(C3NB1(1),C3NB1(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C3NB1(1),C3NB1(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(CX)
            CXFSP(C3NB1(1),C3NB1(2))=CXFSP(C3NB1(1),C3NB1(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C3NB1(1),C3NB1(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
    
Checkspecies=Conf(C3NB2(1),C3NB2(2)); %check C3 neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(C3pickedup(1),C3pickedup(2))=CH4DSP(C3pickedup(1),C3pickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(C3pickedup(1),C3pickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(C3NB2(1),C3NB2(2))=CH4DSP(C3NB2(1),C3NB2(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(C3NB2(1),C3NB2(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(C3NB2(1),C3NB2(2))=HdiffusionSP(C3NB2(1),C3NB2(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(C3NB2(1),C3NB2(2))==1
                NZE(1)=NZE(1)+1;
            end
        case(CH3)
            CH3DSP(C3NB2(1),C3NB2(2))=CH3DSP(C3NB2(1),C3NB2(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(C3NB2(1),C3NB2(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH2DSP(C3NB2(1),C3NB2(2))=CH2DSP(C3NB2(1),C3NB2(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(C3NB2(1),C3NB2(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CHDSP(C3NB2(1),C3NB2(2))=CHDSP(C3NB2(1),C3NB2(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(C3NB2(1),C3NB2(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CdiffusionSP(C3NB2(1),C3NB2(2))=CdiffusionSP(C3NB2(1),C3NB2(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(C3NB2(1),C3NB2(2))==1
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
            C3diffusionSP(C3NB2(1),C3NB2(2))=C3diffusionSP(C3NB2(1),C3NB2(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP'); 
            if C3diffusionSP(C3NB2(1),C3NB2(2))==1
                NZE(4)=NZE(4)+1;
            end
            CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))-1;%removeevent(CXFSP,x,'CXFSP');
            if CXFSP(C3pickedup(1),C3pickedup(2))==0
                NZE(11)=NZE(11)-1;
            end
            CXFSP(C3NB2(1),C3NB2(2))=CXFSP(C3NB2(1),C3NB2(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C3NB2(1),C3NB2(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(CX)
            CXFSP(C3NB2(1),C3NB2(2))=CXFSP(C3NB2(1),C3NB2(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C3NB2(1),C3NB2(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
    
if C3NB3~=0
    Checkspecies=Conf(C3NB3(1),C3NB3(2)); %check C3 neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(C3pickedup(1),C3pickedup(2))=CH4DSP(C3pickedup(1),C3pickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(C3pickedup(1),C3pickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(C3NB3(1),C3NB3(2))=CH4DSP(C3NB3(1),C3NB3(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(C3NB3(1),C3NB3(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(C3NB3(1),C3NB3(2))=HdiffusionSP(C3NB3(1),C3NB3(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(C3NB3(1),C3NB3(2))==1
                NZE(1)=NZE(1)+1;
            end
        case(CH3)
            CH3DSP(C3NB3(1),C3NB3(2))=CH3DSP(C3NB3(1),C3NB3(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(C3NB3(1),C3NB3(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH2DSP(C3NB3(1),C3NB3(2))=CH2DSP(C3NB3(1),C3NB3(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(C3NB3(1),C3NB3(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CHDSP(C3NB3(1),C3NB3(2))=CHDSP(C3NB3(1),C3NB3(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(C3NB3(1),C3NB3(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CdiffusionSP(C3NB3(1),C3NB3(2))=CdiffusionSP(C3NB3(1),C3NB3(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(C3NB3(1),C3NB3(2))==1
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
            C3diffusionSP(C3NB3(1),C3NB3(2))=C3diffusionSP(C3NB3(1),C3NB3(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP'); 
            if C3diffusionSP(C3NB3(1),C3NB3(2))==1
                NZE(4)=NZE(4)+1;
            end
            CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))-1;%removeevent(CXFSP,x,'CXFSP');
            if CXFSP(C3pickedup(1),C3pickedup(2))==0
                NZE(11)=NZE(11)-1;
            end
            CXFSP(C3NB3(1),C3NB3(2))=CXFSP(C3NB3(1),C3NB3(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C3NB3(1),C3NB3(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(CX)
            CXFSP(C3NB3(1),C3NB3(2))=CXFSP(C3NB3(1),C3NB3(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C3NB3(1),C3NB3(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end
end