function [NZE,CHPSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP]=rdC2FcheckNB(NZE,Conf,W,L,H,C,C2,CX,CHPSP,C2FSP,C3FSP,CXFSP,...
    CdiffusionSP,CH3,CH2,CH,C3,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP,...
    C1pickedup,C1NBup,C1NBdown,C1NBleft,C1NBright,C2pickedup,C2NBup,C2NBdown,C2NBleft,C2NBright)
%x is C1pickedup;y is one of its neighbour

if (C1NBup(2)<=L)&sum((C1NBup~=C2pickedup).^2)~=0
    Checkspecies=Conf(C1NBup(1),C1NBup(2)); %check C1 neighbour
    switch (Checkspecies)
        %case(0)

        case(H)
            CHPSP(C1pickedup(1),C1pickedup(2))=CHPSP(C1pickedup(1),C1pickedup(2))-1;%removeevent(CHPSP,x,'CHPSP');
            if CHPSP(C1pickedup(1),C1pickedup(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(C)
            C2FSP(C1NBup(1),C1NBup(2))=C2FSP(C1NBup(1),C1NBup(2))-1;%removeevent(C2FSP,y,'C2FSP');
            if C2FSP(C1NBup(1),C1NBup(2))==0
                NZE(9)=NZE(9)-1;
            end
            C3FSP(C1pickedup(1),C1pickedup(2))=C3FSP(C1pickedup(1),C1pickedup(2))+1;%addevent(C3FSP,x,'C3FSP');
            if C3FSP(C1pickedup(1),C1pickedup(2))==1
                NZE(10)=NZE(10)+1;
            end
        case(C2)
            C3FSP(C1NBup(1),C1NBup(2))=C3FSP(C1NBup(1),C1NBup(2))-1;%removeevent(C3FSP,y,'C3FSP');
            if C3FSP(C1NBup(1),C1NBup(2))==0
                NZE(10)=NZE(10)-1;
            end
       %case(C3)
            %
        case(CX)
            CXFSP(C1NBup(1),C1NBup(2))=CXFSP(C1NBup(1),C1NBup(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C1NBup(1),C1NBup(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end


if (C1NBdown(2)>=1)&sum((C1NBdown~=C2pickedup).^2)~=0
    Checkspecies=Conf(C1NBdown(1),C1NBdown(2)); %check C1 neighbour
    switch (Checkspecies)
        %case(0)

        case(H)
            CHPSP(C1pickedup(1),C1pickedup(2))=CHPSP(C1pickedup(1),C1pickedup(2))-1;%removeevent(CHPSP,x,'CHPSP');
            if CHPSP(C1pickedup(1),C1pickedup(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(C)
            C2FSP(C1NBdown(1),C1NBdown(2))=C2FSP(C1NBdown(1),C1NBdown(2))-1;%removeevent(C2FSP,y,'C2FSP');
            if C2FSP(C1NBdown(1),C1NBdown(2))==0
                NZE(9)=NZE(9)-1;
            end
            C3FSP(C1pickedup(1),C1pickedup(2))=C3FSP(C1pickedup(1),C1pickedup(2))+1;%addevent(C3FSP,x,'C3FSP');
            if C3FSP(C1pickedup(1),C1pickedup(2))==1
                NZE(10)=NZE(10)+1;
            end
        case(C2)
            C3FSP(C1NBdown(1),C1NBdown(2))=C3FSP(C1NBdown(1),C1NBdown(2))-1;%removeevent(C3FSP,y,'C3FSP');
            if C3FSP(C1NBdown(1),C1NBdown(2))==0
                NZE(10)=NZE(10)-1;
            end
       %case(C3)
            %
        case(CX)
            CXFSP(C1NBdown(1),C1NBdown(2))=CXFSP(C1NBdown(1),C1NBdown(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C1NBdown(1),C1NBdown(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end

if (C1NBleft(1)>=1)&sum((C1NBleft~=C2pickedup).^2)~=0
    Checkspecies=Conf(C1NBleft(1),C1NBleft(2)); %check C1 neighbour
    switch (Checkspecies)
        %case(0)

        case(H)
            CHPSP(C1pickedup(1),C1pickedup(2))=CHPSP(C1pickedup(1),C1pickedup(2))-1;%removeevent(CHPSP,x,'CHPSP');
            if CHPSP(C1pickedup(1),C1pickedup(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(C)
            C2FSP(C1NBleft(1),C1NBleft(2))=C2FSP(C1NBleft(1),C1NBleft(2))-1;%removeevent(C2FSP,y,'C2FSP');
            if C2FSP(C1NBleft(1),C1NBleft(2))==0
                NZE(9)=NZE(9)-1;
            end
            C3FSP(C1pickedup(1),C1pickedup(2))=C3FSP(C1pickedup(1),C1pickedup(2))+1;%addevent(C3FSP,x,'C3FSP');
            if C3FSP(C1pickedup(1),C1pickedup(2))==1
                NZE(10)=NZE(10)+1;
            end
        case(C2)
            C3FSP(C1NBleft(1),C1NBleft(2))=C3FSP(C1NBleft(1),C1NBleft(2))-1;%removeevent(C3FSP,y,'C3FSP');
            if C3FSP(C1NBleft(1),C1NBleft(2))==0
                NZE(10)=NZE(10)-1;
            end
       %case(C3)
            %
        case(CX)
            CXFSP(C1NBleft(1),C1NBleft(2))=CXFSP(C1NBleft(1),C1NBleft(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C1NBleft(1),C1NBleft(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end

if (C1NBright(1)<=W)&sum((C1NBright~=C2pickedup).^2)~=0
    Checkspecies=Conf(C1NBright(1),C1NBright(2)); %check C1 neighbour
    switch (Checkspecies)
        %case(0)

        case(H)
            CHPSP(C1pickedup(1),C1pickedup(2))=CHPSP(C1pickedup(1),C1pickedup(2))-1;%removeevent(CHPSP,x,'CHPSP');
            if CHPSP(C1pickedup(1),C1pickedup(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(C)
            C2FSP(C1NBright(1),C1NBright(2))=C2FSP(C1NBright(1),C1NBright(2))-1;%removeevent(C2FSP,y,'C2FSP');
            if C2FSP(C1NBright(1),C1NBright(2))==0
                NZE(9)=NZE(9)-1;
            end
            C3FSP(C1pickedup(1),C1pickedup(2))=C3FSP(C1pickedup(1),C1pickedup(2))+1;%addevent(C3FSP,x,'C3FSP');
            if C3FSP(C1pickedup(1),C1pickedup(2))==1
                NZE(10)=NZE(10)+1;
            end
        case(C2)
            C3FSP(C1NBright(1),C1NBright(2))=C3FSP(C1NBright(1),C1NBright(2))-1;%removeevent(C3FSP,y,'C3FSP');
            if C3FSP(C1NBright(1),C1NBright(2))==0
                NZE(10)=NZE(10)-1;
            end
       %case(C3)
            %
        case(CX)
            CXFSP(C1NBright(1),C1NBright(2))=CXFSP(C1NBright(1),C1NBright(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C1NBright(1),C1NBright(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end


if (C2NBup(2)<=L)&sum((C2NBup~=C1pickedup).^2)~=0

    Checkspecies=Conf(C2NBup(1),C2NBup(2)); %check C2 (the second C) neighbour

    switch (Checkspecies)
        case(0)
            CH4DSP(C2pickedup(1),C2pickedup(2))=CH4DSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(C2pickedup(1),C2pickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(C2NBup(1),C2NBup(2))=CH4DSP(C2NBup(1),C2NBup(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(C2NBup(1),C2NBup(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(C2NBup(1),C2NBup(2))=HdiffusionSP(C2NBup(1),C2NBup(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(C2NBup(1),C2NBup(2))==1
                NZE(1)=NZE(1)+1;
            end
            CHPSP(C2pickedup(1),C2pickedup(2))=CHPSP(C2pickedup(1),C2pickedup(2))-1;%removeevent(CHPSP,x,'CHPSP');
            if CHPSP(C2pickedup(1),C2pickedup(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(CH3)
            CH3DSP(C2NBup(1),C2NBup(2))=CH3DSP(C2NBup(1),C2NBup(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(C2NBup(1),C2NBup(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH2DSP(C2NBup(1),C2NBup(2))=CH2DSP(C2NBup(1),C2NBup(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(C2NBup(1),C2NBup(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CHDSP(C2NBup(1),C2NBup(2))=CHDSP(C2NBup(1),C2NBup(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(C2NBup(1),C2NBup(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CdiffusionSP(C2NBup(1),C2NBup(2))=CdiffusionSP(C2NBup(1),C2NBup(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(C2NBup(1),C2NBup(2))==1
                NZE(3)=NZE(3)+1;
            end
            C2FSP(C2NBup(1),C2NBup(2))=C2FSP(C2NBup(1),C2NBup(2))-1;%removeevent(C2FSP,y,'C2FSP');
            if C2FSP(C2NBup(1),C2NBup(2))==0
                NZE(9)=NZE(9)-1;
            end
        case(C2)
            C3FSP(C2NBup(1),C2NBup(2))=C3FSP(C2NBup(1),C2NBup(2))-1;%removeevent(C3FSP,y,'C3FSP');
            if C3FSP(C2NBup(1),C2NBup(2))==0
                NZE(10)=NZE(10)-1;
            end
        case(C3)
            C3diffusionSP(C2NBup(1),C2NBup(2))=C3diffusionSP(C2NBup(1),C2NBup(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP');  
            if C3diffusionSP(C2NBup(1),C2NBup(2))==1
                NZE(4)=NZE(4)+1;
            end
            CXFSP(C2NBup(1),C2NBup(2))=CXFSP(C2NBup(1),C2NBup(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C2NBup(1),C2NBup(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(CX)
            CXFSP(C2NBup(1),C2NBup(2))=CXFSP(C2NBup(1),C2NBup(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C2NBup(1),C2NBup(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end
    
if (C2NBdown(2)>=1)&sum((C2NBdown~=C1pickedup).^2)~=0

    Checkspecies=Conf(C2NBdown(1),C2NBdown(2)); %check C2 (the second C) neighbour

    switch (Checkspecies)
        case(0)
            CH4DSP(C2pickedup(1),C2pickedup(2))=CH4DSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(C2pickedup(1),C2pickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(C2NBdown(1),C2NBdown(2))=CH4DSP(C2NBdown(1),C2NBdown(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(C2NBdown(1),C2NBdown(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(C2NBdown(1),C2NBdown(2))=HdiffusionSP(C2NBdown(1),C2NBdown(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(C2NBdown(1),C2NBdown(2))==1
                NZE(1)=NZE(1)+1;
            end
            CHPSP(C2pickedup(1),C2pickedup(2))=CHPSP(C2pickedup(1),C2pickedup(2))-1;%removeevent(CHPSP,x,'CHPSP');
            if CHPSP(C2pickedup(1),C2pickedup(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(CH3)
            CH3DSP(C2NBdown(1),C2NBdown(2))=CH3DSP(C2NBdown(1),C2NBdown(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(C2NBdown(1),C2NBdown(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH2DSP(C2NBdown(1),C2NBdown(2))=CH2DSP(C2NBdown(1),C2NBdown(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(C2NBdown(1),C2NBdown(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CHDSP(C2NBdown(1),C2NBdown(2))=CHDSP(C2NBdown(1),C2NBdown(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(C2NBdown(1),C2NBdown(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CdiffusionSP(C2NBdown(1),C2NBdown(2))=CdiffusionSP(C2NBdown(1),C2NBdown(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(C2NBdown(1),C2NBdown(2))==1
                NZE(3)=NZE(3)+1;
            end
            C2FSP(C2NBdown(1),C2NBdown(2))=C2FSP(C2NBdown(1),C2NBdown(2))-1;%removeevent(C2FSP,y,'C2FSP');
            if C2FSP(C2NBdown(1),C2NBdown(2))==0
                NZE(9)=NZE(9)-1;
            end
        case(C2)
            C3FSP(C2NBdown(1),C2NBdown(2))=C3FSP(C2NBdown(1),C2NBdown(2))-1;%removeevent(C3FSP,y,'C3FSP');
            if C3FSP(C2NBdown(1),C2NBdown(2))==0
                NZE(10)=NZE(10)-1;
            end
        case(C3)
            C3diffusionSP(C2NBdown(1),C2NBdown(2))=C3diffusionSP(C2NBdown(1),C2NBdown(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP');  
            if C3diffusionSP(C2NBdown(1),C2NBdown(2))==1
                NZE(4)=NZE(4)+1;
            end
            CXFSP(C2NBdown(1),C2NBdown(2))=CXFSP(C2NBdown(1),C2NBdown(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C2NBdown(1),C2NBdown(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(CX)
            CXFSP(C2NBdown(1),C2NBdown(2))=CXFSP(C2NBdown(1),C2NBdown(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C2NBdown(1),C2NBdown(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end

if (C2NBleft(1)>=1)&sum((C2NBleft~=C1pickedup).^2)~=0

    Checkspecies=Conf(C2NBleft(1),C2NBleft(2)); %check C2 (the second C) neighbour

    switch (Checkspecies)
        case(0)
            CH4DSP(C2pickedup(1),C2pickedup(2))=CH4DSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(C2pickedup(1),C2pickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(C2NBleft(1),C2NBleft(2))=CH4DSP(C2NBleft(1),C2NBleft(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(C2NBleft(1),C2NBleft(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(C2NBleft(1),C2NBleft(2))=HdiffusionSP(C2NBleft(1),C2NBleft(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(C2NBleft(1),C2NBleft(2))==1
                NZE(1)=NZE(1)+1;
            end
            CHPSP(C2pickedup(1),C2pickedup(2))=CHPSP(C2pickedup(1),C2pickedup(2))-1;%removeevent(CHPSP,x,'CHPSP');
            if CHPSP(C2pickedup(1),C2pickedup(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(CH3)
            CH3DSP(C2NBleft(1),C2NBleft(2))=CH3DSP(C2NBleft(1),C2NBleft(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(C2NBleft(1),C2NBleft(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH2DSP(C2NBleft(1),C2NBleft(2))=CH2DSP(C2NBleft(1),C2NBleft(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(C2NBleft(1),C2NBleft(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CHDSP(C2NBleft(1),C2NBleft(2))=CHDSP(C2NBleft(1),C2NBleft(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(C2NBleft(1),C2NBleft(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CdiffusionSP(C2NBleft(1),C2NBleft(2))=CdiffusionSP(C2NBleft(1),C2NBleft(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(C2NBleft(1),C2NBleft(2))==1
                NZE(3)=NZE(3)+1;
            end
            C2FSP(C2NBleft(1),C2NBleft(2))=C2FSP(C2NBleft(1),C2NBleft(2))-1;%removeevent(C2FSP,y,'C2FSP');
            if C2FSP(C2NBleft(1),C2NBleft(2))==0
                NZE(9)=NZE(9)-1;
            end
        case(C2)
            C3FSP(C2NBleft(1),C2NBleft(2))=C3FSP(C2NBleft(1),C2NBleft(2))-1;%removeevent(C3FSP,y,'C3FSP');
            if C3FSP(C2NBleft(1),C2NBleft(2))==0
                NZE(10)=NZE(10)-1;
            end
        case(C3)
            C3diffusionSP(C2NBleft(1),C2NBleft(2))=C3diffusionSP(C2NBleft(1),C2NBleft(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP');  
            if C3diffusionSP(C2NBleft(1),C2NBleft(2))==1
                NZE(4)=NZE(4)+1;
            end
            CXFSP(C2NBleft(1),C2NBleft(2))=CXFSP(C2NBleft(1),C2NBleft(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C2NBleft(1),C2NBleft(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(CX)
            CXFSP(C2NBleft(1),C2NBleft(2))=CXFSP(C2NBleft(1),C2NBleft(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C2NBleft(1),C2NBleft(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end

if (C2NBright(1)<=W)&sum((C2NBright~=C1pickedup).^2)~=0

    Checkspecies=Conf(C2NBright(1),C2NBright(2)); %check C2 (the second C) neighbour

    switch (Checkspecies)
        case(0)
            CH4DSP(C2pickedup(1),C2pickedup(2))=CH4DSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(C2pickedup(1),C2pickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(C2NBright(1),C2NBright(2))=CH4DSP(C2NBright(1),C2NBright(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(C2NBright(1),C2NBright(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(C2NBright(1),C2NBright(2))=HdiffusionSP(C2NBright(1),C2NBright(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(C2NBright(1),C2NBright(2))==1
                NZE(1)=NZE(1)+1;
            end
            CHPSP(C2pickedup(1),C2pickedup(2))=CHPSP(C2pickedup(1),C2pickedup(2))-1;%removeevent(CHPSP,x,'CHPSP');
            if CHPSP(C2pickedup(1),C2pickedup(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(CH3)
            CH3DSP(C2NBright(1),C2NBright(2))=CH3DSP(C2NBright(1),C2NBright(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(C2NBright(1),C2NBright(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH2DSP(C2NBright(1),C2NBright(2))=CH2DSP(C2NBright(1),C2NBright(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(C2NBright(1),C2NBright(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CHDSP(C2NBright(1),C2NBright(2))=CHDSP(C2NBright(1),C2NBright(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(C2NBright(1),C2NBright(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CdiffusionSP(C2NBright(1),C2NBright(2))=CdiffusionSP(C2NBright(1),C2NBright(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(C2NBright(1),C2NBright(2))==1
                NZE(3)=NZE(3)+1;
            end
            C2FSP(C2NBright(1),C2NBright(2))=C2FSP(C2NBright(1),C2NBright(2))-1;%removeevent(C2FSP,y,'C2FSP');
            if C2FSP(C2NBright(1),C2NBright(2))==0
                NZE(9)=NZE(9)-1;
            end
        case(C2)
            C3FSP(C2NBright(1),C2NBright(2))=C3FSP(C2NBright(1),C2NBright(2))-1;%removeevent(C3FSP,y,'C3FSP');
            if C3FSP(C2NBright(1),C2NBright(2))==0
                NZE(10)=NZE(10)-1;
            end
        case(C3)
            C3diffusionSP(C2NBright(1),C2NBright(2))=C3diffusionSP(C2NBright(1),C2NBright(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP');  
            if C3diffusionSP(C2NBright(1),C2NBright(2))==1
                NZE(4)=NZE(4)+1;
            end
            CXFSP(C2NBright(1),C2NBright(2))=CXFSP(C2NBright(1),C2NBright(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C2NBright(1),C2NBright(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(CX)
            CXFSP(C2NBright(1),C2NBright(2))=CXFSP(C2NBright(1),C2NBright(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C2NBright(1),C2NBright(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end

end