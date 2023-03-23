function [NZE,Conf,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP]=CHdiffusioncheckEPNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,x,y)
%x is EP 0 pickedup;y is one of its neighbour
Checkspecies=Conf(y(1),y(2)); %check EP 0 neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(x(1),x(2))=CH4DSP(x(1),x(2))-1;%removeevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(x(1),x(2))==0
                NZE(5)=NZE(5)-1;
            end
            CH4DSP(y(1),y(2))=CH4DSP(y(1),y(2))-1;%removeevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(y(1),y(2))==0
                NZE(5)=NZE(5)-1;
            end
            CHDSP(x(1),x(2))=CHDSP(x(1),x(2))+1;%addevent(CHDSP,x,'CHDSP');
            if CHDSP(x(1),x(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(H)
            HdiffusionSP(y(1),y(2))=HdiffusionSP(y(1),y(2))-1;%removeevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(y(1),y(2))==0
                NZE(1)=NZE(1)-1;
            end
            CH2PSP(x(1),x(2))=CH2PSP(x(1),x(2))+1;%addevent(CH2PSP,x,'CH2PSP');
            if CHPSP(x(1),x(2))==1
                NZE(17)=NZE(17)+1;
            end
        case(CH3)
            CH3DSP(y(1),y(2))=CH3DSP(y(1),y(2))-1;%removeevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(y(1),y(2))==0
                NZE(6)=NZE(6)-1;
            end
        case(CH2)
            CH2DSP(y(1),y(2))=CH2DSP(y(1),y(2))-1;%removeevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(y(1),y(2))==0
                NZE(7)=NZE(7)-1;
            end
        case(CH)
            CHDSP(y(1),y(2))=CHDSP(y(1),y(2))-1;%removeevent(CHDSP,y,'CHDSP');
            if CHDSP(y(1),y(2))==0
                NZE(8)=NZE(8)-1;
            end
        case(C)
            CdiffusionSP(y(1),y(2))=CdiffusionSP(y(1),y(2))-1;%removeevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(y(1),y(2))==0
                NZE(3)=NZE(3)-1;
            end
        case(C3)
            C3diffusionSP(y(1),y(2))=C3diffusionSP(y(1),y(2))-1;%removeevent(C3diffusionSP,y,'C3diffusionSP');
            if C3diffusionSP(y(1),y(2))==0
                NZE(4)=NZE(4)-1;
            end
    end
end