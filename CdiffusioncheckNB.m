 function [NZE,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP]=CdiffusioncheckNB(NZE,Conf,W,L,H,C,CH3,CH2,CH,C2,C3,...
    CX,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,Cpickedup,CNBup,CNBdown,CNBleft,CNBright,...
    EPpickedup,EPNBup,EPNBdown,EPNBleft,EPNBright)

%x is C pickedup;y is one of its neighbour
if (CNBup(2)<=L)&sum((CNBup~=EPpickedup).^2)~=0
    Checkspecies=Conf(CNBup(1),CNBup(2)); %check C neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(Cpickedup(1),Cpickedup(2))=CH4DSP(Cpickedup(1),Cpickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(Cpickedup(1),Cpickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(CNBup(1),CNBup(2))=CH4DSP(CNBup(1),CNBup(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(CNBup(1),CNBup(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(CNBup(1),CNBup(2))=HdiffusionSP(CNBup(1),CNBup(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(CNBup(1),CNBup(2))==1
                NZE(1)=NZE(1)+1;
            end
            CHPSP(Cpickedup(1),Cpickedup(2))=CHPSP(Cpickedup(1),Cpickedup(2))-1;%removeevent(CHPSP,x,'CHPSP');
            if CHPSP(Cpickedup(1),Cpickedup(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(CH3)
            CH3DSP(CNBup(1),CNBup(2))=CH3DSP(CNBup(1),CNBup(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(CNBup(1),CNBup(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH2DSP(CNBup(1),CNBup(2))=CH2DSP(CNBup(1),CNBup(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(CNBup(1),CNBup(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CHDSP(CNBup(1),CNBup(2))=CHDSP(CNBup(1),CNBup(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(CNBup(1),CNBup(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CdiffusionSP(CNBup(1),CNBup(2))=CdiffusionSP(CNBup(1),CNBup(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(CNBup(1),CNBup(2))==1
                NZE(3)=NZE(3)+1;
            end
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
            C3diffusionSP(CNBup(1),CNBup(2))=C3diffusionSP(CNBup(1),CNBup(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP'); 
            if C3diffusionSP(CNBup(1),CNBup(2))==1
                NZE(4)=NZE(4)+1;
            end
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
    
if (CNBdown(2)>=1)&sum((CNBdown~=EPpickedup).^2)~=0
    Checkspecies=Conf(CNBdown(1),CNBdown(2)); %check C neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(Cpickedup(1),Cpickedup(2))=CH4DSP(Cpickedup(1),Cpickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(Cpickedup(1),Cpickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(CNBdown(1),CNBdown(2))=CH4DSP(CNBdown(1),CNBdown(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(CNBdown(1),CNBdown(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(CNBdown(1),CNBdown(2))=HdiffusionSP(CNBdown(1),CNBdown(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(CNBdown(1),CNBdown(2))==1
                NZE(1)=NZE(1)+1;
            end
            CHPSP(Cpickedup(1),Cpickedup(2))=CHPSP(Cpickedup(1),Cpickedup(2))-1;%removeevent(CHPSP,x,'CHPSP');
            if CHPSP(Cpickedup(1),Cpickedup(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(CH3)
            CH3DSP(CNBdown(1),CNBdown(2))=CH3DSP(CNBdown(1),CNBdown(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(CNBdown(1),CNBdown(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH2DSP(CNBdown(1),CNBdown(2))=CH2DSP(CNBdown(1),CNBdown(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(CNBdown(1),CNBdown(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CHDSP(CNBdown(1),CNBdown(2))=CHDSP(CNBdown(1),CNBdown(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(CNBdown(1),CNBdown(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CdiffusionSP(CNBdown(1),CNBdown(2))=CdiffusionSP(CNBdown(1),CNBdown(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(CNBdown(1),CNBdown(2))==1
                NZE(3)=NZE(3)+1;
            end
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
            C3diffusionSP(CNBdown(1),CNBdown(2))=C3diffusionSP(CNBdown(1),CNBdown(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP'); 
            if C3diffusionSP(CNBdown(1),CNBdown(2))==1
                NZE(4)=NZE(4)+1;
            end
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

if (CNBleft(1)>=1)&sum((CNBleft~=EPpickedup).^2)~=0
    Checkspecies=Conf(CNBleft(1),CNBleft(2)); %check C neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(Cpickedup(1),Cpickedup(2))=CH4DSP(Cpickedup(1),Cpickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(Cpickedup(1),Cpickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(CNBleft(1),CNBleft(2))=CH4DSP(CNBleft(1),CNBleft(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(CNBleft(1),CNBleft(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(CNBleft(1),CNBleft(2))=HdiffusionSP(CNBleft(1),CNBleft(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(CNBleft(1),CNBleft(2))==1
                NZE(1)=NZE(1)+1;
            end
            CHPSP(Cpickedup(1),Cpickedup(2))=CHPSP(Cpickedup(1),Cpickedup(2))-1;%removeevent(CHPSP,x,'CHPSP');
            if CHPSP(Cpickedup(1),Cpickedup(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(CH3)
            CH3DSP(CNBleft(1),CNBleft(2))=CH3DSP(CNBleft(1),CNBleft(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(CNBleft(1),CNBleft(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH2DSP(CNBleft(1),CNBleft(2))=CH2DSP(CNBleft(1),CNBleft(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(CNBleft(1),CNBleft(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CHDSP(CNBleft(1),CNBleft(2))=CHDSP(CNBleft(1),CNBleft(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(CNBleft(1),CNBleft(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CdiffusionSP(CNBleft(1),CNBleft(2))=CdiffusionSP(CNBleft(1),CNBleft(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(CNBleft(1),CNBleft(2))==1
                NZE(3)=NZE(3)+1;
            end
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
            C3diffusionSP(CNBleft(1),CNBleft(2))=C3diffusionSP(CNBleft(1),CNBleft(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP'); 
            if C3diffusionSP(CNBleft(1),CNBleft(2))==1
                NZE(4)=NZE(4)+1;
            end
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

if (CNBright(1)<=W)&sum((CNBright~=EPpickedup).^2)~=0
    Checkspecies=Conf(CNBright(1),CNBright(2)); %check C neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(Cpickedup(1),Cpickedup(2))=CH4DSP(Cpickedup(1),Cpickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(Cpickedup(1),Cpickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(CNBright(1),CNBright(2))=CH4DSP(CNBright(1),CNBright(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(CNBright(1),CNBright(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(CNBright(1),CNBright(2))=HdiffusionSP(CNBright(1),CNBright(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(CNBright(1),CNBright(2))==1
                NZE(1)=NZE(1)+1;
            end
            CHPSP(Cpickedup(1),Cpickedup(2))=CHPSP(Cpickedup(1),Cpickedup(2))-1;%removeevent(CHPSP,x,'CHPSP');
            if CHPSP(Cpickedup(1),Cpickedup(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(CH3)
            CH3DSP(CNBright(1),CNBright(2))=CH3DSP(CNBright(1),CNBright(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(CNBright(1),CNBright(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH2DSP(CNBright(1),CNBright(2))=CH2DSP(CNBright(1),CNBright(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(CNBright(1),CNBright(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CHDSP(CNBright(1),CNBright(2))=CHDSP(CNBright(1),CNBright(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(CNBright(1),CNBright(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CdiffusionSP(CNBright(1),CNBright(2))=CdiffusionSP(CNBright(1),CNBright(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(CNBright(1),CNBright(2))==1
                NZE(3)=NZE(3)+1;
            end
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
            C3diffusionSP(CNBright(1),CNBright(2))=C3diffusionSP(CNBright(1),CNBright(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP'); 
            if C3diffusionSP(CNBright(1),CNBright(2))==1
                NZE(4)=NZE(4)+1;
            end
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

if (EPNBup(2)<=L)&sum((EPNBup~=Cpickedup).^2)~=0

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
            CdiffusionSP(EPpickedup(1),EPpickedup(2))=CdiffusionSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CdiffusionSP,x,'CdiffusionSP');

        case(H)
            HdiffusionSP(EPNBup(1),EPNBup(2))=HdiffusionSP(EPNBup(1),EPNBup(2))-1;%removeevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(EPNBup(1),EPNBup(2))==0
                NZE(1)=NZE(1)-1;
            end
            CHPSP(EPpickedup(1),EPpickedup(2))=CHPSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CHPSP,x,'CHPSP');
            if CHPSP(EPpickedup(1),EPpickedup(2))==1
                NZE(18)=NZE(18)+1;
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
            C2FSP(EPpickedup(1),EPpickedup(2))=C2FSP(EPpickedup(1),EPpickedup(2))+1;%addevent(C2FSP,x,'C2FSP');
            if C2FSP(EPpickedup(1),EPpickedup(2))==1
                NZE(9)=NZE(9)+1;
            end
            C2FSP(EPNBup(1),EPNBup(2))=C2FSP(EPNBup(1),EPNBup(2))+1;%addevent(C2FSP,y,'C2FSP');
            if C2FSP(EPNBup(1),EPNBup(2))==1
                NZE(9)=NZE(9)+1;
            end
        case(C2)
            C3FSP(EPNBup(1),EPNBup(2))=C3FSP(EPNBup(1),EPNBup(2))+1;%addevent(C3FSP,y,'C3FSP');
            if C3FSP(EPNBup(1),EPNBup(2))==1
                NZE(10)=NZE(10)+1;
            end
        case(C3)
            C3diffusionSP(EPNBup(1),EPNBup(2))=C3diffusionSP(EPNBup(1),EPNBup(2))-1;%removeevent(C3diffusionSP,y,'C3diffusionSP');
            if C3diffusionSP(EPNBup(1),EPNBup(2))==0
                NZE(4)=NZE(4)-1;
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
    
if (EPNBdown(2)>=1)&sum((EPNBdown~=Cpickedup).^2)~=0

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
            CdiffusionSP(EPpickedup(1),EPpickedup(2))=CdiffusionSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CdiffusionSP,x,'CdiffusionSP');

        case(H)
            HdiffusionSP(EPNBdown(1),EPNBdown(2))=HdiffusionSP(EPNBdown(1),EPNBdown(2))-1;%removeevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(EPNBdown(1),EPNBdown(2))==0
                NZE(1)=NZE(1)-1;
            end
            CHPSP(EPpickedup(1),EPpickedup(2))=CHPSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CHPSP,x,'CHPSP');
            if CHPSP(EPpickedup(1),EPpickedup(2))==1
                NZE(18)=NZE(18)+1;
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
            C2FSP(EPpickedup(1),EPpickedup(2))=C2FSP(EPpickedup(1),EPpickedup(2))+1;%addevent(C2FSP,x,'C2FSP');
            if C2FSP(EPpickedup(1),EPpickedup(2))==1
                NZE(9)=NZE(9)+1;
            end
            C2FSP(EPNBdown(1),EPNBdown(2))=C2FSP(EPNBdown(1),EPNBdown(2))+1;%addevent(C2FSP,y,'C2FSP');
            if C2FSP(EPNBdown(1),EPNBdown(2))==1
                NZE(9)=NZE(9)+1;
            end
        case(C2)
            C3FSP(EPNBdown(1),EPNBdown(2))=C3FSP(EPNBdown(1),EPNBdown(2))+1;%addevent(C3FSP,y,'C3FSP');
            if C3FSP(EPNBdown(1),EPNBdown(2))==1
                NZE(10)=NZE(10)+1;
            end
        case(C3)
            C3diffusionSP(EPNBdown(1),EPNBdown(2))=C3diffusionSP(EPNBdown(1),EPNBdown(2))-1;%removeevent(C3diffusionSP,y,'C3diffusionSP');
            if C3diffusionSP(EPNBdown(1),EPNBdown(2))==0
                NZE(4)=NZE(4)-1;
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

if (EPNBleft(1)>=1)&sum((EPNBleft~=Cpickedup).^2)~=0

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
            CdiffusionSP(EPpickedup(1),EPpickedup(2))=CdiffusionSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CdiffusionSP,x,'CdiffusionSP');

        case(H)
            HdiffusionSP(EPNBleft(1),EPNBleft(2))=HdiffusionSP(EPNBleft(1),EPNBleft(2))-1;%removeevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(EPNBleft(1),EPNBleft(2))==0
                NZE(1)=NZE(1)-1;
            end
            CHPSP(EPpickedup(1),EPpickedup(2))=CHPSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CHPSP,x,'CHPSP');
            if CHPSP(EPpickedup(1),EPpickedup(2))==1
                NZE(18)=NZE(18)+1;
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
            C2FSP(EPpickedup(1),EPpickedup(2))=C2FSP(EPpickedup(1),EPpickedup(2))+1;%addevent(C2FSP,x,'C2FSP');
            if C2FSP(EPpickedup(1),EPpickedup(2))==1
                NZE(9)=NZE(9)+1;
            end
            C2FSP(EPNBleft(1),EPNBleft(2))=C2FSP(EPNBleft(1),EPNBleft(2))+1;%addevent(C2FSP,y,'C2FSP');
            if C2FSP(EPNBleft(1),EPNBleft(2))==1
                NZE(9)=NZE(9)+1;
            end
        case(C2)
            C3FSP(EPNBleft(1),EPNBleft(2))=C3FSP(EPNBleft(1),EPNBleft(2))+1;%addevent(C3FSP,y,'C3FSP');
            if C3FSP(EPNBleft(1),EPNBleft(2))==1
                NZE(10)=NZE(10)+1;
            end
        case(C3)
            C3diffusionSP(EPNBleft(1),EPNBleft(2))=C3diffusionSP(EPNBleft(1),EPNBleft(2))-1;%removeevent(C3diffusionSP,y,'C3diffusionSP');
            if C3diffusionSP(EPNBleft(1),EPNBleft(2))==0
                NZE(4)=NZE(4)-1;
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

if (EPNBright(1)<=W)&sum((EPNBright~=Cpickedup).^2)~=0

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
            CdiffusionSP(EPpickedup(1),EPpickedup(2))=CdiffusionSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CdiffusionSP,x,'CdiffusionSP');

        case(H)
            HdiffusionSP(EPNBright(1),EPNBright(2))=HdiffusionSP(EPNBright(1),EPNBright(2))-1;%removeevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(EPNBright(1),EPNBright(2))==0
                NZE(1)=NZE(1)-1;
            end
            CHPSP(EPpickedup(1),EPpickedup(2))=CHPSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CHPSP,x,'CHPSP');
            if CHPSP(EPpickedup(1),EPpickedup(2))==1
                NZE(18)=NZE(18)+1;
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
            C2FSP(EPpickedup(1),EPpickedup(2))=C2FSP(EPpickedup(1),EPpickedup(2))+1;%addevent(C2FSP,x,'C2FSP');
            if C2FSP(EPpickedup(1),EPpickedup(2))==1
                NZE(9)=NZE(9)+1;
            end
            C2FSP(EPNBright(1),EPNBright(2))=C2FSP(EPNBright(1),EPNBright(2))+1;%addevent(C2FSP,y,'C2FSP');
            if C2FSP(EPNBright(1),EPNBright(2))==1
                NZE(9)=NZE(9)+1;
            end
        case(C2)
            C3FSP(EPNBright(1),EPNBright(2))=C3FSP(EPNBright(1),EPNBright(2))+1;%addevent(C3FSP,y,'C3FSP');
            if C3FSP(EPNBright(1),EPNBright(2))==1
                NZE(10)=NZE(10)+1;
            end
        case(C3)
            C3diffusionSP(EPNBright(1),EPNBright(2))=C3diffusionSP(EPNBright(1),EPNBright(2))-1;%removeevent(C3diffusionSP,y,'C3diffusionSP');
            if C3diffusionSP(EPNBright(1),EPNBright(2))==0
                NZE(4)=NZE(4)-1;
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
end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                