function [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,H2PSP]=CH4DcheckNB(NZE,Conf,W,L,H,CH3,CH2,CH,C,C3,...
    HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,H2PSP,...
    CH3pickedup,CH3NBup,CH3NBdown,CH3NBleft,CH3NBright,Hpickedup,HNBup,HNBdown,HNBleft,HNBright)  
%x is CH3pickedup;y is one of its neighbour
if (CH3NBup(2)<=L)&sum((CH3NBup-Hpickedup).^2)~=0
    Checkspecies=Conf(CH3NBup(1),CH3NBup(2)); %check CH3 neighbour
    
    switch (Checkspecies)
        case(0)
            CH3DSP(CH3pickedup(1),CH3pickedup(2))=CH3DSP(CH3pickedup(1),CH3pickedup(2))+1;%addevent(CH3DSP,x,'CH3DSP');%addCH3dissociation(x);
            if CH3DSP(CH3pickedup(1),CH3pickedup(2))==1
                NZE(6)=NZE(6)+1;
            end
            CH4DSP(CH3NBup(1),CH3NBup(2))=CH4DSP(CH3NBup(1),CH3NBup(2))-1;%removeevent(CH4DSP,y,'CH4DSP');%removeCH4dissociation(y);
            if CH4DSP(CH3NBup(1),CH3NBup(2))==0
                NZE(5)=NZE(5)-1;
            end
        case(H)
            CH4PSP(CH3pickedup(1),CH3pickedup(2))=CH4PSP(CH3pickedup(1),CH3pickedup(2))+1;%addevent(CH4PSP,x,'CH4PSP');%addCH4production(x);

            HdiffusionSP(CH3NBup(1),CH3NBup(2))=HdiffusionSP(CH3NBup(1),CH3NBup(2))-1;%removeHdiffusion(y); 
            if HdiffusionSP(CH3NBup(1),CH3NBup(2))==0
                NZE(1)=NZE(1)-1;
            end
        case(CH3)
            CH3DSP(CH3NBup(1),CH3NBup(2))=CH3DSP(CH3NBup(1),CH3NBup(2))-1;%removeCH3dissociatoin(y);
            if CH3DSP(CH3NBup(1),CH3NBup(2))==0
                NZE(6)=NZE(6)-1;
            end
        case(CH2)
            CH2DSP(CH3NBup(1),CH3NBup(2))=CH2DSP(CH3NBup(1),CH3NBup(2))-1;%removeCH2dissociation(y);
            if CH2DSP(CH3NBup(1),CH3NBup(2))==0
                NZE(7)=NZE(7)-1;
            end
        case(CH)
            CHDSP(CH3NBup(1),CH3NBup(2))=CHDSP(CH3NBup(1),CH3NBup(2))-1;%removeCHdissociation(y);
            if CHDSP(CH3NBup(1),CH3NBup(2))==0
                NZE(8)=NZE(8)-1;
            end
        case(C)
            CdiffusionSP(CH3NBup(1),CH3NBup(2))=CdiffusionSP(CH3NBup(1),CH3NBup(2))-1;%removeCdiffusion(y);
            if CdiffusionSP(CH3NBup(1),CH3NBup(2))==0
                NZE(3)=NZE(3)-1;
            end
        case(C3)
            C3diffusionSP(CH3NBup(1),CH3NBup(2))=C3diffusionSP(CH3NBup(1),CH3NBup(2))-1;%removeC3diffusion(y);    
            if C3diffusionSP(CH3NBup(1),CH3NBup(2))==0
                NZE(4)=NZE(4)-1;
            end
    end
end
    
