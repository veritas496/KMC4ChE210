function [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                        CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,CH2NB1,CH2NB2,CH2NB3,Hpickedup,HNB1,HNB2,HNB3) 

Checkspecies=Conf(CH2NB1(1),CH2NB1(2)); %check CH2  neighbour
    
    switch (Checkspecies)
        case(0)
            
            CH3DSP(CH2NB1(1),CH2NB1(2))=CH3DSP(CH2NB1(1),CH2NB1(2))+1;%addevent(CH3DSP,x,'CH3DSP');
            if CH3DSP(CH2NB1(1),CH2NB1(2))==1
                NZE(2)=NZE(2)+1;
            end
            
            CH2DSP(CH2NB1(1),CH2NB1(2))=CH2DSP(CH2NB1(1),CH2NB1(2))-1;%removeevent(CH2DSP,x,'CH2DSP');
            if CH2DSP(CH2NB1(1),CH2NB1(2))==0
                NZE(3)=NZE(3)-1;
            end

        case(H)
             
            CH4PSP(CH2NB1(1),CH2NB1(2))=CH4PSP(CH2NB1(1),CH2NB1(2))+1;%addevent(CH4PSP,x,'CH4PSP');
            if CH4PSP(CH2NB1(1),CH2NB1(2))==1
                NZE(7)=NZE(7)+1;
            end
    end
end

