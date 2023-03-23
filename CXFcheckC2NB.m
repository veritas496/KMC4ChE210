function [NZE,Conf,C3FSP,CXFSP]=CXFcheckC2NB(NZE,Conf,W,L,C,C3,C3FSP,CXFSP,CX1pickedup,C2pickedup,C2NBup,C2NBdown,C2NBleft,C2NBright)

if (C2NBup(2)<=L)&sum((C2NBup~=CX1pickedup).^2)~=0
    Checkspecies=Conf(C2NBup(1),C2NBup(2)); %check C2 neighbour

    switch (Checkspecies)
        case(C)
            C3FSP(C2pickedup(1),C2pickedup(2))=C3FSP(C2pickedup(1),C2pickedup(2))-1;
            if C3FSP(C2pickedup(1),C2pickedup(2))==0
                NZE(10)=NZE(10)-1;
            end
            CXFSP(C2pickedup(1),C2pickedup(2))=CXFSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(C2pickedup(1),C2pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C3)
            CXFSP(C2NBup(1),C2NBup(2))=CXFSP(C2NBup(1),C2NBup(2))-1;%removeevent(CXFSP,C2NB1,'CXFSP');
            if CXFSP(C2NBup(1),C2NBup(2))==0
                NZE(11)=NZE(11)-1;
            end
            CXFSP(C2pickedup(1),C2pickedup(2))=CXFSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CXFSP,x,'CXFSP'); 
            if CXFSP(C2pickedup(1),C2pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
    end
end

if (C2NBdown(2)>=1)&sum((C2NBdown~=CX1pickedup).^2)~=0
    Checkspecies=Conf(C2NBdown(1),C2NBdown(2)); %check C2 neighbour

    switch (Checkspecies)
        case(C)
            C3FSP(C2pickedup(1),C2pickedup(2))=C3FSP(C2pickedup(1),C2pickedup(2))-1;
            if C3FSP(C2pickedup(1),C2pickedup(2))==0
                NZE(10)=NZE(10)-1;
            end
            CXFSP(C2pickedup(1),C2pickedup(2))=CXFSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(C2pickedup(1),C2pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C3)
            CXFSP(C2NBdown(1),C2NBdown(2))=CXFSP(C2NBdown(1),C2NBdown(2))-1;%removeevent(CXFSP,C2NB1,'CXFSP');
            if CXFSP(C2NBdown(1),C2NBdown(2))==0
                NZE(11)=NZE(11)-1;
            end
            CXFSP(C2pickedup(1),C2pickedup(2))=CXFSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CXFSP,x,'CXFSP'); 
            if CXFSP(C2pickedup(1),C2pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
    end
end

if (C2NBleft(1)>=1)&sum((C2NBleft~=CX1pickedup).^2)~=0
    Checkspecies=Conf(C2NBleft(1),C2NBleft(2)); %check C2 neighbour

    switch (Checkspecies)
        case(C)
            C3FSP(C2pickedup(1),C2pickedup(2))=C3FSP(C2pickedup(1),C2pickedup(2))-1;
            if C3FSP(C2pickedup(1),C2pickedup(2))==0
                NZE(10)=NZE(10)-1;
            end
            CXFSP(C2pickedup(1),C2pickedup(2))=CXFSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(C2pickedup(1),C2pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C3)
            CXFSP(C2NBleft(1),C2NBleft(2))=CXFSP(C2NBleft(1),C2NBleft(2))-1;%removeevent(CXFSP,C2NB1,'CXFSP');
            if CXFSP(C2NBleft(1),C2NBleft(2))==0
                NZE(11)=NZE(11)-1;
            end
            CXFSP(C2pickedup(1),C2pickedup(2))=CXFSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CXFSP,x,'CXFSP'); 
            if CXFSP(C2pickedup(1),C2pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
    end
end

if (C2NBright(1)<=W)&sum((C2NBright~=CX1pickedup).^2)~=0
    Checkspecies=Conf(C2NBright(1),C2NBright(2)); %check C2 neighbour

    switch (Checkspecies)
        case(C)
            C3FSP(C2pickedup(1),C2pickedup(2))=C3FSP(C2pickedup(1),C2pickedup(2))-1;
            if C3FSP(C2pickedup(1),C2pickedup(2))==0
                NZE(10)=NZE(10)-1;
            end
            CXFSP(C2pickedup(1),C2pickedup(2))=CXFSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CXFSP,x,'CXFSP');
            if CXFSP(C2pickedup(1),C2pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C3)
            CXFSP(C2NBright(1),C2NBright(2))=CXFSP(C2NBright(1),C2NBright(2))-1;%removeevent(CXFSP,C2NB1,'CXFSP');
            if CXFSP(C2NBright(1),C2NBright(2))==0
                NZE(11)=NZE(11)-1;
            end
            CXFSP(C2pickedup(1),C2pickedup(2))=CXFSP(C2pickedup(1),C2pickedup(2))+1;%addevent(CXFSP,x,'CXFSP'); 
            if CXFSP(C2pickedup(1),C2pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
    end
end


end