if (CH3NBdown(2)>=1)&sum((CH3NBdown-Hpickedup).^2)~=0
    Checkspecies=Conf(CH3NBdown(1),CH3NBdown(2)); %check CH3 neighbour
    
    switch (Checkspecies)
        case(0)
            CH3DSP(CH3pickedup(1),CH3pickedup(2))=CH3DSP(CH3pickedup(1),CH3pickedup(2))+1;%addevent(CH3DSP,x,'CH3DSP');%addCH3dissociation(x);
            if CH3DSP(CH3pickedup(1),CH3pickedup(2))==1
                NZE(6)=NZE(6)+1;
            end
            CH4DSP(CH3NBdown(1),CH3NBdown(2))=CH4DSP(CH3NBdown(1),CH3NBdown(2))-1;%removeevent(CH4DSP,y,'CH4DSP');%removeCH4dissociation(y);
            if CH4DSP(CH3NBdown(1),CH3NBdown(2))==0
                NZE(5)=NZE(5)-1;
            end
        case(H)
            CH4PSP(CH3pickedup(1),CH3pickedup(2))=CH4PSP(CH3pickedup(1),CH3pickedup(2))+1;%addevent(CH4PSP,x,'CH4PSP');%addCH4production(x);

            HdiffusionSP(CH3NBdown(1),CH3NBdown(2))=HdiffusionSP(CH3NBdown(1),CH3NBdown(2))-1;%removeHdiffusion(y); 
            if HdiffusionSP(CH3NBdown(1),CH3NBdown(2))==0
                NZE(1)=NZE(1)-1;
            end
        case(CH3)
            CH3DSP(CH3NBdown(1),CH3NBdown(2))=CH3DSP(CH3NBdown(1),CH3NBdown(2))-1;%removeCH3dissociatoin(y);
            if CH3DSP(CH3NBdown(1),CH3NBdown(2))==0
                NZE(6)=NZE(6)-1;
            end
        case(CH2)
            CH2DSP(CH3NBdown(1),CH3NBdown(2))=CH2DSP(CH3NBdown(1),CH3NBdown(2))-1;%removeCH2dissociation(y);
            if CH2DSP(CH3NBdown(1),CH3NBdown(2))==0
                NZE(7)=NZE(7)-1;
            end
        case(CH)
            CHDSP(CH3NBdown(1),CH3NBdown(2))=CHDSP(CH3NBdown(1),CH3NBdown(2))-1;%removeCHdissociation(y);
            if CHDSP(CH3NBdown(1),CH3NBdown(2))==0
                NZE(8)=NZE(8)-1;
            end
        case(C)
            CdiffusionSP(CH3NBdown(1),CH3NBdown(2))=CdiffusionSP(CH3NBdown(1),CH3NBdown(2))-1;%removeCdiffusion(y);
            if CdiffusionSP(CH3NBdown(1),CH3NBdown(2))==0
                NZE(3)=NZE(3)-1;
            end
        case(C3)
            C3diffusionSP(CH3NBdown(1),CH3NBdown(2))=C3diffusionSP(CH3NBdown(1),CH3NBdown(2))-1;%removeC3diffusion(y);    
            if C3diffusionSP(CH3NBdown(1),CH3NBdown(2))==0
                NZE(4)=NZE(4)-1;
            end
    end
end

