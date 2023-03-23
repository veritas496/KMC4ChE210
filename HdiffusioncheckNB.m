function [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,...
    CH2,CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,HNB1,HNB2,HNB3,EPpickedup,EPNB1,EPNB2,EPNB3)
%x is Hpickedup;y is one of its neighbour
    Checkspecies=Conf(HNB1(1),HNB1(2)); %check H neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(Hpickedup(1),Hpickedup(2))=CH4DSP(Hpickedup(1),Hpickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(Hpickedup(1),Hpickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(HNB1(1),HNB1(2))=CH4DSP(HNB1(1),HNB1(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(HNB1(1),HNB1(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(HNB1(1),HNB1(2))=HdiffusionSP(HNB1(1),HNB1(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(HNB1(1),HNB1(2))==1
                NZE(1)=NZE(1)+1;
            end
            H2PSP(Hpickedup(1),Hpickedup(2))=H2PSP(Hpickedup(1),Hpickedup(2))-1;%removeevent(H2PSP,x,'H2PSP');
            if H2PSP(Hpickedup(1),Hpickedup(2))==0
                NZE(12)=NZE(12)-1;
            end
            H2PSP(HNB1(1),HNB1(2))=H2PSP(HNB1(1),HNB1(2))-1;%removeevent(H2PSP,y,'H2PSP');
            if H2PSP(HNB1(1),HNB1(2))==0
                NZE(12)=NZE(12)-1;
            end
        case(CH3)
            CH4PSP(HNB1(1),HNB1(2))=CH4PSP(HNB1(1),HNB1(2))-1;%removeevent(CH4PSP,y,'CH4PSP');
            if CH4PSP(HNB1(1),HNB1(2))==0
                NZE(15)=NZE(15)-1;
            end
            CH3DSP(HNB1(1),HNB1(2))=CH3DSP(HNB1(1),HNB1(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(HNB1(1),HNB1(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH3PSP(HNB1(1),HNB1(2))=CH3PSP(HNB1(1),HNB1(2))-1;%removeevent(CH3PSP,y,'CH3PSP');
            if CH3PSP(HNB1(1),HNB1(2))==0
                NZE(16)=NZE(16)-1;
            end
            CH2DSP(HNB1(1),HNB1(2))=CH2DSP(HNB1(1),HNB1(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(HNB1(1),HNB1(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CH2PSP(HNB1(1),HNB1(2))=CH2PSP(HNB1(1),HNB1(2))-1;%removeevent(CH2PSP,y,'CH2PSP');
            if CH2PSP(HNB1(1),HNB1(2))==0
                NZE(17)=NZE(17)-1;
            end
            CHDSP(HNB1(1),HNB1(2))=CHDSP(HNB1(1),HNB1(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(HNB1(1),HNB1(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CHPSP(HNB1(1),HNB1(2))=CHPSP(HNB1(1),HNB1(2))-1;%removeevent(CHPSP,y,'CHPSP');
            if CHPSP(HNB1(1),HNB1(2))==0
                NZE(18)=NZE(18)-1;
            end
            CdiffusionSP(HNB1(1),HNB1(2))=CdiffusionSP(HNB1(1),HNB1(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(HNB1(1),HNB1(2))==1
                NZE(3)=NZE(3)+1;
            end
        case(C3)
            C3diffusionSP(HNB1(1),HNB1(2))=C3diffusionSP(HNB1(1),HNB1(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP');
            if C3diffusionSP(HNB1(1),HNB1(2))==1
                NZE(4)=NZE(4)+1;
            end
    end
    
if HNB2~=0    
    Checkspecies=Conf(HNB2(1),HNB2(2)); %check H neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(Hpickedup(1),Hpickedup(2))=CH4DSP(Hpickedup(1),Hpickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(Hpickedup(1),Hpickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(HNB2(1),HNB2(2))=CH4DSP(HNB2(1),HNB2(2))+1;%addevent(CH4DSP,z,'CH4DSP');
            if CH4DSP(HNB2(1),HNB2(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(HNB2(1),HNB2(2))=HdiffusionSP(HNB2(1),HNB2(2))+1;%addevent(HdiffusionSP,z,'HdiffusionSP');
            if HdiffusionSP(HNB2(1),HNB2(2))==1
                NZE(1)=NZE(1)+1;
            end
            H2PSP(Hpickedup(1),Hpickedup(2))=H2PSP(Hpickedup(1),Hpickedup(2))-1;%removeevent(H2PSP,x,'H2PSP');
            if H2PSP(Hpickedup(1),Hpickedup(2))==0
                NZE(12)=NZE(12)-1;
            end
            H2PSP(HNB2(1),HNB2(2))=H2PSP(HNB2(1),HNB2(2))-1;%removeevent(H2PSP,z,'H2PSP');
            if H2PSP(HNB2(1),HNB2(2))==0
                NZE(12)=NZE(12)-1;
            end
        case(CH3)
            CH4PSP(HNB2(1),HNB2(2))=CH4PSP(HNB2(1),HNB2(2))-1;%removeevent(CH4PSP,z,'CH4PSP');
            if CH4PSP(HNB2(1),HNB2(2))==0
                NZE(15)=NZE(15)-1;
            end
            CH3DSP(HNB2(1),HNB2(2))=CH3DSP(HNB2(1),HNB2(2))+1;%addevent(CH3DSP,z,'CH3DSP');
            if CH3DSP(HNB2(1),HNB2(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH3PSP(HNB2(1),HNB2(2))=CH3PSP(HNB2(1),HNB2(2))-1;%removeevent(CH3PSP,z,'CH3PSP');
            if CH3PSP(HNB2(1),HNB2(2))==0
                NZE(16)=NZE(16)-1;
            end
            CH2DSP(HNB2(1),HNB2(2))=CH2DSP(HNB2(1),HNB2(2))+1;%addevent(CH2DSP,z,'CH2DSP');
            if CH2DSP(HNB2(1),HNB2(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CH2PSP(HNB2(1),HNB2(2))=CH2PSP(HNB2(1),HNB2(2))-1;%removeevent(CH2PSP,z,'CH2PSP');
            if CH2PSP(HNB2(1),HNB2(2))==0
                NZE(17)=NZE(17)-1;
            end
            CHDSP(HNB2(1),HNB2(2))=CHDSP(HNB2(1),HNB2(2))+1;%addevent(CHDSP,z,'CHDSP');
            if CHDSP(HNB2(1),HNB2(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CHPSP(HNB2(1),HNB2(2))=CHPSP(HNB2(1),HNB2(2))-1;%removeevent(CHPSP,z,'CHPSP');
            if CHPSP(HNB2(1),HNB2(2))==0
                NZE(18)=NZE(18)-1;
            end
            CdiffusionSP(HNB2(1),HNB2(2))=CdiffusionSP(HNB2(1),HNB2(2))+1;%addevent(CdiffusionSP,z,'CdiffusionSP');
            if CdiffusionSP(HNB2(1),HNB2(2))==1
                NZE(3)=NZE(3)+1;
            end
        case(C3)
            C3diffusionSP(HNB2(1),HNB2(2))=C3diffusionSP(HNB2(1),HNB2(2))+1;%addevent(C3diffusionSP,z,'C3diffusionSP');
            if C3diffusionSP(HNB2(1),HNB2(2))==1
                NZE(4)=NZE(4)+1;
            end
    end
end

if HNB3~=0    
    Checkspecies=Conf(HNB3(1),HNB3(2)); %check H neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(Hpickedup(1),Hpickedup(2))=CH4DSP(Hpickedup(1),Hpickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(Hpickedup(1),Hpickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(HNB3(1),HNB3(2))=CH4DSP(HNB3(1),HNB3(2))+1;%addevent(CH4DSP,m,'CH4DSP');
            if CH4DSP(HNB3(1),HNB3(2))==1
                NZE(5)=NZE(5)+1;
            end
        case(H)
            HdiffusionSP(HNB3(1),HNB3(2))=HdiffusionSP(HNB3(1),HNB3(2))+1;%addevent(HdiffusionSP,m,'HdiffusionSP');
            if HdiffusionSP(HNB3(1),HNB3(2))==1
                NZE(1)=NZE(1)+1;
            end
            H2PSP(Hpickedup(1),Hpickedup(2))=H2PSP(Hpickedup(1),Hpickedup(2))-1;%removeevent(H2PSP,x,'H2PSP');
            if H2PSP(Hpickedup(1),Hpickedup(2))==0
                NZE(12)=NZE(12)-1;
            end
            H2PSP(HNB3(1),HNB3(2))=H2PSP(HNB3(1),HNB3(2))-1;%removeevent(H2PSP,m,'H2PSP');
            if H2PSP(HNB3(1),HNB3(2))==0
                NZE(12)=NZE(12)-1;
            end
        case(CH3)
            CH4PSP(HNB3(1),HNB3(2))=CH4PSP(HNB3(1),HNB3(2))-1;%removeevent(CH4PSP,m,'CH4PSP');
            if CH4PSP(HNB3(1),HNB3(2))==0
                NZE(15)=NZE(15)-1;
            end
            CH3DSP(HNB3(1),HNB3(2))=CH3DSP(HNB3(1),HNB3(2))+1;%addevent(CH3DSP,m,'CH3DSP');
            if CH3DSP(HNB3(1),HNB3(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH3PSP(HNB3(1),HNB3(2))=CH3PSP(HNB3(1),HNB3(2))-1;%removeevent(CH3PSP,m,'CH3PSP');
            if CH3PSP(HNB3(1),HNB3(2))==0
                NZE(16)=NZE(16)-1;
            end
            CH2DSP(HNB3(1),HNB3(2))=CH2DSP(HNB3(1),HNB3(2))+1;%addevent(CH2DSP,m,'CH2DSP');
            if CH2DSP(HNB3(1),HNB3(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CH2PSP(HNB3(1),HNB3(2))=CH2PSP(HNB3(1),HNB3(2))-1;%removeevent(CH2PSP,m,'CH2PSP');
            if CH2PSP(HNB3(1),HNB3(2))==0
                NZE(17)=NZE(17)-1;
            end
            CHDSP(HNB3(1),HNB3(2))=CHDSP(HNB3(1),HNB3(2))+1;%addevent(CHDSP,m,'CHDSP');
            if CHDSP(HNB3(1),HNB3(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CHPSP(HNB3(1),HNB3(2))=CHPSP(HNB3(1),HNB3(2))-1;%removeevent(CHPSP,m,'CHPSP');
            if CHPSP(HNB3(1),HNB3(2))==0
                NZE(18)=NZE(18)-1;
            end
            CdiffusionSP(HNB3(1),HNB3(2))=CdiffusionSP(HNB3(1),HNB3(2))+1;%addevent(CdiffusionSP,m,'CdiffusionSP');
            if CdiffusionSP(HNB3(1),HNB3(2))==1
                NZE(3)=NZE(3)+1;
            end
        case(C3)
            C3diffusionSP(HNB3(1),HNB3(2))=C3diffusionSP(HNB3(1),HNB3(2))+1;%addevent(C3diffusionSP,m,'C3diffusionSP');
            if C3diffusionSP(HNB3(1),HNB3(2))==1
                NZE(4)=NZE(4)+1;
            end
    end
end

Checkspecies=Conf(EPNB1(1),EPNB1(2)); %check EP 0 neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(EPpickedup(1),EPpickedup(2))=CH4DSP(EPpickedup(1),EPpickedup(2))-1;%removeevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(EPpickedup(1),EPpickedup(2))==0
                NZE(5)=NZE(5)-1;
            end
            CH4DSP(EPNB1(1),EPNB1(2))=CH4DSP(EPNB1(1),EPNB1(2))-1;%removeevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(EPNB1(1),EPNB1(2))==0
                NZE(5)=NZE(5)-1;
            end
            HdiffusionSP(EPpickedup(1),EPpickedup(2))=HdiffusionSP(EPpickedup(1),EPpickedup(2))+1;%addevent(HdiffusionSP,x,'HdiffusionSP');
        case(H)
            HdiffusionSP(EPNB1(1),EPNB1(2))=HdiffusionSP(EPNB1(1),EPNB1(2))-1;%removeevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(EPNB1(1),EPNB1(2))==0
                NZE(1)=NZE(1)-1;
            end
            H2PSP(EPpickedup(1),EPpickedup(2))=H2PSP(EPpickedup(1),EPpickedup(2))+1;%addevent(H2PSP,x,'H2PSP');
            if H2PSP(EPpickedup(1),EPpickedup(2))==1
                NZE(12)=NZE(12)+1;
            end
            H2PSP(EPNB1(1),EPNB1(2))=H2PSP(EPNB1(1),EPNB1(2))+1;%addevent(H2PSP,y,'H2PSP');
            if H2PSP(EPNB1(1),EPNB1(2))==1
                NZE(12)=NZE(12)+1;
            end
        case(CH3)
            CH3DSP(EPNB1(1),EPNB1(2))=CH3DSP(EPNB1(1),EPNB1(2))-1;%removeevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(EPNB1(1),EPNB1(2))==0
                NZE(6)=NZE(6)-1;
            end
            CH4PSP(EPNB1(1),EPNB1(2))=CH4PSP(EPNB1(1),EPNB1(2))+1;%addevent(CH4PSP,y,'CH4PSP');
            if CH4PSP(EPNB1(1),EPNB1(2))==1
                NZE(15)=NZE(15)+1;
            end
        case(CH2)
            CH2DSP(EPNB1(1),EPNB1(2))=CH2DSP(EPNB1(1),EPNB1(2))-1;%removeevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(EPNB1(1),EPNB1(2))==0
                NZE(7)=NZE(7)-1;
            end  
            CH3PSP(EPNB1(1),EPNB1(2))=CH3PSP(EPNB1(1),EPNB1(2))+1;%addevent(CH3PSP,y,'CH3PSP');
            if CH3PSP(EPNB1(1),EPNB1(2))==1
                NZE(16)=NZE(16)+1;
            end
        case(CH)
            CHDSP(EPNB1(1),EPNB1(2))=CHDSP(EPNB1(1),EPNB1(2))-1;%removeevent(CHDSP,y,'CHDSP');
            if CHDSP(EPNB1(1),EPNB1(2))==0
                NZE(8)=NZE(8)-1;
            end
            CH2PSP(EPNB1(1),EPNB1(2))=CH2PSP(EPNB1(1),EPNB1(2))+1;%addevent(CH2PSP,y,'CH2PSP');
            if CH2PSP(EPNB1(1),EPNB1(2))==1
                NZE(17)=NZE(17)+1;
            end
        case(C)
            CdiffusionSP(EPNB1(1),EPNB1(2))=CdiffusionSP(EPNB1(1),EPNB1(2))-1;%removeevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(EPNB1(1),EPNB1(2))==0
                NZE(3)=NZE(3)-1;
            end
            CHPSP(EPNB1(1),EPNB1(2))=CHPSP(EPNB1(1),EPNB1(2))+1;%addevent(CHPSP,y,'CHPSP');
            if CHPSP(EPNB1(1),EPNB1(2))==1
                NZE(18)=NZE(18)+1;
            end
        case(C3)
            C3diffusionSP(EPNB1(1),EPNB1(2))=C3diffusionSP(EPNB1(1),EPNB1(2))-1;%removeevent(C3diffusionSP,y,'C3diffusionSP');
            if C3diffusionSP(EPNB1(1),EPNB1(2))==0
                NZE(4)=NZE(4)-1;
            end
    end
if EPNB2~=0
    Checkspecies=Conf(EPNB2(1),EPNB2(2)); %check EP 0 neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(EPpickedup(1),EPpickedup(2))=CH4DSP(EPpickedup(1),EPpickedup(2))-1;%removeevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(EPpickedup(1),EPpickedup(2))==0
                NZE(5)=NZE(5)-1;
            end
            CH4DSP(EPNB2(1),EPNB2(2))=CH4DSP(EPNB2(1),EPNB2(2))-1;%removeevent(CH4DSP,z,'CH4DSP');
            if CH4DSP(EPNB2(1),EPNB2(2))==0
                NZE(5)=NZE(5)-1;
            end
            HdiffusionSP(EPpickedup(1),EPpickedup(2))=HdiffusionSP(EPpickedup(1),EPpickedup(2))+1;%addevent(HdiffusionSP,x,'HdiffusionSP');
        case(H)
            HdiffusionSP(EPNB2(1),EPNB2(2))=HdiffusionSP(EPNB2(1),EPNB2(2))-1;%removeevent(HdiffusionSP,z,'HdiffusionSP');
            if HdiffusionSP(EPNB2(1),EPNB2(2))==0
                NZE(1)=NZE(1)-1;
            end
            H2PSP(EPpickedup(1),EPpickedup(2))=H2PSP(EPpickedup(1),EPpickedup(2))+1;%addevent(H2PSP,x,'H2PSP');
            if H2PSP(EPpickedup(1),EPpickedup(2))==1
                NZE(12)=NZE(12)+1;
            end
            H2PSP(EPNB2(1),EPNB2(2))=H2PSP(EPNB2(1),EPNB2(2))+1;%addevent(H2PSP,z,'H2PSP');
            if H2PSP(EPNB2(1),EPNB2(2))==1
                NZE(12)=NZE(12)+1;
            end
        case(CH3)
            CH3DSP(EPNB2(1),EPNB2(2))=CH3DSP(EPNB2(1),EPNB2(2))-1;%removeevent(CH3DSP,z,'CH3DSP');
            if CH3DSP(EPNB2(1),EPNB2(2))==0
                NZE(6)=NZE(6)-1;
            end
            CH4PSP(EPNB2(1),EPNB2(2))=CH4PSP(EPNB2(1),EPNB2(2))+1;%addevent(CH4PSP,z,'CH4PSP');
            if CH4PSP(EPNB2(1),EPNB2(2))==1
                NZE(15)=NZE(15)+1;
            end
        case(CH2)
            CH2DSP(EPNB2(1),EPNB2(2))=CH2DSP(EPNB2(1),EPNB2(2))-1;%removeevent(CH2DSP,z,'CH2DSP');
            if CH2DSP(EPNB2(1),EPNB2(2))==0
                NZE(7)=NZE(7)-1;
            end  
            CH3PSP(EPNB2(1),EPNB2(2))=CH3PSP(EPNB2(1),EPNB2(2))+1;%addevent(CH3PSP,z,'CH3PSP');
            if CH3PSP(EPNB2(1),EPNB2(2))==1
                NZE(16)=NZE(16)+1;
            end
        case(CH)
            CHDSP(EPNB2(1),EPNB2(2))=CHDSP(EPNB2(1),EPNB2(2))-1;%removeevent(CHDSP,z,'CHDSP');
            if CHDSP(EPNB2(1),EPNB2(2))==0
                NZE(8)=NZE(8)-1;
            end
            CH2PSP(EPNB2(1),EPNB2(2))=CH2PSP(EPNB2(1),EPNB2(2))+1;%addevent(CH2PSP,z,'CH2PSP');
            if CH2PSP(EPNB2(1),EPNB2(2))==1
                NZE(17)=NZE(17)+1;
            end
        case(C)
            CdiffusionSP(EPNB2(1),EPNB2(2))=CdiffusionSP(EPNB2(1),EPNB2(2))-1;%removeevent(CdiffusionSP,z,'CdiffusionSP');
            if CdiffusionSP(EPNB2(1),EPNB2(2))==0
                NZE(3)=NZE(3)-1;
            end
            CHPSP(EPNB2(1),EPNB2(2))=CHPSP(EPNB2(1),EPNB2(2))+1;%addevent(CHPSP,z,'CHPSP');
            if CHPSP(EPNB2(1),EPNB2(2))==1
                NZE(18)=NZE(18)+1;
            end
        case(C3)
            C3diffusionSP(EPNB2(1),EPNB2(2))=C3diffusionSP(EPNB2(1),EPNB2(2))-1;%removeevent(C3diffusionSP,z,'C3diffusionSP');
            if C3diffusionSP(EPNB2(1),EPNB2(2))==0
                NZE(4)=NZE(4)-1;
            end
    end
end

if EPNB3~=0
    Checkspecies=Conf(EPNB3(1),EPNB3(2)); %check EP 0 neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(EPpickedup(1),EPpickedup(2))=CH4DSP(EPpickedup(1),EPpickedup(2))-1;%removeevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(EPpickedup(1),EPpickedup(2))==0
                NZE(5)=NZE(5)-1;
            end
            CH4DSP(EPNB3(1),EPNB3(2))=CH4DSP(EPNB3(1),EPNB3(2))-1;%removeevent(CH4DSP,m,'CH4DSP');
            if CH4DSP(EPNB3(1),EPNB3(2))==0
                NZE(5)=NZE(5)-1;
            end
            HdiffusionSP(EPpickedup(1),EPpickedup(2))=HdiffusionSP(EPpickedup(1),EPpickedup(2))+1;%addevent(HdiffusionSP,x,'HdiffusionSP');
        case(H)
            HdiffusionSP(EPNB3(1),EPNB3(2))=HdiffusionSP(EPNB3(1),EPNB3(2))-1;%removeevent(HdiffusionSP,m,'HdiffusionSP');
            if HdiffusionSP(EPNB3(1),EPNB3(2))==0
                NZE(1)=NZE(1)-1;
            end
            H2PSP(EPpickedup(1),EPpickedup(2))=H2PSP(EPpickedup(1),EPpickedup(2))+1;%addevent(H2PSP,x,'H2PSP');
            if H2PSP(EPpickedup(1),EPpickedup(2))==1
                NZE(12)=NZE(12)+1;
            end
            H2PSP(EPNB3(1),EPNB3(2))=H2PSP(EPNB3(1),EPNB3(2))+1;%addevent(H2PSP,m,'H2PSP');
            if H2PSP(EPNB3(1),EPNB3(2))==1
                NZE(12)=NZE(12)+1;
            end
        case(CH3)
            CH3DSP(EPNB3(1),EPNB3(2))=CH3DSP(EPNB3(1),EPNB3(2))-1;%removeevent(CH3DSP,m,'CH3DSP');
            if CH3DSP(EPNB3(1),EPNB3(2))==0
                NZE(6)=NZE(6)-1;
            end
            CH4PSP(EPNB3(1),EPNB3(2))=CH4PSP(EPNB3(1),EPNB3(2))+1;%addevent(CH4PSP,m,'CH4PSP');
            if CH4PSP(EPNB3(1),EPNB3(2))==1
                NZE(15)=NZE(15)+1;
            end
        case(CH2)
            CH2DSP(EPNB3(1),EPNB3(2))=CH2DSP(EPNB3(1),EPNB3(2))-1;%removeevent(CH2DSP,m,'CH2DSP');
            if CH2DSP(EPNB3(1),EPNB3(2))==0
                NZE(7)=NZE(7)-1;
            end  
            CH3PSP(EPNB3(1),EPNB3(2))=CH3PSP(EPNB3(1),EPNB3(2))+1;%addevent(CH3PSP,m,'CH3PSP');
            if CH3PSP(EPNB3(1),EPNB3(2))==1
                NZE(16)=NZE(16)+1;
            end
        case(CH)
            CHDSP(EPNB3(1),EPNB3(2))=CHDSP(EPNB3(1),EPNB3(2))-1;%removeevent(CHDSP,m,'CHDSP');
            if CHDSP(EPNB3(1),EPNB3(2))==0
                NZE(8)=NZE(8)-1;
            end
            CH2PSP(EPNB3(1),EPNB3(2))=CH2PSP(EPNB3(1),EPNB3(2))+1;%addevent(CH2PSP,m,'CH2PSP');
            if CH2PSP(EPNB3(1),EPNB3(2))==1
                NZE(17)=NZE(17)+1;
            end
        case(C)
            CdiffusionSP(EPNB3(1),EPNB3(2))=CdiffusionSP(EPNB3(1),EPNB3(2))-1;%removeevent(CdiffusionSP,m,'CdiffusionSP');
            if CdiffusionSP(EPNB3(1),EPNB3(2))==0
                NZE(3)=NZE(3)-1;
            end
            CHPSP(EPNB3(1),EPNB3(2))=CHPSP(EPNB3(1),EPNB3(2))+1;%addevent(CHPSP,m,'CHPSP');
            if CHPSP(EPNB3(1),EPNB3(2))==1
                NZE(18)=NZE(18)+1;
            end
        case(C3)
            C3diffusionSP(EPNB3(1),EPNB3(2))=C3diffusionSP(EPNB3(1),EPNB3(2))-1;%removeevent(C3diffusionSP,m,'C3diffusionSP');
            if C3diffusionSP(EPNB3(1),EPNB3(2))==0
                NZE(4)=NZE(4)-1;
            end
    end
end

end