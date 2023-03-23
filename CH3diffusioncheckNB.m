function [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
    HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,CH3NB1,CH3NB2,CH3NB3,...
    EPpickedup,EPNB1,EPNB2,EPNB3)
%x is CH3pickedup;y is one of its neighbour

Checkspecies=Conf(CH3NB1(1),CH3NB1(2)); %check CH3 neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(CH3pickedup(1),CH3pickedup(2))=CH4DSP(CH3pickedup(1),CH3pickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(CH3pickedup(1),CH3pickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(CH3NB1(1),CH3NB1(2))=CH4DSP(CH3NB1(1),CH3NB1(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(CH3NB1(1),CH3NB1(2))==1
                NZE(5)=NZE(5)+1;
            end

        case(H)
            HdiffusionSP(CH3NB1(1),CH3NB1(2))=HdiffusionSP(CH3NB1(1),CH3NB1(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(CH3NB1(1),CH3NB1(2))==1
                NZE(1)=NZE(1)+1;
            end
            CH4PSP(CH3pickedup(1),CH3pickedup(2))=CH4PSP(CH3pickedup(1),CH3pickedup(2))-1;%removeevent(CH4PSP,x,'CH4PSP');
            if CH4PSP(CH3pickedup(1),CH3pickedup(2))==0
                NZE(15)=NZE(15)-1;
            end
        case(CH3)
            CH3DSP(CH3NB1(1),CH3NB1(2))=CH3DSP(CH3NB1(1),CH3NB1(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(CH3NB1(1),CH3NB1(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH2DSP(CH3NB1(1),CH3NB1(2))=CH2DSP(CH3NB1(1),CH3NB1(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(CH3NB1(1),CH3NB1(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CHDSP(CH3NB1(1),CH3NB1(2))=CHDSP(CH3NB1(1),CH3NB1(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(CH3NB1(1),CH3NB1(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CdiffusionSP(CH3NB1(1),CH3NB1(2))=CdiffusionSP(CH3NB1(1),CH3NB1(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(CH3NB1(1),CH3NB1(2))==1
                NZE(3)=NZE(3)+1;
            end
        case(C3)
            C3diffusionSP(CH3NB1(1),CH3NB1(2))=C3diffusionSP(CH3NB1(1),CH3NB1(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP');  
            if C3diffusionSP(CH3NB1(1),CH3NB1(2))==1
                NZE(4)=NZE(4)+1;
            end
    end
    
if CH3NB2~=0
    Checkspecies=Conf(CH3NB2(1),CH3NB2(2)); %check CH3 neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(CH3pickedup(1),CH3pickedup(2))=CH4DSP(CH3pickedup(1),CH3pickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(CH3pickedup(1),CH3pickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(CH3NB2(1),CH3NB2(2))=CH4DSP(CH3NB2(1),CH3NB2(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(CH3NB2(1),CH3NB2(2))==1
                NZE(5)=NZE(5)+1;
            end

        case(H)
            HdiffusionSP(CH3NB2(1),CH3NB2(2))=HdiffusionSP(CH3NB2(1),CH3NB2(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(CH3NB2(1),CH3NB2(2))==1
                NZE(1)=NZE(1)+1;
            end
            CH4PSP(CH3pickedup(1),CH3pickedup(2))=CH4PSP(CH3pickedup(1),CH3pickedup(2))-1;%removeevent(CH4PSP,x,'CH4PSP');
            if CH4PSP(CH3pickedup(1),CH3pickedup(2))==0
                NZE(15)=NZE(15)-1;
            end
        case(CH3)
            CH3DSP(CH3NB2(1),CH3NB2(2))=CH3DSP(CH3NB2(1),CH3NB2(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(CH3NB2(1),CH3NB2(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH2DSP(CH3NB2(1),CH3NB2(2))=CH2DSP(CH3NB2(1),CH3NB2(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(CH3NB2(1),CH3NB2(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CHDSP(CH3NB2(1),CH3NB2(2))=CHDSP(CH3NB2(1),CH3NB2(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(CH3NB2(1),CH3NB2(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CdiffusionSP(CH3NB2(1),CH3NB2(2))=CdiffusionSP(CH3NB2(1),CH3NB2(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(CH3NB2(1),CH3NB2(2))==1
                NZE(3)=NZE(3)+1;
            end
        case(C3)
            C3diffusionSP(CH3NB2(1),CH3NB2(2))=C3diffusionSP(CH3NB2(1),CH3NB2(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP');  
            if C3diffusionSP(CH3NB2(1),CH3NB2(2))==1
                NZE(4)=NZE(4)+1;
            end
    end
end

if CH3NB3~=0
    Checkspecies=Conf(CH3NB3(1),CH3NB3(2)); %check CH3 neighbour
    
    switch (Checkspecies)
        case(0)
            CH4DSP(CH3pickedup(1),CH3pickedup(2))=CH4DSP(CH3pickedup(1),CH3pickedup(2))+1;%addevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(CH3pickedup(1),CH3pickedup(2))==1
                NZE(5)=NZE(5)+1;
            end
            CH4DSP(CH3NB3(1),CH3NB3(2))=CH4DSP(CH3NB3(1),CH3NB3(2))+1;%addevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(CH3NB3(1),CH3NB3(2))==1
                NZE(5)=NZE(5)+1;
            end

        case(H)
            HdiffusionSP(CH3NB3(1),CH3NB3(2))=HdiffusionSP(CH3NB3(1),CH3NB3(2))+1;%addevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(CH3NB3(1),CH3NB3(2))==1
                NZE(1)=NZE(1)+1;
            end
            CH4PSP(CH3pickedup(1),CH3pickedup(2))=CH4PSP(CH3pickedup(1),CH3pickedup(2))-1;%removeevent(CH4PSP,x,'CH4PSP');
            if CH4PSP(CH3pickedup(1),CH3pickedup(2))==0
                NZE(15)=NZE(15)-1;
            end
        case(CH3)
            CH3DSP(CH3NB3(1),CH3NB3(2))=CH3DSP(CH3NB3(1),CH3NB3(2))+1;%addevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(CH3NB3(1),CH3NB3(2))==1
                NZE(6)=NZE(6)+1;
            end
        case(CH2)
            CH2DSP(CH3NB3(1),CH3NB3(2))=CH2DSP(CH3NB3(1),CH3NB3(2))+1;%addevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(CH3NB3(1),CH3NB3(2))==1
                NZE(7)=NZE(7)+1;
            end
        case(CH)
            CHDSP(CH3NB3(1),CH3NB3(2))=CHDSP(CH3NB3(1),CH3NB3(2))+1;%addevent(CHDSP,y,'CHDSP');
            if CHDSP(CH3NB3(1),CH3NB3(2))==1
                NZE(8)=NZE(8)+1;
            end
        case(C)
            CdiffusionSP(CH3NB3(1),CH3NB3(2))=CdiffusionSP(CH3NB3(1),CH3NB3(2))+1;%addevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(CH3NB3(1),CH3NB3(2))==1
                NZE(3)=NZE(3)+1;
            end
        case(C3)
            C3diffusionSP(CH3NB3(1),CH3NB3(2))=C3diffusionSP(CH3NB3(1),CH3NB3(2))+1;%addevent(C3diffusionSP,y,'C3diffusionSP');  
            if C3diffusionSP(CH3NB3(1),CH3NB3(2))==1
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
            CH3DSP(EPpickedup(1),EPpickedup(2))=CH3DSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CH3DSP,x,'CH3DSP');

        case(H)
            HdiffusionSP(EPNB1(1),EPNB1(2))=HdiffusionSP(EPNB1(1),EPNB1(2))-1;%removeevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(EPNB1(1),EPNB1(2))==0
                NZE(1)=NZE(1)-1;
            end
            CH4PSP(EPpickedup(1),EPpickedup(2))=CH4PSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CH4PSP,x,'CH4PSP');
            if CH4PSP(EPpickedup(1),EPpickedup(2))==1
                NZE(15)=NZE(15)+1;
            end
        case(CH3)
            CH3DSP(EPNB1(1),EPNB1(2))=CH3DSP(EPNB1(1),EPNB1(2))-1;%removeevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(EPNB1(1),EPNB1(2))==0
                NZE(6)=NZE(6)-1;
            end
        case(CH2)
            CH2DSP(EPNB1(1),EPNB1(2))=CH2DSP(EPNB1(1),EPNB1(2))-1;%removeevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(EPNB1(1),EPNB1(2))==0
                NZE(7)=NZE(7)-1;
            end 
        case(CH)
            CHDSP(EPNB1(1),EPNB1(2))=CHDSP(EPNB1(1),EPNB1(2))-1;%removeevent(CHDSP,y,'CHDSP');
            if CHDSP(EPNB1(1),EPNB1(2))==0
                NZE(8)=NZE(8)-1;
            end
        case(C)
            CdiffusionSP(EPNB1(1),EPNB1(2))=CdiffusionSP(EPNB1(1),EPNB1(2))-1;%removeevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(EPNB1(1),EPNB1(2))==0
                NZE(3)=NZE(3)-1;
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
            CH4DSP(EPNB2(1),EPNB2(2))=CH4DSP(EPNB2(1),EPNB2(2))-1;%removeevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(EPNB2(1),EPNB2(2))==0
                NZE(5)=NZE(5)-1;
            end
            CH3DSP(EPpickedup(1),EPpickedup(2))=CH3DSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CH3DSP,x,'CH3DSP');

        case(H)
            HdiffusionSP(EPNB2(1),EPNB2(2))=HdiffusionSP(EPNB2(1),EPNB2(2))-1;%removeevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(EPNB2(1),EPNB2(2))==0
                NZE(1)=NZE(1)-1;
            end
            CH4PSP(EPpickedup(1),EPpickedup(2))=CH4PSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CH4PSP,x,'CH4PSP');
            if CH4PSP(EPpickedup(1),EPpickedup(2))==1
                NZE(15)=NZE(15)+1;
            end
        case(CH3)
            CH3DSP(EPNB2(1),EPNB2(2))=CH3DSP(EPNB2(1),EPNB2(2))-1;%removeevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(EPNB2(1),EPNB2(2))==0
                NZE(6)=NZE(6)-1;
            end
        case(CH2)
            CH2DSP(EPNB2(1),EPNB2(2))=CH2DSP(EPNB2(1),EPNB2(2))-1;%removeevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(EPNB2(1),EPNB2(2))==0
                NZE(7)=NZE(7)-1;
            end 
        case(CH)
            CHDSP(EPNB2(1),EPNB2(2))=CHDSP(EPNB2(1),EPNB2(2))-1;%removeevent(CHDSP,y,'CHDSP');
            if CHDSP(EPNB2(1),EPNB2(2))==0
                NZE(8)=NZE(8)-1;
            end
        case(C)
            CdiffusionSP(EPNB2(1),EPNB2(2))=CdiffusionSP(EPNB2(1),EPNB2(2))-1;%removeevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(EPNB2(1),EPNB2(2))==0
                NZE(3)=NZE(3)-1;
            end
        case(C3)
            C3diffusionSP(EPNB2(1),EPNB2(2))=C3diffusionSP(EPNB2(1),EPNB2(2))-1;%removeevent(C3diffusionSP,y,'C3diffusionSP');
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
            CH4DSP(EPNB3(1),EPNB3(2))=CH4DSP(EPNB3(1),EPNB3(2))-1;%removeevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(EPNB3(1),EPNB3(2))==0
                NZE(5)=NZE(5)-1;
            end
            CH3DSP(EPpickedup(1),EPpickedup(2))=CH3DSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CH3DSP,x,'CH3DSP');

        case(H)
            HdiffusionSP(EPNB3(1),EPNB3(2))=HdiffusionSP(EPNB3(1),EPNB3(2))-1;%removeevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(EPNB3(1),EPNB3(2))==0
                NZE(1)=NZE(1)-1;
            end
            CH4PSP(EPpickedup(1),EPpickedup(2))=CH4PSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CH4PSP,x,'CH4PSP');
            if CH4PSP(EPpickedup(1),EPpickedup(2))==1
                NZE(15)=NZE(15)+1;
            end
        case(CH3)
            CH3DSP(EPNB3(1),EPNB3(2))=CH3DSP(EPNB3(1),EPNB3(2))-1;%removeevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(EPNB3(1),EPNB3(2))==0
                NZE(6)=NZE(6)-1;
            end
        case(CH2)
            CH2DSP(EPNB3(1),EPNB3(2))=CH2DSP(EPNB3(1),EPNB3(2))-1;%removeevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(EPNB3(1),EPNB3(2))==0
                NZE(7)=NZE(7)-1;
            end 
        case(CH)
            CHDSP(EPNB3(1),EPNB3(2))=CHDSP(EPNB3(1),EPNB3(2))-1;%removeevent(CHDSP,y,'CHDSP');
            if CHDSP(EPNB3(1),EPNB3(2))==0
                NZE(8)=NZE(8)-1;
            end
        case(C)
            CdiffusionSP(EPNB3(1),EPNB3(2))=CdiffusionSP(EPNB3(1),EPNB3(2))-1;%removeevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(EPNB3(1),EPNB3(2))==0
                NZE(3)=NZE(3)-1;
            end
        case(C3)
            C3diffusionSP(EPNB3(1),EPNB3(2))=C3diffusionSP(EPNB3(1),EPNB3(2))-1;%removeevent(C3diffusionSP,y,'C3diffusionSP');
            if C3diffusionSP(EPNB3(1),EPNB3(2))==0
                NZE(4)=NZE(4)-1;
            end
    end
end
end