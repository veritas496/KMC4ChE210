
function [NZE,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=redefineCXFcheckCXNB(NZE,Conf,W,L,H,C,CH3,CH2,CH,C2,C3,...
    CX,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,...
    CX1pickedup,CX2pickedup,CXcheck2,CXNBup,CXNBdown,CXNBleft,CXNBright)


if CXNBup(2)<=L&sum((CXNBup~=CX1pickedup).^2)~=0&sum((CXNBup~=CX2pickedup).^2)~=0
    Checkspecies=Conf(CXNBup(1),CXNBup(2)); %check CX neighbour (this CX is transformed from a empty site)
    
    switch (Checkspecies)
        case(0)
            CH4DSP(CXcheck2(1),CXcheck2(2))=CH4DSP(CXcheck2(1),CXcheck2(2))-1;%removeevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(CXcheck2(1),CXcheck2(2))==0
                NZE(5)=NZE(5)-1;
            end  
            CH4DSP(CXNBup(1),CXNBup(2))=CH4DSP(CXNBup(1),CXNBup(2))-1;%removeevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(CXNBup(1),CXNBup(2))==0
                NZE(5)=NZE(5)-1;
            end            
        case(H)
            HdiffusionSP(CXNBup(1),CXNBup(2))=HdiffusionSP(CXNBup(1),CXNBup(2))-1;%removeevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(CXNBup(1),CXNBup(2))==0
                NZE(1)=NZE(1)-1;
            end
        case(CH3)
            CH3DSP(CXNBup(1),CXNBup(2))=CH3DSP(CXNBup(1),CXNBup(2))-1;%removeevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(CXNBup(1),CXNBup(2))==0
                NZE(6)=NZE(6)-1;
            end
        case(CH2)
            CH2DSP(CXNBup(1),CXNBup(2))=CH2DSP(CXNBup(1),CXNBup(2))-1;%removeevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(CXNBup(1),CXNBup(2))==0
                NZE(7)=NZE(7)-1;
            end
        case(CH)
            CHDSP(CXNBup(1),CXNBup(2))=CHDSP(CXNBup(1),CXNBup(2))-1;%removeevent(CHDSP,y,'CHDSP');
            if CHDSP(CXNBup(1),CXNBup(2))==0
                NZE(8)=NZE(8)-1;
            end
        case(C)
            CdiffusionSP(CXNBup(1),CXNBup(2))=CdiffusionSP(CXNBup(1),CXNBup(2))-1;%removeevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(CXNBup(1),CXNBup(2))==0
                NZE(3)=NZE(3)-1;
            end
            CXFSP(CXcheck2(1),CXcheck2(2))=CXFSP(CXcheck2(1),CXcheck2(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(CXcheck2(1),CXcheck2(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C2)

        case(C3)
            C3diffusionSP(CXNBup(1),CXNBup(2))=C3diffusionSP(CXNBup(1),CXNBup(2))-1;%removeevent(C3diffusionSP,y,'C3diffusionSP');
            if C3diffusionSP(CXNBup(1),CXNBup(2))==0
                NZE(4)=NZE(4)-1;
            end
            CXFSP(CXcheck2(1),CXcheck2(2))=CXFSP(CXcheck2(1),CXcheck2(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(CXcheck2(1),CXcheck2(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(CX)

    end
end

if CXNBdown(2)>=1&sum((CXNBdown~=CX1pickedup).^2)~=0&sum((CXNBdown~=CX2pickedup).^2)~=0
    Checkspecies=Conf(CXNBdown(1),CXNBdown(2)); %check CX neighbour (this CX is transformed from a empty site)
    
    switch (Checkspecies)
        case(0)
            CH4DSP(CXcheck2(1),CXcheck2(2))=CH4DSP(CXcheck2(1),CXcheck2(2))-1;%removeevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(CXcheck2(1),CXcheck2(2))==0
                NZE(5)=NZE(5)-1;
            end  
            CH4DSP(CXNBdown(1),CXNBdown(2))=CH4DSP(CXNBdown(1),CXNBdown(2))-1;%removeevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(CXNBdown(1),CXNBdown(2))==0
                NZE(5)=NZE(5)-1;
            end            
        case(H)
            HdiffusionSP(CXNBdown(1),CXNBdown(2))=HdiffusionSP(CXNBdown(1),CXNBdown(2))-1;%removeevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(CXNBdown(1),CXNBdown(2))==0
                NZE(1)=NZE(1)-1;
            end
        case(CH3)
            CH3DSP(CXNBdown(1),CXNBdown(2))=CH3DSP(CXNBdown(1),CXNBdown(2))-1;%removeevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(CXNBdown(1),CXNBdown(2))==0
                NZE(6)=NZE(6)-1;
            end
        case(CH2)
            CH2DSP(CXNBdown(1),CXNBdown(2))=CH2DSP(CXNBdown(1),CXNBdown(2))-1;%removeevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(CXNBdown(1),CXNBdown(2))==0
                NZE(7)=NZE(7)-1;
            end
        case(CH)
            CHDSP(CXNBdown(1),CXNBdown(2))=CHDSP(CXNBdown(1),CXNBdown(2))-1;%removeevent(CHDSP,y,'CHDSP');
            if CHDSP(CXNBdown(1),CXNBdown(2))==0
                NZE(8)=NZE(8)-1;
            end
        case(C)
            CdiffusionSP(CXNBdown(1),CXNBdown(2))=CdiffusionSP(CXNBdown(1),CXNBdown(2))-1;%removeevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(CXNBdown(1),CXNBdown(2))==0
                NZE(3)=NZE(3)-1;
            end
            CXFSP(CXcheck2(1),CXcheck2(2))=CXFSP(CXcheck2(1),CXcheck2(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(CXcheck2(1),CXcheck2(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C2)

        case(C3)
            C3diffusionSP(CXNBdown(1),CXNBdown(2))=C3diffusionSP(CXNBdown(1),CXNBdown(2))-1;%removeevent(C3diffusionSP,y,'C3diffusionSP');
            if C3diffusionSP(CXNBdown(1),CXNBdown(2))==0
                NZE(4)=NZE(4)-1;
            end
            CXFSP(CXcheck2(1),CXcheck2(2))=CXFSP(CXcheck2(1),CXcheck2(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(CXcheck2(1),CXcheck2(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(CX)

    end
end

if CXNBleft(1)>=1&sum((CXNBleft~=CX1pickedup).^2)~=0&sum((CXNBleft~=CX2pickedup).^2)~=0
    Checkspecies=Conf(CXNBleft(1),CXNBleft(2)); %check CX neighbour (this CX is transformed from a empty site)
    
    switch (Checkspecies)
        case(0)
            CH4DSP(CXcheck2(1),CXcheck2(2))=CH4DSP(CXcheck2(1),CXcheck2(2))-1;%removeevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(CXcheck2(1),CXcheck2(2))==0
                NZE(5)=NZE(5)-1;
            end  
            CH4DSP(CXNBleft(1),CXNBleft(2))=CH4DSP(CXNBleft(1),CXNBleft(2))-1;%removeevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(CXNBleft(1),CXNBleft(2))==0
                NZE(5)=NZE(5)-1;
            end            
        case(H)
            HdiffusionSP(CXNBleft(1),CXNBleft(2))=HdiffusionSP(CXNBleft(1),CXNBleft(2))-1;%removeevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(CXNBleft(1),CXNBleft(2))==0
                NZE(1)=NZE(1)-1;
            end
        case(CH3)
            CH3DSP(CXNBleft(1),CXNBleft(2))=CH3DSP(CXNBleft(1),CXNBleft(2))-1;%removeevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(CXNBleft(1),CXNBleft(2))==0
                NZE(6)=NZE(6)-1;
            end
        case(CH2)
            CH2DSP(CXNBleft(1),CXNBleft(2))=CH2DSP(CXNBleft(1),CXNBleft(2))-1;%removeevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(CXNBleft(1),CXNBleft(2))==0
                NZE(7)=NZE(7)-1;
            end
        case(CH)
            CHDSP(CXNBleft(1),CXNBleft(2))=CHDSP(CXNBleft(1),CXNBleft(2))-1;%removeevent(CHDSP,y,'CHDSP');
            if CHDSP(CXNBleft(1),CXNBleft(2))==0
                NZE(8)=NZE(8)-1;
            end
        case(C)
            CdiffusionSP(CXNBleft(1),CXNBleft(2))=CdiffusionSP(CXNBleft(1),CXNBleft(2))-1;%removeevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(CXNBleft(1),CXNBleft(2))==0
                NZE(3)=NZE(3)-1;
            end
            CXFSP(CXcheck2(1),CXcheck2(2))=CXFSP(CXcheck2(1),CXcheck2(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(CXcheck2(1),CXcheck2(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C2)

        case(C3)
            C3diffusionSP(CXNBleft(1),CXNBleft(2))=C3diffusionSP(CXNBleft(1),CXNBleft(2))-1;%removeevent(C3diffusionSP,y,'C3diffusionSP');
            if C3diffusionSP(CXNBleft(1),CXNBleft(2))==0
                NZE(4)=NZE(4)-1;
            end
            CXFSP(CXcheck2(1),CXcheck2(2))=CXFSP(CXcheck2(1),CXcheck2(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(CXcheck2(1),CXcheck2(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(CX)

    end
end

if CXNBright(1)<=W&sum((CXNBright~=CX1pickedup).^2)~=0&sum((CXNBright~=CX2pickedup).^2)~=0
    Checkspecies=Conf(CXNBright(1),CXNBright(2)); %check CX neighbour (this CX is transformed from a empty site)
    
    switch (Checkspecies)
        case(0)
            CH4DSP(CXcheck2(1),CXcheck2(2))=CH4DSP(CXcheck2(1),CXcheck2(2))-1;%removeevent(CH4DSP,x,'CH4DSP');
            if CH4DSP(CXcheck2(1),CXcheck2(2))==0
                NZE(5)=NZE(5)-1;
            end  
            CH4DSP(CXNBright(1),CXNBright(2))=CH4DSP(CXNBright(1),CXNBright(2))-1;%removeevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(CXNBright(1),CXNBright(2))==0
                NZE(5)=NZE(5)-1;
            end            
        case(H)
            HdiffusionSP(CXNBright(1),CXNBright(2))=HdiffusionSP(CXNBright(1),CXNBright(2))-1;%removeevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(CXNBright(1),CXNBright(2))==0
                NZE(1)=NZE(1)-1;
            end
        case(CH3)
            CH3DSP(CXNBright(1),CXNBright(2))=CH3DSP(CXNBright(1),CXNBright(2))-1;%removeevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(CXNBright(1),CXNBright(2))==0
                NZE(6)=NZE(6)-1;
            end
        case(CH2)
            CH2DSP(CXNBright(1),CXNBright(2))=CH2DSP(CXNBright(1),CXNBright(2))-1;%removeevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(CXNBright(1),CXNBright(2))==0
                NZE(7)=NZE(7)-1;
            end
        case(CH)
            CHDSP(CXNBright(1),CXNBright(2))=CHDSP(CXNBright(1),CXNBright(2))-1;%removeevent(CHDSP,y,'CHDSP');
            if CHDSP(CXNBright(1),CXNBright(2))==0
                NZE(8)=NZE(8)-1;
            end
        case(C)
            CdiffusionSP(CXNBright(1),CXNBright(2))=CdiffusionSP(CXNBright(1),CXNBright(2))-1;%removeevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(CXNBright(1),CXNBright(2))==0
                NZE(3)=NZE(3)-1;
            end
            CXFSP(CXcheck2(1),CXcheck2(2))=CXFSP(CXcheck2(1),CXcheck2(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(CXcheck2(1),CXcheck2(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C2)

        case(C3)
            C3diffusionSP(CXNBright(1),CXNBright(2))=C3diffusionSP(CXNBright(1),CXNBright(2))-1;%removeevent(C3diffusionSP,y,'C3diffusionSP');
            if C3diffusionSP(CXNBright(1),CXNBright(2))==0
                NZE(4)=NZE(4)-1;
            end
            CXFSP(CXcheck2(1),CXcheck2(2))=CXFSP(CXcheck2(1),CXcheck2(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(CXcheck2(1),CXcheck2(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(CX)

    end
end

end