if (CH3NBleft(1)>=1)&sum((CH3NBleft~=Hpickedup).^2)~=0
    Checkspecies=Conf(CH3NBleft(1),CH3NBleft(2)); %check CH3 neighbour
    
    switch (Checkspecies)
        case(0)
            CH3DSP(CH3pickedup(1),CH3pickedup(2))=CH3DSP(CH3pickedup(1),CH3pickedup(2))+1;%addevent(CH3DSP,x,'CH3DSP');%addCH3dissociation(x);
            if CH3DSP(CH3pickedup(1),CH3pickedup(2))==1
                NZE(6)=NZE(6)+1;
            end
            CH4DSP(CH3NBleft(1),CH3NBleft(2))=CH4DSP(CH3NBleft(1),CH3NBleft(2))-1;%removeevent(CH4DSP,y,'CH4DSP');%removeCH4dissociation(y);
            if CH4DSP(CH3NBleft(1),CH3NBleft(2))==0
                NZE(5)=NZE(5)-1;
            end
        case(H)
            CH4PSP(CH3pickedup(1),CH3pickedup(2))=CH4PSP(CH3pickedup(1),CH3pickedup(2))+1;%addevent(CH4PSP,x,'CH4PSP');%addCH4production(x);

            HdiffusionSP(CH3NBleft(1),CH3NBleft(2))=HdiffusionSP(CH3NBleft(1),CH3NBleft(2))-1;%removeHdiffusion(y); 
            if HdiffusionSP(CH3NBleft(1),CH3NBleft(2))==0
                NZE(1)=NZE(1)-1;
            end
        case(CH3)
            CH3DSP(CH3NBleft(1),CH3NBleft(2))=CH3DSP(CH3NBleft(1),CH3NBleft(2))-1;%removeCH3dissociatoin(y);
            if CH3DSP(CH3NBleft(1),CH3NBleft(2))==0
                NZE(6)=NZE(6)-1;
            end
        case(CH2)
            CH2DSP(CH3NBleft(1),CH3NBleft(2))=CH2DSP(CH3NBleft(1),CH3NBleft(2))-1;%removeCH2dissociation(y);
            if CH2DSP(CH3NBleft(1),CH3NBleft(2))==0
                NZE(7)=NZE(7)-1;
            end
        case(CH)
            CHDSP(CH3NBleft(1),CH3NBleft(2))=CHDSP(CH3NBleft(1),CH3NBleft(2))-1;%removeCHdissociation(y);
            if CHDSP(CH3NBleft(1),CH3NBleft(2))==0
                NZE(8)=NZE(8)-1;
            end
        case(C)
            CdiffusionSP(CH3NBleft(1),CH3NBleft(2))=CdiffusionSP(CH3NBleft(1),CH3NBleft(2))-1;%removeCdiffusion(y);
            if CdiffusionSP(CH3NBleft(1),CH3NBleft(2))==0
                NZE(3)=NZE(3)-1;
            end
        case(C3)
            C3diffusionSP(CH3NBleft(1),CH3NBleft(2))=C3diffusionSP(CH3NBleft(1),CH3NBleft(2))-1;%removeC3diffusion(y);    
            if C3diffusionSP(CH3NBleft(1),CH3NBleft(2))==0
                NZE(4)=NZE(4)-1;
            end
    end
end

