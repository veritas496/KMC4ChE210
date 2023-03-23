function [NZE,CXFSP,C3diffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,C3FSP]=rdC3FcheckNB(NZE,Conf,W,L,C,C2,C3,CX,CXFSP,C3diffusionSP,H,CH3,...
    CH2,CH,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,C3FSP,C2pickedup,C2NBup,C2NBdown,C2NBleft,C2NBright,Cpickedup,CNBup,CNBdown,CNBleft,CNBright) 
%x is C2pickedup;y is one of its neighbour

if (C2NBup(2)<=L)&sum((C2NBup~=Cpickedup).^2)~=0
    Checkspecies=Conf(C2NBup(1),C2NBup(2)); %check C2 neighbour
    
    switch (Checkspecies)
        case(0)
            C3diffusionSP(C2pickedup(1),C2pickedup(2))=C3diffusionSP(C2pickedup(1),C2pickedup(2))+1;%addevent(C3diffusion,x,'C3diffusion');

        case(C)
            CXFSP(C2pickedup(1),C2pickedup(2))=CXFSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(C2pickedup(1),C2pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C2)
            CXFSP(C2pickedup(1),C2pickedup(2))=CXFSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(C2pickedup(1),C2pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C3)
            CXFSP(C2pickedup(1),C2pickedup(2))=CXFSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(C2pickedup(1),C2pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(CX)
            CXFSP(C2NBup(1),C2NBup(2))=CXFSP(C2NBup(1),C2NBup(2))+1;%addevent(CXFSP,y,'CXFSP');
            if CXFSP(C2NBup(1),C2NBup(2))==1
                NZE(11)=NZE(11)+1;
            end
    end
end
    
if (C2NBdown(2)>=1)&sum((C2NBdown~=Cpickedup).^2)~=0
    Checkspecies=Conf(C2NBdown(1),C2NBdown(2)); %check C2 neighbour
    
    switch (Checkspecies)
        case(0)
            C3diffusionSP(C2pickedup(1),C2pickedup(2))=C3diffusionSP(C2pickedup(1),C2pickedup(2))+1;%addevent(C3diffusion,x,'C3diffusion');

        case(C)
            CXFSP(C2pickedup(1),C2pickedup(2))=CXFSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(C2pickedup(1),C2pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C2)
            CXFSP(C2pickedup(1),C2pickedup(2))=CXFSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(C2pickedup(1),C2pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C3)
            CXFSP(C2pickedup(1),C2pickedup(2))=CXFSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(C2pickedup(1),C2pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(CX)
            CXFSP(C2NBdown(1),C2NBdown(2))=CXFSP(C2NBdown(1),C2NBdown(2))+1;%addevent(CXFSP,y,'CXFSP');
            if CXFSP(C2NBdown(1),C2NBdown(2))==1
                NZE(11)=NZE(11)+1;
            end
    end
end

if (C2NBleft(1)>=1)&sum((C2NBleft~=Cpickedup).^2)~=0
    Checkspecies=Conf(C2NBleft(1),C2NBleft(2)); %check C2 neighbour
    
    switch (Checkspecies)
        case(0)
            C3diffusionSP(C2pickedup(1),C2pickedup(2))=C3diffusionSP(C2pickedup(1),C2pickedup(2))+1;%addevent(C3diffusion,x,'C3diffusion');

        case(C)
            CXFSP(C2pickedup(1),C2pickedup(2))=CXFSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(C2pickedup(1),C2pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C2)
            CXFSP(C2pickedup(1),C2pickedup(2))=CXFSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(C2pickedup(1),C2pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C3)
            CXFSP(C2pickedup(1),C2pickedup(2))=CXFSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(C2pickedup(1),C2pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(CX)
            CXFSP(C2NBleft(1),C2NBleft(2))=CXFSP(C2NBleft(1),C2NBleft(2))+1;%addevent(CXFSP,y,'CXFSP');
            if CXFSP(C2NBleft(1),C2NBleft(2))==1
                NZE(11)=NZE(11)+1;
            end
    end
end

if (C2NBright(1)<=W)&sum((C2NBright~=Cpickedup).^2)~=0
    Checkspecies=Conf(C2NBright(1),C2NBright(2)); %check C2 neighbour
    
    switch (Checkspecies)
        case(0)
            C3diffusionSP(C2pickedup(1),C2pickedup(2))=C3diffusionSP(C2pickedup(1),C2pickedup(2))+1;%addevent(C3diffusion,x,'C3diffusion');

        case(C)
            CXFSP(C2pickedup(1),C2pickedup(2))=CXFSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(C2pickedup(1),C2pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C2)
            CXFSP(C2pickedup(1),C2pickedup(2))=CXFSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(C2pickedup(1),C2pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C3)
            CXFSP(C2pickedup(1),C2pickedup(2))=CXFSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(C2pickedup(1),C2pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(CX)
            CXFSP(C2NBright(1),C2NBright(2))=CXFSP(C2NBright(1),C2NBright(2))+1;%addevent(CXFSP,y,'CXFSP');
            if CXFSP(C2NBright(1),C2NBright(2))==1
                NZE(11)=NZE(11)+1;
            end
    end
end


if (CNBup(2)<=L)&sum((CNBup~=C2pickedup).^2)~=0
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

if (CNBdown(2)>=1)&sum((CNBdown~=C2pickedup).^2)~=0
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

if (CNBleft(1)>=1)&sum((CNBleft~=C2pickedup).^2)~=0
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
    
if (CNBright(1)<=W)&sum((CNBright~=C2pickedup).^2)~=0
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