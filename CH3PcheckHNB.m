 function CH3PcheckHNB(x,y)
global Conf H CH3 CH2 CH C C3 HdiffusionSP CH4DSP H2PSP CH3DSP NR CH2DSP CH3PSP CHDSP CH2PSP CdiffusionSP CHPSP C3diffusionSP CH4PSP
Checkspecies=Conf(y(1),y(2)); %check H neighbour

    switch (Checkspecies)
        case(0)
            NR(1)=NR(1)+1;
            CH4DSP(x(1),x(2))=CH4DSP(x(1),x(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            NR(1)=NR(1)+1;
            CH4DSP(y(1),y(2))=CH4DSP(y(1),y(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            %addevent(H2DSP,x,'H2DSP');
            %addevent(H2DSP,y,'H2DSP');
            NR(17)=NR(17)-1;
            HdiffusionSP(x(1),x(2))=HdiffusionSP(x(1),x(2))-1;%removeevent(HdiffusionSP,x,'HdiffusionSP');
        case(H)
            NR(17)=NR(17)+1;
            HdiffusionSP(y(1),y(2))=HdiffusionSP(y(1),y(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            NR(11)=NR(11)-1;
            H2PSP(x(1),x(2))=H2PSP(x(1),x(2))-1;%removeevent(H2PSP,x,'H2PSP');
            NR(11)=NR(11)-1;
            H2PSP(y(1),y(2))=H2PSP(y(1),y(2))-1;%removeevent(H2PSP,y,'H2PSP');
        case(CH3)
            %addevent(CH3diffusionSP,y,'CH3diffusionSP')
            NR(2)=NR(2)+1;
            CH3DSP(y(1),y(2))=CH3DSP(y(1),y(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            NR(7)=NR(7)-1;
            CH4PSP(y(1),y(2))=CH4PSP(y(1),y(2))-1;%removeevent(CH4PSP,y,'CH4PSP');
        case(CH2)
            %addevent(CH2diffusionSP,y,'CH2diffusionSP');
            NR(3)=NR(3)+1;
            CH2DSP(y(1),y(2))=CH2DSP(y(1),y(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            NR(8)=NR(8)-1;
            CH3PSP(y(1),y(2))=CH3PSP(y(1),y(2))-1;%removeevent(CH3PSP,y,'CH3PSP');
        case(CH)
            %addevent(CHdiffusionSP,y,'CHdiffusionSP');
            NR(4)=NR(4)+1;
            CHDSP(y(1),y(2))=CHDSP(y(1),y(2))+1;%addevent(CHDSP,y,'CHDSP');
            NR(9)=NR(9)-1;
            CH2PSP(y(1),y(2))=CH2PSP(y(1),y(2))-1;%removeevent(CH2PSP,y,'CH2PSP');
        case(C)
            NR(15)=NR(15)+1;
            CdiffusionSP(y(1),y(2))=CdiffusionSP(y(1),y(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            NR(10)=NR(10)-1;
            CHPSP(y(1),y(2))=CHPSP(y(1),y(2))-1;%removeevent(CHPSP,y,'CHPSP');
        case(C3)
            NR(16)=NR(16)+1;
            C3diffusionSP(y(1),y(2))=C3diffusionSP(y(1),y(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP');  
    end
end