if (CH3NBright(1)<=W)&sum((CH3NBright~=Hpickedup).^2)~=0
    Checkspecies=Conf(CH3NBright(1),CH3NBright(2)); %check CH3 neighbour
    
    switch (Checkspecies)
        case(0)
            CH3DSP(CH3pickedup(1),CH3pickedup(2))=CH3DSP(CH3pickedup(1),CH3pickedup(2))+1;%addevent(CH3DSP,x,'CH3DSP');%addCH3dissociation(x);
            if CH3DSP(CH3pickedup(1),CH3pickedup(2))==1
                NZE(6)=NZE(6)+1;
            end
            CH4DSP(CH3NBright(1),CH3NBright(2))=CH4DSP(CH3NBright(1),CH3NBright(2))-1;%removeevent(CH4DSP,y,'CH4DSP');%removeCH4dissociation(y);
            if CH4DSP(CH3NBright(1),CH3NBright(2))==0
                NZE(5)=NZE(5)-1;
            end
        case(H)
            CH4PSP(CH3pickedup(1),CH3pickedup(2))=CH4PSP(CH3pickedup(1),CH3pickedup(2))+1;%addevent(CH4PSP,x,'CH4PSP');%addCH4production(x);

            HdiffusionSP(CH3NBright(1),CH3NBright(2))=HdiffusionSP(CH3NBright(1),CH3NBright(2))-1;%removeHdiffusion(y); 
            if HdiffusionSP(CH3NBright(1),CH3NBright(2))==0
                NZE(1)=NZE(1)-1;
            end
        case(CH3)
            CH3DSP(CH3NBright(1),CH3NBright(2))=CH3DSP(CH3NBright(1),CH3NBright(2))-1;%removeCH3dissociatoin(y);
            if CH3DSP(CH3NBright(1),CH3NBright(2))==0
                NZE(6)=NZE(6)-1;
            end
        case(CH2)
            CH2DSP(CH3NBright(1),CH3NBright(2))=CH2DSP(CH3NBright(1),CH3NBright(2))-1;%removeCH2dissociation(y);
            if CH2DSP(CH3NBright(1),CH3NBright(2))==0
                NZE(7)=NZE(7)-1;
            end
        case(CH)
            CHDSP(CH3NBright(1),CH3NBright(2))=CHDSP(CH3NBright(1),CH3NBright(2))-1;%removeCHdissociation(y);
            if CHDSP(CH3NBright(1),CH3NBright(2))==0
                NZE(8)=NZE(8)-1;
            end
        case(C)
            CdiffusionSP(CH3NBright(1),CH3NBright(2))=CdiffusionSP(CH3NBright(1),CH3NBright(2))-1;%removeCdiffusion(y);
            if CdiffusionSP(CH3NBright(1),CH3NBright(2))==0
                NZE(3)=NZE(3)-1;
            end
        case(C3)
            C3diffusionSP(CH3NBright(1),CH3NBright(2))=C3diffusionSP(CH3NBright(1),CH3NBright(2))-1;%removeC3diffusion(y);    
            if C3diffusionSP(CH3NBright(1),CH3NBright(2))==0
                NZE(4)=NZE(4)-1;
            end
    end
end

if (HNBup(2)<=L)&sum((HNBup~=CH3pickedup).^2)~=0
    Checkspecies=Conf(HNBup(1),HNBup(2)); %check H neighbour

    switch (Checkspecies)
        case(0)
            HdiffusionSP(Hpickedup(1),Hpickedup(2))=HdiffusionSP(Hpickedup(1),Hpickedup(2))+1;%addevent(HdiffusionSP,x,'HdiffusionSP');
            if HdiffusionSP(Hpickedup(1),Hpickedup(2))==1
                NZE(1)=NZE(1)+1;
            end
            CH4DSP(HNBup(1),HNBup(2))=CH4DSP(HNBup(1),HNBup(2))-1;%removeevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(HNBup(1),HNBup(2))==0
                NZE(5)=NZE(5)-1;
            end
        case(H)
            H2PSP(Hpickedup(1),Hpickedup(2))=H2PSP(Hpickedup(1),Hpickedup(2))+1;%addevent(H2PSP,x,'H2PSP');
            if H2PSP(Hpickedup(1),Hpickedup(2))==1
                NZE(12)=NZE(12)+1;
            end
            H2PSP(HNBup(1),HNBup(2))=H2PSP(HNBup(1),HNBup(2))+1;%addevent(H2PSP,y,'H2PSP');
            if H2PSP(HNBup(1),HNBup(2))==1
                NZE(12)=NZE(12)+1;
            end
            HdiffusionSP(HNBup(1),HNBup(2))=HdiffusionSP(HNBup(1),HNBup(2))-1;%removeevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(HNBup(1),HNBup(2))==0
                NZE(1)=NZE(1)-1;
            end 
        case(CH3)
            CH3DSP(HNBup(1),HNBup(2))=CH3DSP(HNBup(1),HNBup(2))-1;%removeevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(HNBup(1),HNBup(2))==0
                NZE(6)=NZE(6)-1;
            end
            CH4PSP(HNBup(1),HNBup(2))=CH4PSP(HNBup(1),HNBup(2))+1;%addevent(CH4PSP,y,'CH4PSP');
            if CH4PSP(HNBup(1),HNBup(2))==1
                NZE(15)=NZE(15)+1;
            end
        case(CH2)
            CH2DSP(HNBup(1),HNBup(2))=CH2DSP(HNBup(1),HNBup(2))-1;%removeevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(HNBup(1),HNBup(2))==0
                NZE(7)=NZE(7)-1;
            end
            CH3PSP(HNBup(1),HNBup(2))=CH3PSP(HNBup(1),HNBup(2))+1;%addevent(CH3PSP,y,'CH3PSP');
            if CH3PSP(HNBup(1),HNBup(2))==1
                NZE(16)=NZE(16)+1;
            end
        case(CH)
            CHDSP(HNBup(1),HNBup(2))=CHDSP(HNBup(1),HNBup(2))-1;%removeevent(CHDSP,y,'CHDSP');
            if CHDSP(HNBup(1),HNBup(2))==0
                NZE(8)=NZE(8)-1;
            end
            CH2PSP(HNBup(1),HNBup(2))=CH2PSP(HNBup(1),HNBup(2))+1;%addevent(CH2PSP,y,'CH2PSP');
            if CH2PSP(HNBup(1),HNBup(2))==1
                NZE(17)=NZE(17)+1;
            end
        case(C)
            CdiffusionSP(HNBup(1),HNBup(2))=CdiffusionSP(HNBup(1),HNBup(2))-1;%removeevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(HNBup(1),HNBup(2))==0
                NZE(3)=NZE(3)-1;
            end
            CHPSP(HNBup(1),HNBup(2))=CHPSP(HNBup(1),HNBup(2))+1;%addevent(CHPSP,y,'CHPSP');
            if CHPSP(HNBup(1),HNBup(2))==1
                NZE(18)=NZE(18)+1;
            end
        case(C3)
            C3diffusionSP(HNBup(1),HNBup(2))=C3diffusionSP(HNBup(1),HNBup(2))-1;%removeevent(C3diffusionSP,y,'C3diffusionSP');% 
            if C3diffusionSP(HNBup(1),HNBup(2))==0
                NZE(4)=NZE(4)-1;
            end
    end
