function [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                        CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,CH2NB1,CH2NB2,CH2NB3,Hpickedup,HNB1,HNB2,HNB3) 

Checkspecies=Conf(CH2NB1(1),CH2NB1(2)); %check CH2  neighbour
    
    switch (Checkspecies)
        case(0)
            
            CH3DSP(CH2pickedup(1),CH2pickedup(2))=CH3DSP(CH2pickedup(1),CH2pickedup(2))+1;%addevent(CH3DSP,x,'CH3DSP');
            if CH3DSP(CH2pickedup(1),CH2pickedup(2))==1
                NZE(6)=NZE(6)+1;
            end
            
            CH2DSP(CH2pickedup(1),CH2pickedup(2))=CH2DSP(CH2pickedup(1),CH2pickedup(2))-1;%removeevent(CH2DSP,x,'CH2DSP');
            if CH2DSP(CH2pickedup(1),CH2pickedup(2))==0
                NZE(7)=NZE(7)-1;
            end

        case(H)
             
            CH4PSP(CH2pickedup(1),CH2pickedup(2))=CH4PSP(CH2pickedup(1),CH2pickedup(2))+1;%addevent(CH4PSP,x,'CH4PSP');
            if CH4PSP(CH2pickedup(1),CH2pickedup(2))==1
                NZE(15)=NZE(15)+1;
            end
    end
    
if CH2NB2~=0
    
    Checkspecies=Conf(CH2NB2(1),CH2NB2(2)); %check CH2  neighbour
    
    switch (Checkspecies)
        case(0)
            
            CH3DSP(CH2pickedup(1),CH2pickedup(2))=CH3DSP(CH2pickedup(1),CH2pickedup(2))+1;%addevent(CH3DSP,x,'CH3DSP');
            if CH3DSP(CH2pickedup(1),CH2pickedup(2))==1
                NZE(6)=NZE(6)+1;
            end
            
            CH2DSP(CH2pickedup(1),CH2pickedup(2))=CH2DSP(CH2pickedup(1),CH2pickedup(2))-1;%removeevent(CH2DSP,x,'CH2DSP');
            if CH2DSP(CH2pickedup(1),CH2pickedup(2))==0
                NZE(7)=NZE(7)-1;
            end

        case(H)
             
            CH4PSP(CH2pickedup(1),CH2pickedup(2))=CH4PSP(CH2pickedup(1),CH2pickedup(2))+1;%addevent(CH4PSP,x,'CH4PSP');
            if CH4PSP(CH2pickedup(1),CH2pickedup(2))==1
                NZE(15)=NZE(15)+1;
            end
    end
end
    
if CH2NB3~=0
    
    Checkspecies=Conf(CH2pickedup(1),CH2pickedup(2)); %check CH2  neighbour
    
    switch (Checkspecies)
        case(0)
            
            CH3DSP(CH2pickedup(1),CH2pickedup(2))=CH3DSP(CH2pickedup(1),CH2pickedup(2))+1;%addevent(CH3DSP,x,'CH3DSP');
            if CH3DSP(CH2pickedup(1),CH2pickedup(2))==1
                NZE(6)=NZE(6)+1;
            end
            
            CH2DSP(CH2pickedup(1),CH2pickedup(2))=CH2DSP(CH2pickedup(1),CH2pickedup(2))-1;%removeevent(CH2DSP,x,'CH2DSP');
            if CH2DSP(CH2pickedup(1),CH2pickedup(2))==0
                NZE(7)=NZE(7)-1;
            end

        case(H)
             
            CH4PSP(CH2pickedup(1),CH2pickedup(2))=CH4PSP(CH2pickedup(1),CH2pickedup(2))+1;%addevent(CH4PSP,x,'CH4PSP');
            if CH4PSP(CH2pickedup(1),CH2pickedup(2))==1
                NZE(15)=NZE(15)+1;
            end
    end
