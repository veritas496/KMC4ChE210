function CH2PcheckCHNB(x,y)
%x is CH3pickedup;y is one of its neighbour
global Conf H CH2DSP CH3PSP CHDSP NR

Checkspecies=Conf(y(1),y(2)); %check CH neighbour
    
    switch (Checkspecies)
        case(0)
            %addevent(CH2diffusionSP,x,'CH2diffusionSP');
            NR(3)=NR(3)+1;
            CH2DSP(x(1),x(2))=CH2DSP(x(1),x(2))+1;%addevent(CH2DSP,x,'CH2DSP');
            %removeevent(CHdiffusionSP,x,'CHdiffusionSP');
            NR(4)=NR(4)-1;
            CHDSP(x(1),x(2))=CHDSP(x(1),x(2))-1;%removeevent(CHDSP,x,'CHDSP');
        case(H)
            NR(8)=NR(8)+1;
            CH3PSP(x(1),x(2))=CH3PSP(x(1),x(2))+1;%addevent(CH3PSP,x,'CH3PSP');
    end
end