end

if (HNBdown(2)>=1)&sum((HNBdown~=CH3pickedup).^2)~=0
    Checkspecies=Conf(HNBdown(1),HNBdown(2)); %check H neighbour

    switch (Checkspecies)
        case(0)
            HdiffusionSP(Hpickedup(1),Hpickedup(2))=HdiffusionSP(Hpickedup(1),Hpickedup(2))+1;%addevent(HdiffusionSP,x,'HdiffusionSP');
            if HdiffusionSP(Hpickedup(1),Hpickedup(2))==1
                NZE(1)=NZE(1)+1;
            end
            CH4DSP(HNBdown(1),HNBdown(2))=CH4DSP(HNBdown(1),HNBdown(2))-1;%removeevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(HNBdown(1),HNBdown(2))==0
                NZE(5)=NZE(5)-1;
            end
        case(H)
            H2PSP(Hpickedup(1),Hpickedup(2))=H2PSP(Hpickedup(1),Hpickedup(2))+1;%addevent(H2PSP,x,'H2PSP');
            if H2PSP(Hpickedup(1),Hpickedup(2))==1
                NZE(12)=NZE(12)+1;
            end
            H2PSP(HNBdown(1),HNBdown(2))=H2PSP(HNBdown(1),HNBdown(2))+1;%addevent(H2PSP,y,'H2PSP');
            if H2PSP(HNBdown(1),HNBdown(2))==1
                NZE(12)=NZE(12)+1;
            end
            HdiffusionSP(HNBdown(1),HNBdown(2))=HdiffusionSP(HNBdown(1),HNBdown(2))-1;%removeevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(HNBdown(1),HNBdown(2))==0
                NZE(1)=NZE(1)-1;
            end 
        case(CH3)
            CH3DSP(HNBdown(1),HNBdown(2))=CH3DSP(HNBdown(1),HNBdown(2))-1;%removeevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(HNBdown(1),HNBdown(2))==0
                NZE(6)=NZE(6)-1;
            end
            CH4PSP(HNBdown(1),HNBdown(2))=CH4PSP(HNBdown(1),HNBdown(2))+1;%addevent(CH4PSP,y,'CH4PSP');
            if CH4PSP(HNBdown(1),HNBdown(2))==1
                NZE(15)=NZE(15)+1;
            end
        case(CH2)
            CH2DSP(HNBdown(1),HNBdown(2))=CH2DSP(HNBdown(1),HNBdown(2))-1;%removeevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(HNBdown(1),HNBdown(2))==0
                NZE(7)=NZE(7)-1;
            end
            CH3PSP(HNBdown(1),HNBdown(2))=CH3PSP(HNBdown(1),HNBdown(2))+1;%addevent(CH3PSP,y,'CH3PSP');
            if CH3PSP(HNBdown(1),HNBdown(2))==1
                NZE(16)=NZE(16)+1;
            end
        case(CH)
            CHDSP(HNBdown(1),HNBdown(2))=CHDSP(HNBdown(1),HNBdown(2))-1;%removeevent(CHDSP,y,'CHDSP');
            if CHDSP(HNBdown(1),HNBdown(2))==0
                NZE(8)=NZE(8)-1;
            end
            CH2PSP(HNBdown(1),HNBdown(2))=CH2PSP(HNBdown(1),HNBdown(2))+1;%addevent(CH2PSP,y,'CH2PSP');
            if CH2PSP(HNBdown(1),HNBdown(2))==1
                NZE(17)=NZE(17)+1;
            end
        case(C)
            CdiffusionSP(HNBdown(1),HNBdown(2))=CdiffusionSP(HNBdown(1),HNBdown(2))-1;%removeevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(HNBdown(1),HNBdown(2))==0
                NZE(3)=NZE(3)-1;
            end
            CHPSP(HNBdown(1),HNBdown(2))=CHPSP(HNBdown(1),HNBdown(2))+1;%addevent(CHPSP,y,'CHPSP');
            if CHPSP(HNBdown(1),HNBdown(2))==1
                NZE(18)=NZE(18)+1;
            end
        case(C3)
            C3diffusionSP(HNBdown(1),HNBdown(2))=C3diffusionSP(HNBdown(1),HNBdown(2))-1;%removeevent(C3diffusionSP,y,'C3diffusionSP');% 
            if C3diffusionSP(HNBdown(1),HNBdown(2))==0
                NZE(4)=NZE(4)-1;
            end
    end
