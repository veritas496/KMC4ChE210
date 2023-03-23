function [NZE,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP]=CCNTcheckCNB(NZE,Conf,H,C,CH3,CH2,CH,C2,C3,...
    CX,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,Cpickedup,CNB1,CNB2,CNB3)
%x is C pickedup;y is one of its neighbour

Checkspecies=Conf(CNB1(1),CNB1(2)); %check C neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(Cpickedup(1),Cpickedup(2))=CH4DSP(Cpickedup(1),Cpickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(Cpickedup(1),Cpickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(CNB1(1),CNB1(2))=CH4DSP(CNB1(1),CNB1(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(CNB1(1),CNB1(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(CNB1(1),CNB1(2))=HdiffusionSP(CNB1(1),CNB1(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(CNB1(1),CNB1(2))==1
                NZE(1)=NZE(1)+1;
            end
            CHPSP(Cpickedup(1),Cpickedup(2))=CHPSP(Cpickedup(1),Cpickedup(2))-1;%removeevent(CHPSP,x,'CHPSP');
            if CHPSP(Cpickedup(1),Cpickedup(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(CH3)
            CH3DSP(CNB1(1),CNB1(2))=CH3DSP(CNB1(1),CNB1(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(CNB1(1),CNB1(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH2DSP(CNB1(1),CNB1(2))=CH2DSP(CNB1(1),CNB1(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(CNB1(1),CNB1(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CHDSP(CNB1(1),CNB1(2))=CHDSP(CNB1(1),CNB1(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(CNB1(1),CNB1(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CdiffusionSP(CNB1(1),CNB1(2))=CdiffusionSP(CNB1(1),CNB1(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(CNB1(1),CNB1(2))==1
                NZE(3)=NZE(3)+1;
            end
            C2FSP(Cpickedup(1),Cpickedup(2))=C2FSP(Cpickedup(1),Cpickedup(2))-1;%removeevent(C2FSP,x,'C2FSP');
            if C2FSP(Cpickedup(1),Cpickedup(2))==0
                NZE(9)=NZE(9)-1;
            end
            C2FSP(CNB1(1),CNB1(2))=C2FSP(CNB1(1),CNB1(2))-1;%removeevent(C2FSP,y,'C2FSP');
            if C2FSP(CNB1(1),CNB1(2))==0
                NZE(9)=NZE(9)-1;
            end
        case(C2)
            C3FSP(CNB1(1),CNB1(2))=C3FSP(CNB1(1),CNB1(2))-1;%removeevent(C3FSP,y,'C3FSP');
            if C3FSP(CNB1(1),CNB1(2))==0
                NZE(10)=NZE(10)-1;
            end
        case(C3)
            C3diffusionSP(CNB1(1),CNB1(2))=C3diffusionSP(CNB1(1),CNB1(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP'); 
            if C3diffusionSP(CNB1(1),CNB1(2))==1
                NZE(4)=NZE(4)+1;
            end
            CXFSP(CNB1(1),CNB1(2))=CXFSP(CNB1(1),CNB1(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(CNB1(1),CNB1(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(CX)
            CXFSP(CNB1(1),CNB1(2))=CXFSP(CNB1(1),CNB1(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(CNB1(1),CNB1(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
    
Checkspecies=Conf(CNB2(1),CNB2(2)); %check C neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(Cpickedup(1),Cpickedup(2))=CH4DSP(Cpickedup(1),Cpickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(Cpickedup(1),Cpickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(CNB2(1),CNB2(2))=CH4DSP(CNB2(1),CNB2(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(CNB2(1),CNB2(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(CNB2(1),CNB2(2))=HdiffusionSP(CNB2(1),CNB2(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(CNB2(1),CNB2(2))==1
                NZE(1)=NZE(1)+1;
            end
            CHPSP(Cpickedup(1),Cpickedup(2))=CHPSP(Cpickedup(1),Cpickedup(2))-1;%removeevent(CHPSP,x,'CHPSP');
            if CHPSP(Cpickedup(1),Cpickedup(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(CH3)
            CH3DSP(CNB2(1),CNB2(2))=CH3DSP(CNB2(1),CNB2(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(CNB2(1),CNB2(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH2DSP(CNB2(1),CNB2(2))=CH2DSP(CNB2(1),CNB2(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(CNB2(1),CNB2(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CHDSP(CNB2(1),CNB2(2))=CHDSP(CNB2(1),CNB2(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(CNB2(1),CNB2(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CdiffusionSP(CNB2(1),CNB2(2))=CdiffusionSP(CNB2(1),CNB2(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(CNB2(1),CNB2(2))==1
                NZE(3)=NZE(3)+1;
            end
            C2FSP(Cpickedup(1),Cpickedup(2))=C2FSP(Cpickedup(1),Cpickedup(2))-1;%removeevent(C2FSP,x,'C2FSP');
            if C2FSP(Cpickedup(1),Cpickedup(2))==0
                NZE(9)=NZE(9)-1;
            end
            C2FSP(CNB2(1),CNB2(2))=C2FSP(CNB2(1),CNB2(2))-1;%removeevent(C2FSP,y,'C2FSP');
            if C2FSP(CNB2(1),CNB2(2))==0
                NZE(9)=NZE(9)-1;
            end
        case(C2)
            C3FSP(CNB2(1),CNB2(2))=C3FSP(CNB2(1),CNB2(2))-1;%removeevent(C3FSP,y,'C3FSP');
            if C3FSP(CNB2(1),CNB2(2))==0
                NZE(10)=NZE(10)-1;
            end
        case(C3)
            C3diffusionSP(CNB2(1),CNB2(2))=C3diffusionSP(CNB2(1),CNB2(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP'); 
            if C3diffusionSP(CNB2(1),CNB2(2))==1
                NZE(4)=NZE(4)+1;
            end
            CXFSP(CNB2(1),CNB2(2))=CXFSP(CNB2(1),CNB2(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(CNB2(1),CNB2(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(CX)
            CXFSP(CNB2(1),CNB2(2))=CXFSP(CNB2(1),CNB2(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(CNB2(1),CNB2(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
    
if CNB3~=0
    Checkspecies=Conf(CNB3(1),CNB3(2)); %check C neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(Cpickedup(1),Cpickedup(2))=CH4DSP(Cpickedup(1),Cpickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(Cpickedup(1),Cpickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(CNB3(1),CNB3(2))=CH4DSP(CNB3(1),CNB3(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(CNB3(1),CNB3(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(CNB3(1),CNB3(2))=HdiffusionSP(CNB3(1),CNB3(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(CNB3(1),CNB3(2))==1
                NZE(1)=NZE(1)+1;
            end
            CHPSP(Cpickedup(1),Cpickedup(2))=CHPSP(Cpickedup(1),Cpickedup(2))-1;%removeevent(CHPSP,x,'CHPSP');
            if CHPSP(Cpickedup(1),Cpickedup(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(CH3)
            CH3DSP(CNB3(1),CNB3(2))=CH3DSP(CNB3(1),CNB3(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(CNB3(1),CNB3(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH2DSP(CNB3(1),CNB3(2))=CH2DSP(CNB3(1),CNB3(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(CNB3(1),CNB3(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CHDSP(CNB3(1),CNB3(2))=CHDSP(CNB3(1),CNB3(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(CNB3(1),CNB3(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CdiffusionSP(CNB3(1),CNB3(2))=CdiffusionSP(CNB3(1),CNB3(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(CNB3(1),CNB3(2))==1
                NZE(3)=NZE(3)+1;
            end
            C2FSP(Cpickedup(1),Cpickedup(2))=C2FSP(Cpickedup(1),Cpickedup(2))-1;%removeevent(C2FSP,x,'C2FSP');
            if C2FSP(Cpickedup(1),Cpickedup(2))==0
                NZE(9)=NZE(9)-1;
            end
            C2FSP(CNB3(1),CNB3(2))=C2FSP(CNB3(1),CNB3(2))-1;%removeevent(C2FSP,y,'C2FSP');
            if C2FSP(CNB3(1),CNB3(2))==0
                NZE(9)=NZE(9)-1;
            end
        case(C2)
            C3FSP(CNB3(1),CNB3(2))=C3FSP(CNB3(1),CNB3(2))-1;%removeevent(C3FSP,y,'C3FSP');
            if C3FSP(CNB3(1),CNB3(2))==0
                NZE(10)=NZE(10)-1;
            end
        case(C3)
            C3diffusionSP(CNB3(1),CNB3(2))=C3diffusionSP(CNB3(1),CNB3(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP'); 
            if C3diffusionSP(CNB3(1),CNB3(2))==1
                NZE(4)=NZE(4)+1;
            end
            CXFSP(CNB3(1),CNB3(2))=CXFSP(CNB3(1),CNB3(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(CNB3(1),CNB3(2))==0
                NZE(11)=NZE(11)-1;
            end
        case(CX)
            CXFSP(CNB3(1),CNB3(2))=CXFSP(CNB3(1),CNB3(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(CNB3(1),CNB3(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end
end