function ystore=scanNBP(ystore,Conf,W,L,CX,SP1pickedup,SP1NBup,SP1NBdown,SP1NBleft,SP1NBright,...
    SP2pickedup,SP2NBup,SP2NBdown,SP2NBleft,SP2NBright)

if isempty(SP1pickedup)==0
    if SP1NBup(2)<=L&Conf(SP1NBup(1),SP1NBup(2))==CX   
        ystore(SP1NBup(1),SP1NBup(2))=100;
    end
    if SP1NBdown(2)>=1&Conf(SP1NBdown(1),SP1NBdown(2))==CX
        ystore(SP1NBdown(1),SP1NBdown(2))=100;
    end
    if SP1NBleft(1)>=1&Conf(SP1NBleft(1),SP1NBleft(2))==CX
        ystore(SP1NBleft(1),SP1NBleft(2))=100;
    end
    if SP1NBright(1)<=W&Conf(SP1NBright(1),SP1NBright(2))==CX
        ystore(SP1NBright(1),SP1NBright(2))=100;
    end
end

if isempty(SP2pickedup)==0
    
    if SP2NBup(2)<=L&Conf(SP2NBup(1),SP2NBup(2))==CX   
        ystore(SP2NBup(1),SP2NBup(2))=100;
    end
    if SP2NBdown(2)>=1&Conf(SP2NBdown(1),SP2NBdown(2))==CX
        ystore(SP2NBdown(1),SP2NBdown(2))=100;
    end
    if SP2NBleft(1)>=1&Conf(SP2NBleft(1),SP2NBleft(2))==CX
        ystore(SP2NBleft(1),SP2NBleft(2))=100;
    end
    if SP2NBright(1)<=W&Conf(SP2NBright(1),SP2NBright(2))==CX
        ystore(SP2NBright(1),SP2NBright(2))=100;
    end
   
end

end