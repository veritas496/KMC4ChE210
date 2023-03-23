function [NZE,CHDSP,CH2PSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,CHPSP,C3diffusionSP,CH4PSP]=redefineCHPcheckNB(NZE,Conf,W,L,H,C,C2,C3,...
    CX,CHDSP,CH2PSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,CH3,CH2,CH,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,CHPSP,C3diffusionSP,CH4PSP,...
    Cpickedup,CNBup,CNBdown,CNBleft,CNBright,Hpickedup,HNBup,HNBdown,HNBleft,HNBright) 
%x is CH3pickedup;y is one of its neighbour

if CNBup(2)<=L

    Checkspecies=Conf(CNBup(1),CNBup(2)); %check CH neighbour
    
    switch (Checkspecies)
        case(0)
            CHDSP(Cpickedup(1),Cpickedup(2))=CHDSP(Cpickedup(1),Cpickedup(2))+1;%addevent(CHDSP,x,'CHDSP');
            if CHDSP(Cpickedup(1),Cpickedup(2))==1
                NZE(8)=NZE(8)+1;
            end
            
        case(H)
            CHPSP(Cpickedup(1),Cpickedup(2))=CHPSP(Cpickedup(1),Cpickedup(2))-1;%addevent(CHPSP,x,'CHPSP');
            if CHPSP(Cpickedup(1),Cpickedup(2))==0
                NZE(18)=NZE(18)-1;
            end
            CH2PSP(Cpickedup(1),Cpickedup(2))=CH2PSP(Cpickedup(1),Cpickedup(2))+1;%addevent(CH2PSP,x,'CH2PSP');
            if CH2PSP(Cpickedup(1),Cpickedup(2))==1
                NZE(17)=NZE(17)+1;
            end
        case(C)
            C2FSP(Cpickedup(1),Cpickedup(2))=C2FSP(Cpickedup(1),Cpickedup(2))-1;%removeevent(C2FSP,x,'C2FSP');
            if C2FSP(Cpickedup(1),Cpickedup(2))==0
                NZE(9)=NZE(9)-1;
            end
            C2FSP(CNBup(1),CNBup(2))=C2FSP(CNBup(1),CNBup(2))-1;%removeevent(C2FSP,y,'C2FSP');
            if C2FSP(CNBup(1),CNBup(2))==0
                NZE(9)=NZE(9)-1;
            end
        case(C2)
            C3FSP(CNBup(1),CNBup(2))=C3FSP(CNBup(1),CNBup(2))-1;%removeevent(C3FSP,y,'C3FSP');
            if C3FSP(CNBup(1),CNBup(2))==0
                NZE(10)=NZE(10)-1;
            end
        case(C3)
            CXFSP(CNBup(1),CNBup(2))=CXFSP(CNBup(1),CNBup(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(CNBup(1),CNBup(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(CX)
            CXFSP(CNBup(1),CNBup(2))=CXFSP(CNBup(1),CNBup(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(CNBup(1),CNBup(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end

if CNBdown(2)>=1

    Checkspecies=Conf(CNBdown(1),CNBdown(2)); %check CH neighbour
    
    switch (Checkspecies)
        case(0)
            CHDSP(Cpickedup(1),Cpickedup(2))=CHDSP(Cpickedup(1),Cpickedup(2))+1;%addevent(CHDSP,x,'CHDSP');
            if CHDSP(Cpickedup(1),Cpickedup(2))==1
                NZE(8)=NZE(8)+1;
            end
            
        case(H)
            CHPSP(Cpickedup(1),Cpickedup(2))=CHPSP(Cpickedup(1),Cpickedup(2))-1;%addevent(CHPSP,x,'CHPSP');
            if CHPSP(Cpickedup(1),Cpickedup(2))==0
                NZE(18)=NZE(18)-1;
            end
            CH2PSP(Cpickedup(1),Cpickedup(2))=CH2PSP(Cpickedup(1),Cpickedup(2))+1;%addevent(CH2PSP,x,'CH2PSP');
            if CH2PSP(Cpickedup(1),Cpickedup(2))==1
                NZE(17)=NZE(17)+1;
            end
        case(C)
            C2FSP(Cpickedup(1),Cpickedup(2))=C2FSP(Cpickedup(1),Cpickedup(2))-1;%removeevent(C2FSP,x,'C2FSP');
            if C2FSP(Cpickedup(1),Cpickedup(2))==0
                NZE(9)=NZE(9)-1;
            end
            C2FSP(CNBdown(1),CNBdown(2))=C2FSP(CNBdown(1),CNBdown(2))-1;%removeevent(C2FSP,y,'C2FSP');
            if C2FSP(CNBdown(1),CNBdown(2))==0
                NZE(9)=NZE(9)-1;
            end
        case(C2)
            C3FSP(CNBdown(1),CNBdown(2))=C3FSP(CNBdown(1),CNBdown(2))-1;%removeevent(C3FSP,y,'C3FSP');
            if C3FSP(CNBdown(1),CNBdown(2))==0
                NZE(10)=NZE(10)-1;
            end
        case(C3)
            CXFSP(CNBdown(1),CNBdown(2))=CXFSP(CNBdown(1),CNBdown(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(CNBdown(1),CNBdown(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(CX)
            CXFSP(CNBdown(1),CNBdown(2))=CXFSP(CNBdown(1),CNBdown(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(CNBdown(1),CNBdown(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end

if CNBleft(1)>=1

    Checkspecies=Conf(CNBleft(1),CNBleft(2)); %check CH neighbour
    
    switch (Checkspecies)
        case(0)
            CHDSP(Cpickedup(1),Cpickedup(2))=CHDSP(Cpickedup(1),Cpickedup(2))+1;%addevent(CHDSP,x,'CHDSP');
            if CHDSP(Cpickedup(1),Cpickedup(2))==1
                NZE(8)=NZE(8)+1;
            end
            
        case(H)
            CHPSP(Cpickedup(1),Cpickedup(2))=CHPSP(Cpickedup(1),Cpickedup(2))-1;%addevent(CHPSP,x,'CHPSP');
            if CHPSP(Cpickedup(1),Cpickedup(2))==0
                NZE(18)=NZE(18)-1;
            end
            CH2PSP(Cpickedup(1),Cpickedup(2))=CH2PSP(Cpickedup(1),Cpickedup(2))+1;%addevent(CH2PSP,x,'CH2PSP');
            if CH2PSP(Cpickedup(1),Cpickedup(2))==1
                NZE(17)=NZE(17)+1;
            end
        case(C)
            C2FSP(Cpickedup(1),Cpickedup(2))=C2FSP(Cpickedup(1),Cpickedup(2))-1;%removeevent(C2FSP,x,'C2FSP');
            if C2FSP(Cpickedup(1),Cpickedup(2))==0
                NZE(9)=NZE(9)-1;
            end
            C2FSP(CNBleft(1),CNBleft(2))=C2FSP(CNBleft(1),CNBleft(2))-1;%removeevent(C2FSP,y,'C2FSP');
            if C2FSP(CNBleft(1),CNBleft(2))==0
                NZE(9)=NZE(9)-1;
            end
        case(C2)
            C3FSP(CNBleft(1),CNBleft(2))=C3FSP(CNBleft(1),CNBleft(2))-1;%removeevent(C3FSP,y,'C3FSP');
            if C3FSP(CNBleft(1),CNBleft(2))==0
                NZE(10)=NZE(10)-1;
            end
        case(C3)
            CXFSP(CNBleft(1),CNBleft(2))=CXFSP(CNBleft(1),CNBleft(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(CNBleft(1),CNBleft(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(CX)
            CXFSP(CNBleft(1),CNBleft(2))=CXFSP(CNBleft(1),CNBleft(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(CNBleft(1),CNBleft(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end

if CNBright(1)<=W

    Checkspecies=Conf(CNBright(1),CNBright(2)); %check CH neighbour
    
    switch (Checkspecies)
        case(0)
            CHDSP(Cpickedup(1),Cpickedup(2))=CHDSP(Cpickedup(1),Cpickedup(2))+1;%addevent(CHDSP,x,'CHDSP');
            if CHDSP(Cpickedup(1),Cpickedup(2))==1
                NZE(8)=NZE(8)+1;
            end
            
        case(H)
            CHPSP(Cpickedup(1),Cpickedup(2))=CHPSP(Cpickedup(1),Cpickedup(2))-1;%addevent(CHPSP,x,'CHPSP');
            if CHPSP(Cpickedup(1),Cpickedup(2))==0
                NZE(18)=NZE(18)-1;
            end
            CH2PSP(Cpickedup(1),Cpickedup(2))=CH2PSP(Cpickedup(1),Cpickedup(2))+1;%addevent(CH2PSP,x,'CH2PSP');
            if CH2PSP(Cpickedup(1),Cpickedup(2))==1
                NZE(17)=NZE(17)+1;
            end
        case(C)
            C2FSP(Cpickedup(1),Cpickedup(2))=C2FSP(Cpickedup(1),Cpickedup(2))-1;%removeevent(C2FSP,x,'C2FSP');
            if C2FSP(Cpickedup(1),Cpickedup(2))==0
                NZE(9)=NZE(9)-1;
            end
            C2FSP(CNBright(1),CNBright(2))=C2FSP(CNBright(1),CNBright(2))-1;%removeevent(C2FSP,y,'C2FSP');
            if C2FSP(CNBright(1),CNBright(2))==0
                NZE(9)=NZE(9)-1;
            end
        case(C2)
            C3FSP(CNBright(1),CNBright(2))=C3FSP(CNBright(1),CNBright(2))-1;%removeevent(C3FSP,y,'C3FSP');
            if C3FSP(CNBright(1),CNBright(2))==0
                NZE(10)=NZE(10)-1;
            end
        case(C3)
            CXFSP(CNBright(1),CNBright(2))=CXFSP(CNBright(1),CNBright(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(CNBright(1),CNBright(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(CX)
            CXFSP(CNBright(1),CNBright(2))=CXFSP(CNBright(1),CNBright(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(CNBright(1),CNBright(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end
   
if HNBup(2)<=L

    Checkspecies=Conf(HNBup(1),HNBup(2)); %check H neighbour

    switch (Checkspecies)
        case(0) 
            CH4DSP(Hpickedup(1),Hpickedup(2))=CH4DSP(Hpickedup(1),Hpickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(Hpickedup(1),Hpickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(HNBup(1),HNBup(2))=CH4DSP(HNBup(1),HNBup(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(HNBup(1),HNBup(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(HNBup(1),HNBup(2))=HdiffusionSP(HNBup(1),HNBup(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(HNBup(1),HNBup(2))==1
                NZE(1)=NZE(1)+1;
            end
            H2PSP(Hpickedup(1),Hpickedup(2))=H2PSP(Hpickedup(1),Hpickedup(2))-1;%removeevent(H2PSP,x,'H2PSP');
            if H2PSP(Hpickedup(1),Hpickedup(2))==0
                NZE(12)=NZE(12)-1;
            end
            H2PSP(HNBup(1),HNBup(2))=H2PSP(HNBup(1),HNBup(2))-1;%removeevent(H2PSP,y,'H2PSP');
            if H2PSP(HNBup(1),HNBup(2))==0
                NZE(12)=NZE(12)-1;
            end
        case(CH3)
            CH3DSP(HNBup(1),HNBup(2))=CH3DSP(HNBup(1),HNBup(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(HNBup(1),HNBup(2))==1
                NZE(6)=NZE(6)+1;
            end
            CH4PSP(HNBup(1),HNBup(2))=CH4PSP(HNBup(1),HNBup(2))-1;%removeevent(CH4PSP,y,'CH4PSP');
            if CH4PSP(HNBup(1),HNBup(2))==0
                NZE(15)=NZE(15)-1;
            end
        case(CH2)
            CH2DSP(HNBup(1),HNBup(2))=CH2DSP(HNBup(1),HNBup(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(HNBup(1),HNBup(2))==1
                NZE(7)=NZE(7)+1;
            end
            CH3PSP(HNBup(1),HNBup(2))=CH3PSP(HNBup(1),HNBup(2))-1;%removeevent(CH3PSP,y,'CH3PSP');
            if CH3PSP(HNBup(1),HNBup(2))==0
                NZE(16)=NZE(16)-1;
            end
        case(CH)
            CHDSP(HNBup(1),HNBup(2))=CHDSP(HNBup(1),HNBup(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(HNBup(1),HNBup(2))==1
                NZE(8)=NZE(8)+1;
            end
            CH2PSP(HNBup(1),HNBup(2))=CH2PSP(HNBup(1),HNBup(2))-1;%removeevent(CH2PSP,y,'CH2PSP');
            if CH2PSP(HNBup(1),HNBup(2))==0
                NZE(17)=NZE(17)-1;
            end
        case(C)
            CdiffusionSP(HNBup(1),HNBup(2))=CdiffusionSP(HNBup(1),HNBup(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(HNBup(1),HNBup(2))==1
                NZE(3)=NZE(3)+1;
            end
            CHPSP(HNBup(1),HNBup(2))=CHPSP(HNBup(1),HNBup(2))-1;%removeevent(CHPSP,y,'CHPSP');
            if CHPSP(HNBup(1),HNBup(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(C3)
            C3diffusionSP(HNBup(1),HNBup(2))=C3diffusionSP(HNBup(1),HNBup(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP');  
            if C3diffusionSP(HNBup(1),HNBup(2))==1
                NZE(4)=NZE(4)+1;
            end
    end
end


if HNBdown(2)>=1

    Checkspecies=Conf(HNBdown(1),HNBdown(2)); %check H neighbour

    switch (Checkspecies)
        case(0) 
            CH4DSP(Hpickedup(1),Hpickedup(2))=CH4DSP(Hpickedup(1),Hpickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(Hpickedup(1),Hpickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(HNBdown(1),HNBdown(2))=CH4DSP(HNBdown(1),HNBdown(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(HNBdown(1),HNBdown(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(HNBdown(1),HNBdown(2))=HdiffusionSP(HNBdown(1),HNBdown(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(HNBdown(1),HNBdown(2))==1
                NZE(1)=NZE(1)+1;
            end
            H2PSP(Hpickedup(1),Hpickedup(2))=H2PSP(Hpickedup(1),Hpickedup(2))-1;%removeevent(H2PSP,x,'H2PSP');
            if H2PSP(Hpickedup(1),Hpickedup(2))==0
                NZE(12)=NZE(12)-1;
            end
            H2PSP(HNBdown(1),HNBdown(2))=H2PSP(HNBdown(1),HNBdown(2))-1;%removeevent(H2PSP,y,'H2PSP');
            if H2PSP(HNBdown(1),HNBdown(2))==0
                NZE(12)=NZE(12)-1;
            end
        case(CH3)
            CH3DSP(HNBdown(1),HNBdown(2))=CH3DSP(HNBdown(1),HNBdown(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(HNBdown(1),HNBdown(2))==1
                NZE(6)=NZE(6)+1;
            end
            CH4PSP(HNBdown(1),HNBdown(2))=CH4PSP(HNBdown(1),HNBdown(2))-1;%removeevent(CH4PSP,y,'CH4PSP');
            if CH4PSP(HNBdown(1),HNBdown(2))==0
                NZE(15)=NZE(15)-1;
            end
        case(CH2)
            CH2DSP(HNBdown(1),HNBdown(2))=CH2DSP(HNBdown(1),HNBdown(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(HNBdown(1),HNBdown(2))==1
                NZE(7)=NZE(7)+1;
            end
            CH3PSP(HNBdown(1),HNBdown(2))=CH3PSP(HNBdown(1),HNBdown(2))-1;%removeevent(CH3PSP,y,'CH3PSP');
            if CH3PSP(HNBdown(1),HNBdown(2))==0
                NZE(16)=NZE(16)-1;
            end
        case(CH)
            CHDSP(HNBdown(1),HNBdown(2))=CHDSP(HNBdown(1),HNBdown(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(HNBdown(1),HNBdown(2))==1
                NZE(8)=NZE(8)+1;
            end
            CH2PSP(HNBdown(1),HNBdown(2))=CH2PSP(HNBdown(1),HNBdown(2))-1;%removeevent(CH2PSP,y,'CH2PSP');
            if CH2PSP(HNBdown(1),HNBdown(2))==0
                NZE(17)=NZE(17)-1;
            end
        case(C)
            CdiffusionSP(HNBdown(1),HNBdown(2))=CdiffusionSP(HNBdown(1),HNBdown(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(HNBdown(1),HNBdown(2))==1
                NZE(3)=NZE(3)+1;
            end
            CHPSP(HNBdown(1),HNBdown(2))=CHPSP(HNBdown(1),HNBdown(2))-1;%removeevent(CHPSP,y,'CHPSP');
            if CHPSP(HNBdown(1),HNBdown(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(C3)
            C3diffusionSP(HNBdown(1),HNBdown(2))=C3diffusionSP(HNBdown(1),HNBdown(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP');  
            if C3diffusionSP(HNBdown(1),HNBdown(2))==1
                NZE(4)=NZE(4)+1;
            end
    end
end

if HNBleft(1)>=1

    Checkspecies=Conf(HNBleft(1),HNBleft(2)); %check H neighbour

    switch (Checkspecies)
        case(0) 
            CH4DSP(Hpickedup(1),Hpickedup(2))=CH4DSP(Hpickedup(1),Hpickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(Hpickedup(1),Hpickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(HNBleft(1),HNBleft(2))=CH4DSP(HNBleft(1),HNBleft(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(HNBleft(1),HNBleft(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(HNBleft(1),HNBleft(2))=HdiffusionSP(HNBleft(1),HNBleft(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(HNBleft(1),HNBleft(2))==1
                NZE(1)=NZE(1)+1;
            end
            H2PSP(Hpickedup(1),Hpickedup(2))=H2PSP(Hpickedup(1),Hpickedup(2))-1;%removeevent(H2PSP,x,'H2PSP');
            if H2PSP(Hpickedup(1),Hpickedup(2))==0
                NZE(12)=NZE(12)-1;
            end
            H2PSP(HNBleft(1),HNBleft(2))=H2PSP(HNBleft(1),HNBleft(2))-1;%removeevent(H2PSP,y,'H2PSP');
            if H2PSP(HNBleft(1),HNBleft(2))==0
                NZE(12)=NZE(12)-1;
            end
        case(CH3)
            CH3DSP(HNBleft(1),HNBleft(2))=CH3DSP(HNBleft(1),HNBleft(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(HNBleft(1),HNBleft(2))==1
                NZE(6)=NZE(6)+1;
            end
            CH4PSP(HNBleft(1),HNBleft(2))=CH4PSP(HNBleft(1),HNBleft(2))-1;%removeevent(CH4PSP,y,'CH4PSP');
            if CH4PSP(HNBleft(1),HNBleft(2))==0
                NZE(15)=NZE(15)-1;
            end
        case(CH2)
            CH2DSP(HNBleft(1),HNBleft(2))=CH2DSP(HNBleft(1),HNBleft(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(HNBleft(1),HNBleft(2))==1
                NZE(7)=NZE(7)+1;
            end
            CH3PSP(HNBleft(1),HNBleft(2))=CH3PSP(HNBleft(1),HNBleft(2))-1;%removeevent(CH3PSP,y,'CH3PSP');
            if CH3PSP(HNBleft(1),HNBleft(2))==0
                NZE(16)=NZE(16)-1;
            end
        case(CH)
            CHDSP(HNBleft(1),HNBleft(2))=CHDSP(HNBleft(1),HNBleft(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(HNBleft(1),HNBleft(2))==1
                NZE(8)=NZE(8)+1;
            end
            CH2PSP(HNBleft(1),HNBleft(2))=CH2PSP(HNBleft(1),HNBleft(2))-1;%removeevent(CH2PSP,y,'CH2PSP');
            if CH2PSP(HNBleft(1),HNBleft(2))==0
                NZE(17)=NZE(17)-1;
            end
        case(C)
            CdiffusionSP(HNBleft(1),HNBleft(2))=CdiffusionSP(HNBleft(1),HNBleft(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(HNBleft(1),HNBleft(2))==1
                NZE(3)=NZE(3)+1;
            end
            CHPSP(HNBleft(1),HNBleft(2))=CHPSP(HNBleft(1),HNBleft(2))-1;%removeevent(CHPSP,y,'CHPSP');
            if CHPSP(HNBleft(1),HNBleft(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(C3)
            C3diffusionSP(HNBleft(1),HNBleft(2))=C3diffusionSP(HNBleft(1),HNBleft(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP');  
            if C3diffusionSP(HNBleft(1),HNBleft(2))==1
                NZE(4)=NZE(4)+1;
            end
    end
end

if HNBright(1)<=W

    Checkspecies=Conf(HNBright(1),HNBright(2)); %check H neighbour

    switch (Checkspecies)
        case(0) 
            CH4DSP(Hpickedup(1),Hpickedup(2))=CH4DSP(Hpickedup(1),Hpickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(Hpickedup(1),Hpickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(HNBright(1),HNBright(2))=CH4DSP(HNBright(1),HNBright(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(HNBright(1),HNBright(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(HNBright(1),HNBright(2))=HdiffusionSP(HNBright(1),HNBright(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(HNBright(1),HNBright(2))==1
                NZE(1)=NZE(1)+1;
            end
            H2PSP(Hpickedup(1),Hpickedup(2))=H2PSP(Hpickedup(1),Hpickedup(2))-1;%removeevent(H2PSP,x,'H2PSP');
            if H2PSP(Hpickedup(1),Hpickedup(2))==0
                NZE(12)=NZE(12)-1;
            end
            H2PSP(HNBright(1),HNBright(2))=H2PSP(HNBright(1),HNBright(2))-1;%removeevent(H2PSP,y,'H2PSP');
            if H2PSP(HNBright(1),HNBright(2))==0
                NZE(12)=NZE(12)-1;
            end
        case(CH3)
            CH3DSP(HNBright(1),HNBright(2))=CH3DSP(HNBright(1),HNBright(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(HNBright(1),HNBright(2))==1
                NZE(6)=NZE(6)+1;
            end
            CH4PSP(HNBright(1),HNBright(2))=CH4PSP(HNBright(1),HNBright(2))-1;%removeevent(CH4PSP,y,'CH4PSP');
            if CH4PSP(HNBright(1),HNBright(2))==0
                NZE(15)=NZE(15)-1;
            end
        case(CH2)
            CH2DSP(HNBright(1),HNBright(2))=CH2DSP(HNBright(1),HNBright(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(HNBright(1),HNBright(2))==1
                NZE(7)=NZE(7)+1;
            end
            CH3PSP(HNBright(1),HNBright(2))=CH3PSP(HNBright(1),HNBright(2))-1;%removeevent(CH3PSP,y,'CH3PSP');
            if CH3PSP(HNBright(1),HNBright(2))==0
                NZE(16)=NZE(16)-1;
            end
        case(CH)
            CHDSP(HNBright(1),HNBright(2))=CHDSP(HNBright(1),HNBright(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(HNBright(1),HNBright(2))==1
                NZE(8)=NZE(8)+1;
            end
            CH2PSP(HNBright(1),HNBright(2))=CH2PSP(HNBright(1),HNBright(2))-1;%removeevent(CH2PSP,y,'CH2PSP');
            if CH2PSP(HNBright(1),HNBright(2))==0
                NZE(17)=NZE(17)-1;
            end
        case(C)
            CdiffusionSP(HNBright(1),HNBright(2))=CdiffusionSP(HNBright(1),HNBright(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(HNBright(1),HNBright(2))==1
                NZE(3)=NZE(3)+1;
            end
            CHPSP(HNBright(1),HNBright(2))=CHPSP(HNBright(1),HNBright(2))-1;%removeevent(CHPSP,y,'CHPSP');
            if CHPSP(HNBright(1),HNBright(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(C3)
            C3diffusionSP(HNBright(1),HNBright(2))=C3diffusionSP(HNBright(1),HNBright(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP');  
            if C3diffusionSP(HNBright(1),HNBright(2))==1
                NZE(4)=NZE(4)+1;
            end
    end
end

end