function [NZE,Conf,CXFSP,C3diffusionSP]=redefineCXFcheckC3NB(NZE,Conf,W,L,C,C2,C3,CX,CXFSP,C3diffusionSP,...
    C3pickedup,C3NBup,C3NBdown,C3NBleft,C3NBright)
%x is C1pickedup;y is one of its neighbour

if C3NBup(2)<=L
    Checkspecies=Conf(C3NBup(1),C3NBup(2)); %check C3 neighbour

    switch (Checkspecies)
         %case(0)

         case(C)
                %CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))+1;%addevent(CXFSP,C3pickedup,'CXFSP');
         case(C2)
                CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))-1;%addevent(CXFSP,x,'CXFSP');
                if CXFSP(C3pickedup(1),C3pickedup(2))==0
                    NZE(11)=NZE(11)-1;
                end
         case(C3)
                CXFSP(C3NBup(1),C3NBup(2))=CXFSP(C3NBup(1),C3NBup(2))-1;%removeevent(CXFSP,y,'CXFSP');
                if CXFSP(C3NBup(1),C3NBup(2))==0
                    NZE(11)=NZE(11)-1;
                end
         case(CX)
                CXFSP(C3NBup(1),C3NBup(2))=CXFSP(C3NBup(1),C3NBup(2))-1;%removeevent(CXFSP,y,'CXFSP');
                if CXFSP(C3NBup(1),C3NBup(2))==0
                    NZE(11)=NZE(11)-1;
                end
    end
end

if C3NBdown(2)>=1
    Checkspecies=Conf(C3NBdown(1),C3NBdown(2)); %check C3 neighbour

    switch (Checkspecies)
         %case(0)

         case(C)
                %CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))+1;%addevent(CXFSP,C3pickedup,'CXFSP');
         case(C2)
                CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))-1;%addevent(CXFSP,x,'CXFSP');
                if CXFSP(C3pickedup(1),C3pickedup(2))==0
                    NZE(11)=NZE(11)-1;
                end
         case(C3)
                CXFSP(C3NBdown(1),C3NBdown(2))=CXFSP(C3NBdown(1),C3NBdown(2))-1;%removeevent(CXFSP,y,'CXFSP');
                if CXFSP(C3NBdown(1),C3NBdown(2))==0
                    NZE(11)=NZE(11)-1;
                end
         case(CX)
                CXFSP(C3NBdown(1),C3NBdown(2))=CXFSP(C3NBdown(1),C3NBdown(2))-1;%removeevent(CXFSP,y,'CXFSP');
                if CXFSP(C3NBdown(1),C3NBdown(2))==0
                    NZE(11)=NZE(11)-1;
                end
    end
end

if C3NBleft(1)>=1
    Checkspecies=Conf(C3NBleft(1),C3NBleft(2)); %check C3 neighbour

    switch (Checkspecies)
         %case(0)

         case(C)
                %CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))+1;%addevent(CXFSP,C3pickedup,'CXFSP');
         case(C2)
                CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))-1;%addevent(CXFSP,x,'CXFSP');
                if CXFSP(C3pickedup(1),C3pickedup(2))==0
                    NZE(11)=NZE(11)-1;
                end
         case(C3)
                CXFSP(C3NBleft(1),C3NBleft(2))=CXFSP(C3NBleft(1),C3NBleft(2))-1;%removeevent(CXFSP,y,'CXFSP');
                if CXFSP(C3NBleft(1),C3NBleft(2))==0
                    NZE(11)=NZE(11)-1;
                end
         case(CX)
                CXFSP(C3NBleft(1),C3NBleft(2))=CXFSP(C3NBleft(1),C3NBleft(2))-1;%removeevent(CXFSP,y,'CXFSP');
                if CXFSP(C3NBleft(1),C3NBleft(2))==0
                    NZE(11)=NZE(11)-1;
                end
    end
end

if C3NBright(1)<=W
    Checkspecies=Conf(C3NBright(1),C3NBright(2)); %check C3 neighbour

    switch (Checkspecies)
         %case(0)

         case(C)
                %CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))+1;%addevent(CXFSP,C3pickedup,'CXFSP');
         case(C2)
                CXFSP(C3pickedup(1),C3pickedup(2))=CXFSP(C3pickedup(1),C3pickedup(2))-1;%addevent(CXFSP,x,'CXFSP');
                if CXFSP(C3pickedup(1),C3pickedup(2))==0
                    NZE(11)=NZE(11)-1;
                end
         case(C3)
                CXFSP(C3NBright(1),C3NBright(2))=CXFSP(C3NBright(1),C3NBright(2))-1;%removeevent(CXFSP,y,'CXFSP');
                if CXFSP(C3NBright(1),C3NBright(2))==0
                    NZE(11)=NZE(11)-1;
                end
         case(CX)
                CXFSP(C3NBright(1),C3NBright(2))=CXFSP(C3NBright(1),C3NBright(2))-1;%removeevent(CXFSP,y,'CXFSP');
                if CXFSP(C3NBright(1),C3NBright(2))==0
                    NZE(11)=NZE(11)-1;
                end
    end
end

end