function [NZE,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP]=redifineH2PcheckNB(NZE,Conf,W,L,H,CH3,CH2,CH,C,C3,...
    HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP,...
    H1pickedup,H1NBup,H1NBdown,H1NBleft,H1NBright,H2pickedup,H2NBup,H2NBdown,H2NBleft,H2NBright)

if H1NBup(2)<=L
    Checkspecies=Conf(H1NBup(1),H1NBup(2)); %check H neighbour

    switch (Checkspecies)
        case(0)
            CH4DSP(H1pickedup(1),H1pickedup(2))=CH4DSP(H1pickedup(1),H1pickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(H1pickedup(1),H1pickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(H1NBup(1),H1NBup(2))=CH4DSP(H1NBup(1),H1NBup(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(H1NBup(1),H1NBup(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(H1NBup(1),H1NBup(2))=HdiffusionSP(H1NBup(1),H1NBup(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(H1NBup(1),H1NBup(2))==1	
                NZE(1)=NZE(1)+1;
            end
            
            H2PSP(H1pickedup(1),H1pickedup(2))=H2PSP(H1pickedup(1),H1pickedup(2))-1;%removeevent(H2PSP,x,'H2PSP');
            if H2PSP(H1pickedup(1),H1pickedup(2))==0
                NZE(12)=NZE(12)-1;
            end
            H2PSP(H1NBup(1),H1NBup(2))=H2PSP(H1NBup(1),H1NBup(2))-1;%removeevent(H2PSP,y,'H2PSP');
            if H2PSP(H1NBup(1),H1NBup(2))==0
                NZE(12)=NZE(12)-1;
            end
            
        case(CH3)
            CH3DSP(H1NBup(1),H1NBup(2))=CH3DSP(H1NBup(1),H1NBup(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(H1NBup(1),H1NBup(2))==1
                NZE(6)=NZE(6)+1;
            end
            CH4PSP(H1NBup(1),H1NBup(2))=CH4PSP(H1NBup(1),H1NBup(2))-1;%removeevent(CH4PSP,y,'CH4PSP');
            if CH4PSP(H1NBup(1),H1NBup(2))==0
                NZE(15)=NZE(15)-1;
            end
        case(CH2)
            CH2DSP(H1NBup(1),H1NBup(2))=CH2DSP(H1NBup(1),H1NBup(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(H1NBup(1),H1NBup(2))==1
                NZE(7)=NZE(7)+1;
            end
            CH3PSP(H1NBup(1),H1NBup(2))=CH3PSP(H1NBup(1),H1NBup(2))-1;%removeevent(CH3PSP,y,'CH3PSP');
            if CH3PSP(H1NBup(1),H1NBup(2))==0
                NZE(16)=NZE(16)-1;
            end
        case(CH)
            CHDSP(H1NBup(1),H1NBup(2))=CHDSP(H1NBup(1),H1NBup(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(H1NBup(1),H1NBup(2))==1
                NZE(8)=NZE(8)+1;
            end
            CH2PSP(H1NBup(1),H1NBup(2))=CH2PSP(H1NBup(1),H1NBup(2))-1;%removeevent(CH2PSP,y,'CH2PSP');
            if CH2PSP(H1NBup(1),H1NBup(2))==0
                NZE(17)=NZE(17)-1;
            end
        case(C)
            CdiffusionSP(H1NBup(1),H1NBup(2))=CdiffusionSP(H1NBup(1),H1NBup(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(H1NBup(1),H1NBup(2))==1
                NZE(3)=NZE(3)+1;
            end
            CHPSP(H1NBup(1),H1NBup(2))=CHPSP(H1NBup(1),H1NBup(2))-1;%removeevent(CHPSP,y,'CHPSP');
            if CHPSP(H1NBup(1),H1NBup(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(C3)
            C3diffusionSP(H1NBup(1),H1NBup(2))=C3diffusionSP(H1NBup(1),H1NBup(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP');  
            if C3diffusionSP(H1NBup(1),H1NBup(2))==1
                NZE(4)=NZE(4)+1;
            end
    end
end

if H1NBdown(2)>=1
    Checkspecies=Conf(H1NBdown(1),H1NBdown(2)); %check H neighbour

    switch (Checkspecies)
        case(0)
            CH4DSP(H1pickedup(1),H1pickedup(2))=CH4DSP(H1pickedup(1),H1pickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(H1pickedup(1),H1pickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(H1NBdown(1),H1NBdown(2))=CH4DSP(H1NBdown(1),H1NBdown(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(H1NBdown(1),H1NBdown(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(H1NBdown(1),H1NBdown(2))=HdiffusionSP(H1NBdown(1),H1NBdown(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(H1NBdown(1),H1NBdown(2))==1	
                NZE(1)=NZE(1)+1;
            end
            
            H2PSP(H1pickedup(1),H1pickedup(2))=H2PSP(H1pickedup(1),H1pickedup(2))-1;%removeevent(H2PSP,x,'H2PSP');
            if H2PSP(H1pickedup(1),H1pickedup(2))==0
                NZE(12)=NZE(12)-1;
            end
            H2PSP(H1NBdown(1),H1NBdown(2))=H2PSP(H1NBdown(1),H1NBdown(2))-1;%removeevent(H2PSP,y,'H2PSP');
            if H2PSP(H1NBdown(1),H1NBdown(2))==0
                NZE(12)=NZE(12)-1;
            end
            
        case(CH3)
            CH3DSP(H1NBdown(1),H1NBdown(2))=CH3DSP(H1NBdown(1),H1NBdown(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(H1NBdown(1),H1NBdown(2))==1
                NZE(6)=NZE(6)+1;
            end
            CH4PSP(H1NBdown(1),H1NBdown(2))=CH4PSP(H1NBdown(1),H1NBdown(2))-1;%removeevent(CH4PSP,y,'CH4PSP');
            if CH4PSP(H1NBdown(1),H1NBdown(2))==0
                NZE(15)=NZE(15)-1;
            end
        case(CH2)
            CH2DSP(H1NBdown(1),H1NBdown(2))=CH2DSP(H1NBdown(1),H1NBdown(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(H1NBdown(1),H1NBdown(2))==1
                NZE(7)=NZE(7)+1;
            end
            CH3PSP(H1NBdown(1),H1NBdown(2))=CH3PSP(H1NBdown(1),H1NBdown(2))-1;%removeevent(CH3PSP,y,'CH3PSP');
            if CH3PSP(H1NBdown(1),H1NBdown(2))==0
                NZE(16)=NZE(16)-1;
            end
        case(CH)
            CHDSP(H1NBdown(1),H1NBdown(2))=CHDSP(H1NBdown(1),H1NBdown(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(H1NBdown(1),H1NBdown(2))==1
                NZE(8)=NZE(8)+1;
            end
            CH2PSP(H1NBdown(1),H1NBdown(2))=CH2PSP(H1NBdown(1),H1NBdown(2))-1;%removeevent(CH2PSP,y,'CH2PSP');
            if CH2PSP(H1NBdown(1),H1NBdown(2))==0
                NZE(17)=NZE(17)-1;
            end
        case(C)
            CdiffusionSP(H1NBdown(1),H1NBdown(2))=CdiffusionSP(H1NBdown(1),H1NBdown(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(H1NBdown(1),H1NBdown(2))==1
                NZE(3)=NZE(3)+1;
            end
            CHPSP(H1NBdown(1),H1NBdown(2))=CHPSP(H1NBdown(1),H1NBdown(2))-1;%removeevent(CHPSP,y,'CHPSP');
            if CHPSP(H1NBdown(1),H1NBdown(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(C3)
            C3diffusionSP(H1NBdown(1),H1NBdown(2))=C3diffusionSP(H1NBdown(1),H1NBdown(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP');  
            if C3diffusionSP(H1NBdown(1),H1NBdown(2))==1
                NZE(4)=NZE(4)+1;
            end
    end
end


if H1NBleft(1)>=1
    Checkspecies=Conf(H1NBleft(1),H1NBleft(2)); %check H neighbour

    switch (Checkspecies)
        case(0)
            CH4DSP(H1pickedup(1),H1pickedup(2))=CH4DSP(H1pickedup(1),H1pickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(H1pickedup(1),H1pickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(H1NBleft(1),H1NBleft(2))=CH4DSP(H1NBleft(1),H1NBleft(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(H1NBleft(1),H1NBleft(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(H1NBleft(1),H1NBleft(2))=HdiffusionSP(H1NBleft(1),H1NBleft(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(H1NBleft(1),H1NBleft(2))==1	
                NZE(1)=NZE(1)+1;
            end
            
            H2PSP(H1pickedup(1),H1pickedup(2))=H2PSP(H1pickedup(1),H1pickedup(2))-1;%removeevent(H2PSP,x,'H2PSP');
            if H2PSP(H1pickedup(1),H1pickedup(2))==0
                NZE(12)=NZE(12)-1;
            end
            H2PSP(H1NBleft(1),H1NBleft(2))=H2PSP(H1NBleft(1),H1NBleft(2))-1;%removeevent(H2PSP,y,'H2PSP');
            if H2PSP(H1NBleft(1),H1NBleft(2))==0
                NZE(12)=NZE(12)-1;
            end
            
        case(CH3)
            CH3DSP(H1NBleft(1),H1NBleft(2))=CH3DSP(H1NBleft(1),H1NBleft(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(H1NBleft(1),H1NBleft(2))==1
                NZE(6)=NZE(6)+1;
            end
            CH4PSP(H1NBleft(1),H1NBleft(2))=CH4PSP(H1NBleft(1),H1NBleft(2))-1;%removeevent(CH4PSP,y,'CH4PSP');
            if CH4PSP(H1NBleft(1),H1NBleft(2))==0
                NZE(15)=NZE(15)-1;
            end
        case(CH2)
            CH2DSP(H1NBleft(1),H1NBleft(2))=CH2DSP(H1NBleft(1),H1NBleft(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(H1NBleft(1),H1NBleft(2))==1
                NZE(7)=NZE(7)+1;
            end
            CH3PSP(H1NBleft(1),H1NBleft(2))=CH3PSP(H1NBleft(1),H1NBleft(2))-1;%removeevent(CH3PSP,y,'CH3PSP');
            if CH3PSP(H1NBleft(1),H1NBleft(2))==0
                NZE(16)=NZE(16)-1;
            end
        case(CH)
            CHDSP(H1NBleft(1),H1NBleft(2))=CHDSP(H1NBleft(1),H1NBleft(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(H1NBleft(1),H1NBleft(2))==1
                NZE(8)=NZE(8)+1;
            end
            CH2PSP(H1NBleft(1),H1NBleft(2))=CH2PSP(H1NBleft(1),H1NBleft(2))-1;%removeevent(CH2PSP,y,'CH2PSP');
            if CH2PSP(H1NBleft(1),H1NBleft(2))==0
                NZE(17)=NZE(17)-1;
            end
        case(C)
            CdiffusionSP(H1NBleft(1),H1NBleft(2))=CdiffusionSP(H1NBleft(1),H1NBleft(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(H1NBleft(1),H1NBleft(2))==1
                NZE(3)=NZE(3)+1;
            end
            CHPSP(H1NBleft(1),H1NBleft(2))=CHPSP(H1NBleft(1),H1NBleft(2))-1;%removeevent(CHPSP,y,'CHPSP');
            if CHPSP(H1NBleft(1),H1NBleft(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(C3)
            C3diffusionSP(H1NBleft(1),H1NBleft(2))=C3diffusionSP(H1NBleft(1),H1NBleft(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP');  
            if C3diffusionSP(H1NBleft(1),H1NBleft(2))==1
                NZE(4)=NZE(4)+1;
            end
    end
end

if H1NBright(1)<=W
    Checkspecies=Conf(H1NBright(1),H1NBright(2)); %check H neighbour

    switch (Checkspecies)
        case(0)
            CH4DSP(H1pickedup(1),H1pickedup(2))=CH4DSP(H1pickedup(1),H1pickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(H1pickedup(1),H1pickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(H1NBright(1),H1NBright(2))=CH4DSP(H1NBright(1),H1NBright(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(H1NBright(1),H1NBright(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(H1NBright(1),H1NBright(2))=HdiffusionSP(H1NBright(1),H1NBright(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(H1NBright(1),H1NBright(2))==1	
                NZE(1)=NZE(1)+1;
            end
            
            H2PSP(H1pickedup(1),H1pickedup(2))=H2PSP(H1pickedup(1),H1pickedup(2))-1;%removeevent(H2PSP,x,'H2PSP');
            if H2PSP(H1pickedup(1),H1pickedup(2))==0
                NZE(12)=NZE(12)-1;
            end
            H2PSP(H1NBright(1),H1NBright(2))=H2PSP(H1NBright(1),H1NBright(2))-1;%removeevent(H2PSP,y,'H2PSP');
            if H2PSP(H1NBright(1),H1NBright(2))==0
                NZE(12)=NZE(12)-1;
            end
            
        case(CH3)
            CH3DSP(H1NBright(1),H1NBright(2))=CH3DSP(H1NBright(1),H1NBright(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(H1NBright(1),H1NBright(2))==1
                NZE(6)=NZE(6)+1;
            end
            CH4PSP(H1NBright(1),H1NBright(2))=CH4PSP(H1NBright(1),H1NBright(2))-1;%removeevent(CH4PSP,y,'CH4PSP');
            if CH4PSP(H1NBright(1),H1NBright(2))==0
                NZE(15)=NZE(15)-1;
            end
        case(CH2)
            CH2DSP(H1NBright(1),H1NBright(2))=CH2DSP(H1NBright(1),H1NBright(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(H1NBright(1),H1NBright(2))==1
                NZE(7)=NZE(7)+1;
            end
            CH3PSP(H1NBright(1),H1NBright(2))=CH3PSP(H1NBright(1),H1NBright(2))-1;%removeevent(CH3PSP,y,'CH3PSP');
            if CH3PSP(H1NBright(1),H1NBright(2))==0
                NZE(16)=NZE(16)-1;
            end
        case(CH)
            CHDSP(H1NBright(1),H1NBright(2))=CHDSP(H1NBright(1),H1NBright(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(H1NBright(1),H1NBright(2))==1
                NZE(8)=NZE(8)+1;
            end
            CH2PSP(H1NBright(1),H1NBright(2))=CH2PSP(H1NBright(1),H1NBright(2))-1;%removeevent(CH2PSP,y,'CH2PSP');
            if CH2PSP(H1NBright(1),H1NBright(2))==0
                NZE(17)=NZE(17)-1;
            end
        case(C)
            CdiffusionSP(H1NBright(1),H1NBright(2))=CdiffusionSP(H1NBright(1),H1NBright(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(H1NBright(1),H1NBright(2))==1
                NZE(3)=NZE(3)+1;
            end
            CHPSP(H1NBright(1),H1NBright(2))=CHPSP(H1NBright(1),H1NBright(2))-1;%removeevent(CHPSP,y,'CHPSP');
            if CHPSP(H1NBright(1),H1NBright(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(C3)
            C3diffusionSP(H1NBright(1),H1NBright(2))=C3diffusionSP(H1NBright(1),H1NBright(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP');  
            if C3diffusionSP(H1NBright(1),H1NBright(2))==1
                NZE(4)=NZE(4)+1;
            end
    end
end

if H2NBup(2)<=L
    Checkspecies=Conf(H2NBup(1),H2NBup(2)); %check H2 neighbour

    switch (Checkspecies)
        case(0)
            CH4DSP(H2pickedup(1),H2pickedup(2))=CH4DSP(H2pickedup(1),H2pickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(H2pickedup(1),H2pickedup(2))==1
                NZE(5)=NZE(5)+1;
            end

            CH4DSP(H2NBup(1),H2NBup(2))=CH4DSP(H2NBup(1),H2NBup(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(H2NBup(1),H2NBup(2))==1
                NZE(5)=NZE(5)+1;
            end

        case(H)
            HdiffusionSP(H2NBup(1),H2NBup(2))=HdiffusionSP(H2NBup(1),H2NBup(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(H2NBup(1),H2NBup(2))==1	
                NZE(1)=NZE(1)+1;
            end
            H2PSP(H2pickedup(1),H2pickedup(2))=H2PSP(H2pickedup(1),H2pickedup(2))-1;%removeevent(H2PSP,x,'H2PSP');
            if H2PSP(H2pickedup(1),H2pickedup(2))==0
                NZE(12)=NZE(12)-1;
            end
            H2PSP(H2NBup(1),H2NBup(2))=H2PSP(H2NBup(1),H2NBup(2))-1;%removeevent(H2PSP,y,'H2PSP');
            if H2PSP(H2NBup(1),H2NBup(2))==0
                NZE(12)=NZE(12)-1;
            end
        case(CH3)
            CH3DSP(H2NBup(1),H2NBup(2))=CH3DSP(H2NBup(1),H2NBup(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(H2NBup(1),H2NBup(2))==1
                NZE(6)=NZE(6)+1;
            end
            CH4PSP(H2NBup(1),H2NBup(2))=CH4PSP(H2NBup(1),H2NBup(2))-1;%removeevent(CH4PSP,y,'CH4PSP');
            if CH4PSP(H2NBup(1),H2NBup(2))==0
                NZE(15)=NZE(15)-1;
            end
        case(CH2)
            CH2DSP(H2NBup(1),H2NBup(2))=CH2DSP(H2NBup(1),H2NBup(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(H2NBup(1),H2NBup(2))==1
                NZE(7)=NZE(7)+1;
            end
            CH3PSP(H2NBup(1),H2NBup(2))=CH3PSP(H2NBup(1),H2NBup(2))-1;%removeevent(CH3PSP,y,'CH3PSP');
            if CH3PSP(H2NBup(1),H2NBup(2))==0
                NZE(16)=NZE(16)-1;
            end
        case(CH)
            CHDSP(H2NBup(1),H2NBup(2))=CHDSP(H2NBup(1),H2NBup(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(H2NBup(1),H2NBup(2))==1
                NZE(8)=NZE(8)+1;
            end
            CH2PSP(H2NBup(1),H2NBup(2))=CH2PSP(H2NBup(1),H2NBup(2))-1;%removeevent(CH2PSP,y,'CH2PSP');
            if CH2PSP(H2NBup(1),H2NBup(2))==0
                NZE(17)=NZE(17)-1;
            end
        case(C)
            CdiffusionSP(H2NBup(1),H2NBup(2))=CdiffusionSP(H2NBup(1),H2NBup(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(H2NBup(1),H2NBup(2))==1
                NZE(3)=NZE(3)+1;
            end
            CHPSP(H2NBup(1),H2NBup(2))=CHPSP(H2NBup(1),H2NBup(2))-1;%removeevent(CHPSP,y,'CHPSP');
            if CHPSP(H2NBup(1),H2NBup(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(C3)
            C3diffusionSP(H2NBup(1),H2NBup(2))=C3diffusionSP(H2NBup(1),H2NBup(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP');  
            if C3diffusionSP(H2NBup(1),H2NBup(2))==1
                NZE(4)=NZE(4)+1;
            end
    end
end

if H2NBdown(2)>=1
    Checkspecies=Conf(H2NBdown(1),H2NBdown(2)); %check H2 neighbour

    switch (Checkspecies)
        case(0)
            CH4DSP(H2pickedup(1),H2pickedup(2))=CH4DSP(H2pickedup(1),H2pickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(H2pickedup(1),H2pickedup(2))==1
                NZE(5)=NZE(5)+1;
            end

            CH4DSP(H2NBdown(1),H2NBdown(2))=CH4DSP(H2NBdown(1),H2NBdown(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(H2NBdown(1),H2NBdown(2))==1
                NZE(5)=NZE(5)+1;
            end

        case(H)
            HdiffusionSP(H2NBdown(1),H2NBdown(2))=HdiffusionSP(H2NBdown(1),H2NBdown(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(H2NBdown(1),H2NBdown(2))==1	
                NZE(1)=NZE(1)+1;
            end
            H2PSP(H2pickedup(1),H2pickedup(2))=H2PSP(H2pickedup(1),H2pickedup(2))-1;%removeevent(H2PSP,x,'H2PSP');
            if H2PSP(H2pickedup(1),H2pickedup(2))==0
                NZE(12)=NZE(12)-1;
            end
            H2PSP(H2NBdown(1),H2NBdown(2))=H2PSP(H2NBdown(1),H2NBdown(2))-1;%removeevent(H2PSP,y,'H2PSP');
            if H2PSP(H2NBdown(1),H2NBdown(2))==0
                NZE(12)=NZE(12)-1;
            end
        case(CH3)
            CH3DSP(H2NBdown(1),H2NBdown(2))=CH3DSP(H2NBdown(1),H2NBdown(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(H2NBdown(1),H2NBdown(2))==1
                NZE(6)=NZE(6)+1;
            end
            CH4PSP(H2NBdown(1),H2NBdown(2))=CH4PSP(H2NBdown(1),H2NBdown(2))-1;%removeevent(CH4PSP,y,'CH4PSP');
            if CH4PSP(H2NBdown(1),H2NBdown(2))==0
                NZE(15)=NZE(15)-1;
            end
        case(CH2)
            CH2DSP(H2NBdown(1),H2NBdown(2))=CH2DSP(H2NBdown(1),H2NBdown(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(H2NBdown(1),H2NBdown(2))==1
                NZE(7)=NZE(7)+1;
            end
            CH3PSP(H2NBdown(1),H2NBdown(2))=CH3PSP(H2NBdown(1),H2NBdown(2))-1;%removeevent(CH3PSP,y,'CH3PSP');
            if CH3PSP(H2NBdown(1),H2NBdown(2))==0
                NZE(16)=NZE(16)-1;
            end
        case(CH)
            CHDSP(H2NBdown(1),H2NBdown(2))=CHDSP(H2NBdown(1),H2NBdown(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(H2NBdown(1),H2NBdown(2))==1
                NZE(8)=NZE(8)+1;
            end
            CH2PSP(H2NBdown(1),H2NBdown(2))=CH2PSP(H2NBdown(1),H2NBdown(2))-1;%removeevent(CH2PSP,y,'CH2PSP');
            if CH2PSP(H2NBdown(1),H2NBdown(2))==0
                NZE(17)=NZE(17)-1;
            end
        case(C)
            CdiffusionSP(H2NBdown(1),H2NBdown(2))=CdiffusionSP(H2NBdown(1),H2NBdown(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(H2NBdown(1),H2NBdown(2))==1
                NZE(3)=NZE(3)+1;
            end
            CHPSP(H2NBdown(1),H2NBdown(2))=CHPSP(H2NBdown(1),H2NBdown(2))-1;%removeevent(CHPSP,y,'CHPSP');
            if CHPSP(H2NBdown(1),H2NBdown(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(C3)
            C3diffusionSP(H2NBdown(1),H2NBdown(2))=C3diffusionSP(H2NBdown(1),H2NBdown(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP');  
            if C3diffusionSP(H2NBdown(1),H2NBdown(2))==1
                NZE(4)=NZE(4)+1;
            end
    end
end
    
if H2NBleft(1)>=1
    Checkspecies=Conf(H2NBleft(1),H2NBleft(2)); %check H2 neighbour

    switch (Checkspecies)
        case(0)
            CH4DSP(H2pickedup(1),H2pickedup(2))=CH4DSP(H2pickedup(1),H2pickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(H2pickedup(1),H2pickedup(2))==1
                NZE(5)=NZE(5)+1;
            end

            CH4DSP(H2NBleft(1),H2NBleft(2))=CH4DSP(H2NBleft(1),H2NBleft(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(H2NBleft(1),H2NBleft(2))==1
                NZE(5)=NZE(5)+1;
            end

        case(H)
            HdiffusionSP(H2NBleft(1),H2NBleft(2))=HdiffusionSP(H2NBleft(1),H2NBleft(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(H2NBleft(1),H2NBleft(2))==1	
                NZE(1)=NZE(1)+1;
            end
            H2PSP(H2pickedup(1),H2pickedup(2))=H2PSP(H2pickedup(1),H2pickedup(2))-1;%removeevent(H2PSP,x,'H2PSP');
            if H2PSP(H2pickedup(1),H2pickedup(2))==0
                NZE(12)=NZE(12)-1;
            end
            H2PSP(H2NBleft(1),H2NBleft(2))=H2PSP(H2NBleft(1),H2NBleft(2))-1;%removeevent(H2PSP,y,'H2PSP');
            if H2PSP(H2NBleft(1),H2NBleft(2))==0
                NZE(12)=NZE(12)-1;
            end
        case(CH3)
            CH3DSP(H2NBleft(1),H2NBleft(2))=CH3DSP(H2NBleft(1),H2NBleft(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(H2NBleft(1),H2NBleft(2))==1
                NZE(6)=NZE(6)+1;
            end
            CH4PSP(H2NBleft(1),H2NBleft(2))=CH4PSP(H2NBleft(1),H2NBleft(2))-1;%removeevent(CH4PSP,y,'CH4PSP');
            if CH4PSP(H2NBleft(1),H2NBleft(2))==0
                NZE(15)=NZE(15)-1;
            end
        case(CH2)
            CH2DSP(H2NBleft(1),H2NBleft(2))=CH2DSP(H2NBleft(1),H2NBleft(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(H2NBleft(1),H2NBleft(2))==1
                NZE(7)=NZE(7)+1;
            end
            CH3PSP(H2NBleft(1),H2NBleft(2))=CH3PSP(H2NBleft(1),H2NBleft(2))-1;%removeevent(CH3PSP,y,'CH3PSP');
            if CH3PSP(H2NBleft(1),H2NBleft(2))==0
                NZE(16)=NZE(16)-1;
            end
        case(CH)
            CHDSP(H2NBleft(1),H2NBleft(2))=CHDSP(H2NBleft(1),H2NBleft(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(H2NBleft(1),H2NBleft(2))==1
                NZE(8)=NZE(8)+1;
            end
            CH2PSP(H2NBleft(1),H2NBleft(2))=CH2PSP(H2NBleft(1),H2NBleft(2))-1;%removeevent(CH2PSP,y,'CH2PSP');
            if CH2PSP(H2NBleft(1),H2NBleft(2))==0
                NZE(17)=NZE(17)-1;
            end
        case(C)
            CdiffusionSP(H2NBleft(1),H2NBleft(2))=CdiffusionSP(H2NBleft(1),H2NBleft(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(H2NBleft(1),H2NBleft(2))==1
                NZE(3)=NZE(3)+1;
            end
            CHPSP(H2NBleft(1),H2NBleft(2))=CHPSP(H2NBleft(1),H2NBleft(2))-1;%removeevent(CHPSP,y,'CHPSP');
            if CHPSP(H2NBleft(1),H2NBleft(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(C3)
            C3diffusionSP(H2NBleft(1),H2NBleft(2))=C3diffusionSP(H2NBleft(1),H2NBleft(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP');  
            if C3diffusionSP(H2NBleft(1),H2NBleft(2))==1
                NZE(4)=NZE(4)+1;
            end
    end
end

if H2NBright(1)<=W
    Checkspecies=Conf(H2NBright(1),H2NBright(2)); %check H2 neighbour

    switch (Checkspecies)
        case(0)
            CH4DSP(H2pickedup(1),H2pickedup(2))=CH4DSP(H2pickedup(1),H2pickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(H2pickedup(1),H2pickedup(2))==1
                NZE(5)=NZE(5)+1;
            end

            CH4DSP(H2NBright(1),H2NBright(2))=CH4DSP(H2NBright(1),H2NBright(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(H2NBright(1),H2NBright(2))==1
                NZE(5)=NZE(5)+1;
            end

        case(H)
            HdiffusionSP(H2NBright(1),H2NBright(2))=HdiffusionSP(H2NBright(1),H2NBright(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(H2NBright(1),H2NBright(2))==1	
                NZE(1)=NZE(1)+1;
            end
            H2PSP(H2pickedup(1),H2pickedup(2))=H2PSP(H2pickedup(1),H2pickedup(2))-1;%removeevent(H2PSP,x,'H2PSP');
            if H2PSP(H2pickedup(1),H2pickedup(2))==0
                NZE(12)=NZE(12)-1;
            end
            H2PSP(H2NBright(1),H2NBright(2))=H2PSP(H2NBright(1),H2NBright(2))-1;%removeevent(H2PSP,y,'H2PSP');
            if H2PSP(H2NBright(1),H2NBright(2))==0
                NZE(12)=NZE(12)-1;
            end
        case(CH3)
            CH3DSP(H2NBright(1),H2NBright(2))=CH3DSP(H2NBright(1),H2NBright(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(H2NBright(1),H2NBright(2))==1
                NZE(6)=NZE(6)+1;
            end
            CH4PSP(H2NBright(1),H2NBright(2))=CH4PSP(H2NBright(1),H2NBright(2))-1;%removeevent(CH4PSP,y,'CH4PSP');
            if CH4PSP(H2NBright(1),H2NBright(2))==0
                NZE(15)=NZE(15)-1;
            end
        case(CH2)
            CH2DSP(H2NBright(1),H2NBright(2))=CH2DSP(H2NBright(1),H2NBright(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(H2NBright(1),H2NBright(2))==1
                NZE(7)=NZE(7)+1;
            end
            CH3PSP(H2NBright(1),H2NBright(2))=CH3PSP(H2NBright(1),H2NBright(2))-1;%removeevent(CH3PSP,y,'CH3PSP');
            if CH3PSP(H2NBright(1),H2NBright(2))==0
                NZE(16)=NZE(16)-1;
            end
        case(CH)
            CHDSP(H2NBright(1),H2NBright(2))=CHDSP(H2NBright(1),H2NBright(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(H2NBright(1),H2NBright(2))==1
                NZE(8)=NZE(8)+1;
            end
            CH2PSP(H2NBright(1),H2NBright(2))=CH2PSP(H2NBright(1),H2NBright(2))-1;%removeevent(CH2PSP,y,'CH2PSP');
            if CH2PSP(H2NBright(1),H2NBright(2))==0
                NZE(17)=NZE(17)-1;
            end
        case(C)
            CdiffusionSP(H2NBright(1),H2NBright(2))=CdiffusionSP(H2NBright(1),H2NBright(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(H2NBright(1),H2NBright(2))==1
                NZE(3)=NZE(3)+1;
            end
            CHPSP(H2NBright(1),H2NBright(2))=CHPSP(H2NBright(1),H2NBright(2))-1;%removeevent(CHPSP,y,'CHPSP');
            if CHPSP(H2NBright(1),H2NBright(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(C3)
            C3diffusionSP(H2NBright(1),H2NBright(2))=C3diffusionSP(H2NBright(1),H2NBright(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP');  
            if C3diffusionSP(H2NBright(1),H2NBright(2))==1
                NZE(4)=NZE(4)+1;
            end
    end
end

end