end
    
if (HNBleft(1)>=1)&sum((HNBleft~=CH3pickedup).^2)~=0
    Checkspecies=Conf(HNBleft(1),HNBleft(2)); %check H neighbour

    switch (Checkspecies)
        case(0)
            HdiffusionSP(Hpickedup(1),Hpickedup(2))=HdiffusionSP(Hpickedup(1),Hpickedup(2))+1;%addevent(HdiffusionSP,x,'HdiffusionSP');
            if HdiffusionSP(Hpickedup(1),Hpickedup(2))==1
                NZE(1)=NZE(1)+1;
            end
            CH4DSP(HNBleft(1),HNBleft(2))=CH4DSP(HNBleft(1),HNBleft(2))-1;%removeevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(HNBleft(1),HNBleft(2))==0
                NZE(5)=NZE(5)-1;
            end
        case(H)
            H2PSP(Hpickedup(1),Hpickedup(2))=H2PSP(Hpickedup(1),Hpickedup(2))+1;%addevent(H2PSP,x,'H2PSP');
            if H2PSP(Hpickedup(1),Hpickedup(2))==1
                NZE(12)=NZE(12)+1;
            end
            H2PSP(HNBleft(1),HNBleft(2))=H2PSP(HNBleft(1),HNBleft(2))+1;%addevent(H2PSP,y,'H2PSP');
            if H2PSP(HNBleft(1),HNBleft(2))==1
                NZE(12)=NZE(12)+1;
            end
            HdiffusionSP(HNBleft(1),HNBleft(2))=HdiffusionSP(HNBleft(1),HNBleft(2))-1;%removeevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(HNBleft(1),HNBleft(2))==0
                NZE(1)=NZE(1)-1;
            end 
        case(CH3)
            CH3DSP(HNBleft(1),HNBleft(2))=CH3DSP(HNBleft(1),HNBleft(2))-1;%removeevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(HNBleft(1),HNBleft(2))==0
                NZE(6)=NZE(6)-1;
            end
            CH4PSP(HNBleft(1),HNBleft(2))=CH4PSP(HNBleft(1),HNBleft(2))+1;%addevent(CH4PSP,y,'CH4PSP');
            if CH4PSP(HNBleft(1),HNBleft(2))==1
                NZE(15)=NZE(15)+1;
            end
        case(CH2)
            CH2DSP(HNBleft(1),HNBleft(2))=CH2DSP(HNBleft(1),HNBleft(2))-1;%removeevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(HNBleft(1),HNBleft(2))==0
                NZE(7)=NZE(7)-1;
            end
            CH3PSP(HNBleft(1),HNBleft(2))=CH3PSP(HNBleft(1),HNBleft(2))+1;%addevent(CH3PSP,y,'CH3PSP');
            if CH3PSP(HNBleft(1),HNBleft(2))==1
                NZE(16)=NZE(16)+1;
            end
        case(CH)
            CHDSP(HNBleft(1),HNBleft(2))=CHDSP(HNBleft(1),HNBleft(2))-1;%removeevent(CHDSP,y,'CHDSP');
            if CHDSP(HNBleft(1),HNBleft(2))==0
                NZE(8)=NZE(8)-1;
            end
            CH2PSP(HNBleft(1),HNBleft(2))=CH2PSP(HNBleft(1),HNBleft(2))+1;%addevent(CH2PSP,y,'CH2PSP');
            if CH2PSP(HNBleft(1),HNBleft(2))==1
                NZE(17)=NZE(17)+1;
            end
        case(C)
            CdiffusionSP(HNBleft(1),HNBleft(2))=CdiffusionSP(HNBleft(1),HNBleft(2))-1;%removeevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(HNBleft(1),HNBleft(2))==0
                NZE(3)=NZE(3)-1;
            end
            CHPSP(HNBleft(1),HNBleft(2))=CHPSP(HNBleft(1),HNBleft(2))+1;%addevent(CHPSP,y,'CHPSP');
            if CHPSP(HNBleft(1),HNBleft(2))==1
                NZE(18)=NZE(18)+1;
            end
        case(C3)
            C3diffusionSP(HNBleft(1),HNBleft(2))=C3diffusionSP(HNBleft(1),HNBleft(2))-1;%removeevent(C3diffusionSP,y,'C3diffusionSP');% 
            if C3diffusionSP(HNBleft(1),HNBleft(2))==0
                NZE(4)=NZE(4)-1;
            end
    end
