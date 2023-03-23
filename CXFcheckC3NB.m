function [NZE,Conf,CXFSP,C3diffusionSP]=CXFcheckC3NB(NZE,Conf,W,L,C,C2,C3,CX,CXFSP,C3diffusionSP,C3pickedup,CX2pickedup,C3NBup,C3NBdown,C3NBleft,C3NBright)
%x is C1pickedup;y is one of its neighbour

if (C3NBup(2)<=L)&sum((C3NBup~=CX2pickedup).^2)~=0
    Checkspecies=Conf(C3NBup(1),C3NBup(2)); %check C3 neighbour
    
    switch (Checkspecies)
        case(0)
            C3diffusionSP(C3pickedup(1),C3pickedup(2))=C3diffusionSP(C3pickedup(1),C3pickedup(2))-1;
            if C3diffusionSP(C3pickedup(1),C3pickedup(2))==0
                NZE(4)=NZE(4)-1;
            end
        case(C)
            CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))+1;%addevent(CXFSP,C3pickedup,'CXFSP');
            if CXFSP(C3pickedup(1),C3pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C2)
            %CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))-1;%addevent(CXFSP,x,'CXFSP');
 
        case(C3)
            CXFSP(C3NBup(1),C3NBup(2))=CXFSP(C3NBup(1),C3NBup(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C3NBup(1),C3NBup(2))==0
                NZE(11)=NZE(11)-1;
            end
            CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))+1;%addevent(CXFSP,C3pickedup,'CXFSP');
            if CXFSP(C3pickedup(1),C3pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(CX)
            CXFSP(C3NBup(1),C3NBup(2))=CXFSP(C3NBup(1),C3NBup(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C3NBup(1),C3NBup(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end

if (C3NBdown(2)>=1)&sum((C3NBdown~=CX2pickedup).^2)~=0
    Checkspecies=Conf(C3NBdown(1),C3NBdown(2)); %check C3 neighbour
    
    switch (Checkspecies)
        case(0)
            C3diffusionSP(C3pickedup(1),C3pickedup(2))=C3diffusionSP(C3pickedup(1),C3pickedup(2))-1;
            if C3diffusionSP(C3pickedup(1),C3pickedup(2))==0
                NZE(4)=NZE(4)-1;
            end
        case(C)
            CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))+1;%addevent(CXFSP,C3pickedup,'CXFSP');
            if CXFSP(C3pickedup(1),C3pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C2)
            %CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))-1;%addevent(CXFSP,x,'CXFSP');
 
        case(C3)
            CXFSP(C3NBdown(1),C3NBdown(2))=CXFSP(C3NBdown(1),C3NBdown(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C3NBdown(1),C3NBdown(2))==0
                NZE(11)=NZE(11)-1;
            end
            CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))+1;%addevent(CXFSP,C3pickedup,'CXFSP');
            if CXFSP(C3pickedup(1),C3pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(CX)
            CXFSP(C3NBdown(1),C3NBdown(2))=CXFSP(C3NBdown(1),C3NBdown(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C3NBdown(1),C3NBdown(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end

if (C3NBleft(1)>=1)&sum((C3NBleft~=CX2pickedup).^2)~=0
    Checkspecies=Conf(C3NBleft(1),C3NBleft(2)); %check C3 neighbour
    
    switch (Checkspecies)
        case(0)
            C3diffusionSP(C3pickedup(1),C3pickedup(2))=C3diffusionSP(C3pickedup(1),C3pickedup(2))-1;
            if C3diffusionSP(C3pickedup(1),C3pickedup(2))==0
                NZE(4)=NZE(4)-1;
            end
        case(C)
            CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))+1;%addevent(CXFSP,C3pickedup,'CXFSP');
            if CXFSP(C3pickedup(1),C3pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C2)
            %CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))-1;%addevent(CXFSP,x,'CXFSP');
 
        case(C3)
            CXFSP(C3NBleft(1),C3NBleft(2))=CXFSP(C3NBleft(1),C3NBleft(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C3NBleft(1),C3NBleft(2))==0
                NZE(11)=NZE(11)-1;
            end
            CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))+1;%addevent(CXFSP,C3pickedup,'CXFSP');
            if CXFSP(C3pickedup(1),C3pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(CX)
            CXFSP(C3NBleft(1),C3NBleft(2))=CXFSP(C3NBleft(1),C3NBleft(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C3NBleft(1),C3NBleft(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end

if (C3NBright(1)<=W)&sum((C3NBright~=CX2pickedup).^2)~=0
    Checkspecies=Conf(C3NBright(1),C3NBright(2)); %check C3 neighbour
    
    switch (Checkspecies)
        case(0)
            C3diffusionSP(C3pickedup(1),C3pickedup(2))=C3diffusionSP(C3pickedup(1),C3pickedup(2))-1;
            if C3diffusionSP(C3pickedup(1),C3pickedup(2))==0
                NZE(4)=NZE(4)-1;
            end
        case(C)
            CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))+1;%addevent(CXFSP,C3pickedup,'CXFSP');
            if CXFSP(C3pickedup(1),C3pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(C2)
            %CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))-1;%addevent(CXFSP,x,'CXFSP');
 
        case(C3)
            CXFSP(C3NBright(1),C3NBright(2))=CXFSP(C3NBright(1),C3NBright(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C3NBright(1),C3NBright(2))==0
                NZE(11)=NZE(11)-1;
            end
            CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))+1;%addevent(CXFSP,C3pickedup,'CXFSP');
            if CXFSP(C3pickedup(1),C3pickedup(2))==1
                NZE(11)=NZE(11)+1;
            end
        case(CX)
            CXFSP(C3NBright(1),C3NBright(2))=CXFSP(C3NBright(1),C3NBright(2))-1;%removeevent(CXFSP,y,'CXFSP');
            if CXFSP(C3NBright(1),C3NBright(2))==0
                NZE(11)=NZE(11)-1;
            end
    end
end
end