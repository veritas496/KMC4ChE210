function ystore=scanCXempty(ystore,Conf,W,L,CX1pickedup,CX1NBup,CX1NBdown,CX1NBleft,CX1NBright,...
    CX2pickedup,CX2NBup,CX2NBdown,CX2NBleft,CX2NBright)

if isempty(CX1pickedup)==0
    if (CX1NBup(2)<=L&Conf(CX1NBup(1),CX1NBup(2))==0)|(CX1NBdown(2)>=1&Conf(CX1NBdown(1),CX1NBdown(2))==0)|(CX1NBleft(1)>=1&Conf(CX1NBleft(1),CX1NBleft(2))==0)|...
        (CX1NBright(1)<=W&Conf(CX1NBright(1),CX1NBright(2))==0)
        ystore(CX1pickedup(1),CX1pickedup(2))=100;
    else
        ystore(CX1pickedup(1),CX1pickedup(2))=0;
    end
end


if isempty(CX2pickedup)==0
    if (CX2NBup(2)<=L&Conf(CX2NBup(1),CX2NBup(2))==0)|(CX2NBdown(2)>=1&Conf(CX2NBdown(1),CX2NBdown(2))==0)|(CX2NBleft(1)>=1&Conf(CX2NBleft(1),CX2NBleft(2))==0)|...
        (CX2NBright(1)<=W&Conf(CX2NBright(1),CX2NBright(2))==0)
        ystore(CX2pickedup(1),CX2pickedup(2))=100;
    else
        ystore(CX2pickedup(1),CX2pickedup(2))=0;
    end
end
   
end