end

if (HNBright(1)<=W)&sum((HNBright~=CH3pickedup).^2)~=0
    Checkspecies=Conf(HNBright(1),HNBright(2)); %check H neighbour

    switch (Checkspecies)
        case(0)
            HdiffusionSP(Hpickedup(1),Hpickedup(2))=HdiffusionSP(Hpickedup(1),Hpickedup(2))+1;%addevent(HdiffusionSP,x,'HdiffusionSP');
            if HdiffusionSP(Hpickedup(1),Hpickedup(2))==1
                NZE(1)=NZE(1)+1;
            end
            CH4DSP(HNBright(1),HNBright(2))=CH4DSP(HNBright(1),HNBright(2))-1;%removeevent(CH4DSP,y,'CH4DSP');
            if CH4DSP(HNBright(1),HNBright(2))==0
                NZE(5)=NZE(5)-1;
            end
        case(H)
            H2PSP(Hpickedup(1),Hpickedup(2))=H2PSP(Hpickedup(1),Hpickedup(2))+1;%addevent(H2PSP,x,'H2PSP');
            if H2PSP(Hpickedup(1),Hpickedup(2))==1
                NZE(12)=NZE(12)+1;
            end
            H2PSP(HNBright(1),HNBright(2))=H2PSP(HNBright(1),HNBright(2))+1;%addevent(H2PSP,y,'H2PSP');
            if H2PSP(HNBright(1),HNBright(2))==1
                NZE(12)=NZE(12)+1;
            end
            HdiffusionSP(HNBright(1),HNBright(2))=HdiffusionSP(HNBright(1),HNBright(2))-1;%removeevent(HdiffusionSP,y,'HdiffusionSP');
            if HdiffusionSP(HNBright(1),HNBright(2))==0
                NZE(1)=NZE(1)-1;
            end 
        case(CH3)
            CH3DSP(HNBright(1),HNBright(2))=CH3DSP(HNBright(1),HNBright(2))-1;%removeevent(CH3DSP,y,'CH3DSP');
            if CH3DSP(HNBright(1),HNBright(2))==0
                NZE(6)=NZE(6)-1;
            end
            CH4PSP(HNBright(1),HNBright(2))=CH4PSP(HNBright(1),HNBright(2))+1;%addevent(CH4PSP,y,'CH4PSP');
            if CH4PSP(HNBright(1),HNBright(2))==1
                NZE(15)=NZE(15)+1;
            end
        case(CH2)
            CH2DSP(HNBright(1),HNBright(2))=CH2DSP(HNBright(1),HNBright(2))-1;%removeevent(CH2DSP,y,'CH2DSP');
            if CH2DSP(HNBright(1),HNBright(2))==0
                NZE(7)=NZE(7)-1;
            end
            CH3PSP(HNBright(1),HNBright(2))=CH3PSP(HNBright(1),HNBright(2))+1;%addevent(CH3PSP,y,'CH3PSP');
            if CH3PSP(HNBright(1),HNBright(2))==1
                NZE(16)=NZE(16)+1;
            end
        case(CH)
            CHDSP(HNBright(1),HNBright(2))=CHDSP(HNBright(1),HNBright(2))-1;%removeevent(CHDSP,y,'CHDSP');
            if CHDSP(HNBright(1),HNBright(2))==0
                NZE(8)=NZE(8)-1;
            end
            CH2PSP(HNBright(1),HNBright(2))=CH2PSP(HNBright(1),HNBright(2))+1;%addevent(CH2PSP,y,'CH2PSP');
            if CH2PSP(HNBright(1),HNBright(2))==1
                NZE(17)=NZE(17)+1;
            end
        case(C)
            CdiffusionSP(HNBright(1),HNBright(2))=CdiffusionSP(HNBright(1),HNBright(2))-1;%removeevent(CdiffusionSP,y,'CdiffusionSP');
            if CdiffusionSP(HNBright(1),HNBright(2))==0
                NZE(3)=NZE(3)-1;
            end
            CHPSP(HNBright(1),HNBright(2))=CHPSP(HNBright(1),HNBright(2))+1;%addevent(CHPSP,y,'CHPSP');
            if CHPSP(HNBright(1),HNBright(2))==1
                NZE(18)=NZE(18)+1;
            end
        case(C3)
            C3diffusionSP(HNBright(1),HNBright(2))=C3diffusionSP(HNBright(1),HNBright(2))-1;%removeevent(C3diffusionSP,y,'C3diffusionSP');% 
            if C3diffusionSP(HNBright(1),HNBright(2))==0
                NZE(4)=NZE(4)-1;
            end
    end
end

end