end

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
            HdiffusionSP(Hpickedup(1),Hpickedup(2))=HdiffusionSP(Hpickedup(1),Hpickedup(2))-1;%removeevent(HdiffusionSP,x,'HdiffusionSP');
            if HdiffusionSP(Hpickedup(1),Hpickedup(2))==0
                NZE(1)=NZE(1)-1;
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
            CH3DSP(HNB1(1),HNB1(2))=CH3DSP(HNB1(1),HNB1(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(HNB1(1),HNB1(2))==1
                NZE(6)=NZE(6)+1;
            end
            CH4PSP(HNB1(1),HNB1(2))=CH4PSP(HNB1(1),HNB1(2))-1;%removeevent(CH4PSP,y,'CH4PSP');
            if CH4PSP(HNB1(1),HNB1(2))==0
                NZE(15)=NZE(15)-1;
            end
        case(CH2)
            CH2DSP(HNB1(1),HNB1(2))=CH2DSP(HNB1(1),HNB1(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(HNB1(1),HNB1(2))==1
                NZE(7)=NZE(7)+1;
            end
            CH3PSP(HNB1(1),HNB1(2))=CH3PSP(HNB1(1),HNB1(2))-1;%removeevent(CH3PSP,y,'CH3PSP');
            if CH3PSP(HNB1(1),HNB1(2))==0
                NZE(16)=NZE(16)-1;
            end
        case(CH)
            CHDSP(HNB1(1),HNB1(2))=CHDSP(HNB1(1),HNB1(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(HNB1(1),HNB1(2))==1
                NZE(8)=NZE(8)+1;
            end
            CH2PSP(HNB1(1),HNB1(2))=CH2PSP(HNB1(1),HNB1(2))-1;%removeevent(CH2PSP,y,'CH2PSP');
            if CH2PSP(HNB1(1),HNB1(2))==0
                NZE(17)=NZE(17)-1;
            end
        case(C)
            CdiffusionSP(HNB1(1),HNB1(2))=CdiffusionSP(HNB1(1),HNB1(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(HNB1(1),HNB1(2))==1
                NZE(3)=NZE(3)+1;
            end
            CHPSP(HNB1(1),HNB1(2))=CHPSP(HNB1(1),HNB1(2))-1;%removeevent(CHPSP,y,'CHPSP');
            if CHPSP(HNB1(1),HNB1(2))==0
                NZE(18)=NZE(18)-1;
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
            CH4DSP(HNB2(1),HNB2(2))=CH4DSP(HNB2(1),HNB2(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(HNB2(1),HNB2(2))==1
                NZE(5)=NZE(5)+1;
            end
            HdiffusionSP(Hpickedup(1),Hpickedup(2))=HdiffusionSP(Hpickedup(1),Hpickedup(2))-1;%removeevent(HdiffusionSP,x,'HdiffusionSP');
            if HdiffusionSP(Hpickedup(1),Hpickedup(2))==0
                NZE(1)=NZE(1)-1;
            end
        case(H)
            HdiffusionSP(HNB2(1),HNB2(2))=HdiffusionSP(HNB2(1),HNB2(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(HNB2(1),HNB2(2))==1
                NZE(1)=NZE(1)+1;
            end
            H2PSP(Hpickedup(1),Hpickedup(2))=H2PSP(Hpickedup(1),Hpickedup(2))-1;%removeevent(H2PSP,x,'H2PSP');
            if H2PSP(Hpickedup(1),Hpickedup(2))==0
                NZE(12)=NZE(12)-1;
            end
            H2PSP(HNB2(1),HNB2(2))=H2PSP(HNB2(1),HNB2(2))-1;%removeevent(H2PSP,y,'H2PSP');
            if H2PSP(HNB2(1),HNB2(2))==0
                NZE(12)=NZE(12)-1;
            end
        case(CH3)
            CH3DSP(HNB2(1),HNB2(2))=CH3DSP(HNB2(1),HNB2(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(HNB2(1),HNB2(2))==1
                NZE(6)=NZE(6)+1;
            end
            CH4PSP(HNB2(1),HNB2(2))=CH4PSP(HNB2(1),HNB2(2))-1;%removeevent(CH4PSP,y,'CH4PSP');
            if CH4PSP(HNB2(1),HNB2(2))==0
                NZE(15)=NZE(15)-1;
            end
        case(CH2)
            CH2DSP(HNB2(1),HNB2(2))=CH2DSP(HNB2(1),HNB2(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(HNB2(1),HNB2(2))==1
                NZE(7)=NZE(7)+1;
            end
            CH3PSP(HNB2(1),HNB2(2))=CH3PSP(HNB2(1),HNB2(2))-1;%removeevent(CH3PSP,y,'CH3PSP');
            if CH3PSP(HNB2(1),HNB2(2))==0
                NZE(16)=NZE(16)-1;
            end
        case(CH)
            CHDSP(HNB2(1),HNB2(2))=CHDSP(HNB2(1),HNB2(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(HNB2(1),HNB2(2))==1
                NZE(8)=NZE(8)+1;
            end
            CH2PSP(HNB2(1),HNB2(2))=CH2PSP(HNB2(1),HNB2(2))-1;%removeevent(CH2PSP,y,'CH2PSP');
            if CH2PSP(HNB2(1),HNB2(2))==0
                NZE(17)=NZE(17)-1;
            end
        case(C)
            CdiffusionSP(HNB2(1),HNB2(2))=CdiffusionSP(HNB2(1),HNB2(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(HNB2(1),HNB2(2))==1
                NZE(3)=NZE(3)+1;
            end
            CHPSP(HNB2(1),HNB2(2))=CHPSP(HNB2(1),HNB2(2))-1;%removeevent(CHPSP,y,'CHPSP');
            if CHPSP(HNB2(1),HNB2(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(C3)
            C3diffusionSP(HNB2(1),HNB2(2))=C3diffusionSP(HNB2(1),HNB2(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP');  
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
            CH4DSP(HNB3(1),HNB3(2))=CH4DSP(HNB3(1),HNB3(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(HNB3(1),HNB3(2))==1
                NZE(5)=NZE(5)+1;
            end
            HdiffusionSP(Hpickedup(1),Hpickedup(2))=HdiffusionSP(Hpickedup(1),Hpickedup(2))-1;%removeevent(HdiffusionSP,x,'HdiffusionSP');
            if HdiffusionSP(Hpickedup(1),Hpickedup(2))==0
                NZE(1)=NZE(1)-1;
            end
        case(H)
            HdiffusionSP(HNB3(1),HNB3(2))=HdiffusionSP(HNB3(1),HNB3(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(HNB3(1),HNB3(2))==1
                NZE(1)=NZE(1)+1;
            end
            H2PSP(Hpickedup(1),Hpickedup(2))=H2PSP(Hpickedup(1),Hpickedup(2))-1;%removeevent(H2PSP,x,'H2PSP');
            if H2PSP(Hpickedup(1),Hpickedup(2))==0
                NZE(12)=NZE(12)-1;
            end
            H2PSP(HNB3(1),HNB3(2))=H2PSP(HNB3(1),HNB3(2))-1;%removeevent(H2PSP,y,'H2PSP');
            if H2PSP(HNB3(1),HNB3(2))==0
                NZE(12)=NZE(12)-1;
            end
        case(CH3)
            CH3DSP(HNB3(1),HNB3(2))=CH3DSP(HNB3(1),HNB3(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(HNB3(1),HNB3(2))==1
                NZE(6)=NZE(6)+1;
            end
            CH4PSP(HNB3(1),HNB3(2))=CH4PSP(HNB3(1),HNB3(2))-1;%removeevent(CH4PSP,y,'CH4PSP');
            if CH4PSP(HNB3(1),HNB3(2))==0
                NZE(15)=NZE(15)-1;
            end
        case(CH2)
            CH2DSP(HNB3(1),HNB3(2))=CH2DSP(HNB3(1),HNB3(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(HNB3(1),HNB3(2))==1
                NZE(7)=NZE(7)+1;
            end
            CH3PSP(HNB3(1),HNB3(2))=CH3PSP(HNB3(1),HNB3(2))-1;%removeevent(CH3PSP,y,'CH3PSP');
            if CH3PSP(HNB3(1),HNB3(2))==0
                NZE(16)=NZE(16)-1;
            end
        case(CH)
            CHDSP(HNB3(1),HNB3(2))=CHDSP(HNB3(1),HNB3(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(HNB3(1),HNB3(2))==1
                NZE(8)=NZE(8)+1;
            end
            CH2PSP(HNB3(1),HNB3(2))=CH2PSP(HNB3(1),HNB3(2))-1;%removeevent(CH2PSP,y,'CH2PSP');
            if CH2PSP(HNB3(1),HNB3(2))==0
                NZE(17)=NZE(17)-1;
            end
        case(C)
            CdiffusionSP(HNB3(1),HNB3(2))=CdiffusionSP(HNB3(1),HNB3(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(HNB3(1),HNB3(2))==1
                NZE(3)=NZE(3)+1;
            end
            CHPSP(HNB3(1),HNB3(2))=CHPSP(HNB3(1),HNB3(2))-1;%removeevent(CHPSP,y,'CHPSP');
            if CHPSP(HNB3(1),HNB3(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(C3)
            C3diffusionSP(HNB3(1),HNB3(2))=C3diffusionSP(HNB3(1),HNB3(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP');  
            if C3diffusionSP(HNB3(1),HNB3(2))==1
                NZE(4)=NZE(4)+1;
            end
    end
end

end

