function [NZE,CXFSP,C3diffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,C3FSP]=redefineCXFcheckCNB2(NZE,Conf,W,L,C,C2,C3,CX,CXFSP,C3diffusionSP,H,CH3,...
                            CH2,CH,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,C3FSP,...
                            CX1pickedup,CXcheck2,Cpickedup,CNBup,CNBdown,CNBleft,CNBright)

%x is C1pickedup;y is one of its neighbour

if CNBup(2)<=L&sum((CNBup~=CX1pickedup).^2)~=0&sum((CNBup~=CXcheck2).^2)~=0
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

if CNBdown(2)>=1&sum((CNBdown~=CX1pickedup).^2)~=0&sum((CNBdown~=CXcheck2).^2)~=0
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

if CNBleft(1)>=1&sum((CNBleft~=CX1pickedup).^2)~=0&sum((CNBleft~=CXcheck2).^2)~=0
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

if CNBright(1)<=W&sum((CNBright~=CX1pickedup).^2)~=0&sum((CNBright~=CXcheck2).^2)~=0
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

end