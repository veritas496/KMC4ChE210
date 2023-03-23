function [NZE,Conf,CHPSP,C2FSP,C3FSP,CXFSP,CdiffusionSP]=rdCXFcheckCNB(NZE,Conf,W,L,H,C,C2,C3,CX,CHPSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,CX1pickedup,Cpickedup,CNBup,CNBdown,CNBleft,CNBright)
%x is C1pickedup;y is one of its neighbour

if (CNBup(2)<=L)&sum((CNBup~=CX1pickedup).^2)~=0
    Checkspecies=Conf(CNBup(1),CNBup(2)); %check C neighbour
    
    switch (Checkspecies)
        %case(0)

        case(H)
            CHPSP(Cpickedup(1),Cpickedup(2))=CHPSP(Cpickedup(1),Cpickedup(2))-1;%removeevent(CHPSP,x,'CHPSP');
            if CHPSP(Cpickedup(1),Cpickedup(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(C)
            C2FSP(Cpickedup(1),Cpickedup(2))=C2FSP(Cpickedup(1),Cpickedup(2))-1;
            if C2FSP(Cpickedup(1),Cpickedup(2))==0
                NZE(9)=NZE(9)-1;
            end
            C2FSP(CNBup(1),CNBup(2))=C2FSP(CNBup(1),CNBup(2))-1;%removeevent(C2FSP,y,'C2FSP');
            if C2FSP(CNBup(1),CNBup(2))==0
                NZE(9)=NZE(9)-1;
            end
            CXFSP(Cpickedup(1),Cpickedup(2))=CXFSP(Cpickedup(1),Cpickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(Cpickedup(1),Cpickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C2)
            C3FSP(CNBup(1),CNBup(2))=C3FSP(CNBup(1),CNBup(2))-1;%removeevent(C3FSP,y,'C3FSP');
            if C3FSP(CNBup(1),CNBup(2))==0
                NZE(10)=NZE(10)-1;
            end
        case(C3)
            CXFSP(CNBup(1),CNBup(2))=CXFSP(CNBup(1),CNBup(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(CNBup(1),CNBup(2))==0
                NZE(11)=NZE(11)-1;
            end
            CXFSP(Cpickedup(1),Cpickedup(2))=CXFSP(Cpickedup(1),Cpickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(Cpickedup(1),Cpickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(CX)
            CXFSP(CNBup(1),CNBup(2))=CXFSP(CNBup(1),CNBup(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(CNBup(1),CNBup(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end

if (CNBdown(2)>=1)&sum((CNBdown~=CX1pickedup).^2)~=0
    Checkspecies=Conf(CNBdown(1),CNBdown(2)); %check C neighbour
    
    switch (Checkspecies)
        %case(0)

        case(H)
            CHPSP(Cpickedup(1),Cpickedup(2))=CHPSP(Cpickedup(1),Cpickedup(2))-1;%removeevent(CHPSP,x,'CHPSP');
            if CHPSP(Cpickedup(1),Cpickedup(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(C)
            C2FSP(Cpickedup(1),Cpickedup(2))=C2FSP(Cpickedup(1),Cpickedup(2))-1;
            if C2FSP(Cpickedup(1),Cpickedup(2))==0
                NZE(9)=NZE(9)-1;
            end
            C2FSP(CNBdown(1),CNBdown(2))=C2FSP(CNBdown(1),CNBdown(2))-1;%removeevent(C2FSP,y,'C2FSP');
            if C2FSP(CNBdown(1),CNBdown(2))==0
                NZE(9)=NZE(9)-1;
            end
            CXFSP(Cpickedup(1),Cpickedup(2))=CXFSP(Cpickedup(1),Cpickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(Cpickedup(1),Cpickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C2)
            C3FSP(CNBdown(1),CNBdown(2))=C3FSP(CNBdown(1),CNBdown(2))-1;%removeevent(C3FSP,y,'C3FSP');
            if C3FSP(CNBdown(1),CNBdown(2))==0
                NZE(10)=NZE(10)-1;
            end
        case(C3)
            CXFSP(CNBdown(1),CNBdown(2))=CXFSP(CNBdown(1),CNBdown(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(CNBdown(1),CNBdown(2))==0
                NZE(11)=NZE(11)-1;
            end
            CXFSP(Cpickedup(1),Cpickedup(2))=CXFSP(Cpickedup(1),Cpickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(Cpickedup(1),Cpickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(CX)
            CXFSP(CNBdown(1),CNBdown(2))=CXFSP(CNBdown(1),CNBdown(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(CNBdown(1),CNBdown(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end

if (CNBleft(1)>=1)&sum((CNBleft~=CX1pickedup).^2)~=0
    Checkspecies=Conf(CNBleft(1),CNBleft(2)); %check C neighbour
    
    switch (Checkspecies)
        %case(0)

        case(H)
            CHPSP(Cpickedup(1),Cpickedup(2))=CHPSP(Cpickedup(1),Cpickedup(2))-1;%removeevent(CHPSP,x,'CHPSP');
            if CHPSP(Cpickedup(1),Cpickedup(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(C)
            C2FSP(Cpickedup(1),Cpickedup(2))=C2FSP(Cpickedup(1),Cpickedup(2))-1;
            if C2FSP(Cpickedup(1),Cpickedup(2))==0
                NZE(9)=NZE(9)-1;
            end
            C2FSP(CNBleft(1),CNBleft(2))=C2FSP(CNBleft(1),CNBleft(2))-1;%removeevent(C2FSP,y,'C2FSP');
            if C2FSP(CNBleft(1),CNBleft(2))==0
                NZE(9)=NZE(9)-1;
            end
            CXFSP(Cpickedup(1),Cpickedup(2))=CXFSP(Cpickedup(1),Cpickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(Cpickedup(1),Cpickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C2)
            C3FSP(CNBleft(1),CNBleft(2))=C3FSP(CNBleft(1),CNBleft(2))-1;%removeevent(C3FSP,y,'C3FSP');
            if C3FSP(CNBleft(1),CNBleft(2))==0
                NZE(10)=NZE(10)-1;
            end
        case(C3)
            CXFSP(CNBleft(1),CNBleft(2))=CXFSP(CNBleft(1),CNBleft(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(CNBleft(1),CNBleft(2))==0
                NZE(11)=NZE(11)-1;
            end
            CXFSP(Cpickedup(1),Cpickedup(2))=CXFSP(Cpickedup(1),Cpickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(Cpickedup(1),Cpickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(CX)
            CXFSP(CNBleft(1),CNBleft(2))=CXFSP(CNBleft(1),CNBleft(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(CNBleft(1),CNBleft(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end
    
    
if (CNBright(1)<=W)&sum((CNBright~=CX1pickedup).^2)~=0
    Checkspecies=Conf(CNBright(1),CNBright(2)); %check C neighbour
    
    switch (Checkspecies)
        %case(0)

        case(H)
            CHPSP(Cpickedup(1),Cpickedup(2))=CHPSP(Cpickedup(1),Cpickedup(2))-1;%removeevent(CHPSP,x,'CHPSP');
            if CHPSP(Cpickedup(1),Cpickedup(2))==0
                NZE(18)=NZE(18)-1;
            end
        case(C)
            C2FSP(Cpickedup(1),Cpickedup(2))=C2FSP(Cpickedup(1),Cpickedup(2))-1;
            if C2FSP(Cpickedup(1),Cpickedup(2))==0
                NZE(9)=NZE(9)-1;
            end
            C2FSP(CNBright(1),CNBright(2))=C2FSP(CNBright(1),CNBright(2))-1;%removeevent(C2FSP,y,'C2FSP');
            if C2FSP(CNBright(1),CNBright(2))==0
                NZE(9)=NZE(9)-1;
            end
            CXFSP(Cpickedup(1),Cpickedup(2))=CXFSP(Cpickedup(1),Cpickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(Cpickedup(1),Cpickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C2)
            C3FSP(CNBright(1),CNBright(2))=C3FSP(CNBright(1),CNBright(2))-1;%removeevent(C3FSP,y,'C3FSP');
            if C3FSP(CNBright(1),CNBright(2))==0
                NZE(10)=NZE(10)-1;
            end
        case(C3)
            CXFSP(CNBright(1),CNBright(2))=CXFSP(CNBright(1),CNBright(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(CNBright(1),CNBright(2))==0
                NZE(11)=NZE(11)-1;
            end
            CXFSP(Cpickedup(1),Cpickedup(2))=CXFSP(Cpickedup(1),Cpickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(Cpickedup(1),Cpickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(CX)
            CXFSP(CNBright(1),CNBright(2))=CXFSP(CNBright(1),CNBright(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(CNBright(1),CNBright(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end

end