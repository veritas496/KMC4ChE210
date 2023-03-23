function ystore=scanNBD(ystore,Conf,W,L,CX,SP1NBup,SP1NBdown,SP1NBleft,SP1NBright)

upSP1NBup=[SP1NBup(1),SP1NBup(2)+1];       %the position of SP1NBup neighbours
downSP1NBup=[SP1NBup(1),SP1NBup(2)-1];
leftSP1NBup=[SP1NBup(1)-1,SP1NBup(2)];
rightSP1NBup=[SP1NBup(1)+1,SP1NBup(2)];

if SP1NBup(2)<=L&Conf(SP1NBup(1),SP1NBup(2))==CX   
     ystore=scanCXempty(ystore,Conf,W,L,SP1NBup,upSP1NBup,downSP1NBup,leftSP1NBup,rightSP1NBup,[],0,0,0,0);
end

upSP1NBdown=[SP1NBdown(1),SP1NBdown(2)+1];       %the position of SP1NBdown neighbours
downSP1NBdown=[SP1NBdown(1),SP1NBdown(2)-1];
leftSP1NBdown=[SP1NBdown(1)-1,SP1NBdown(2)];
rightSP1NBdown=[SP1NBdown(1)+1,SP1NBdown(2)];

if SP1NBdown(2)>=1&Conf(SP1NBdown(1),SP1NBdown(2))==CX
     ystore=scanCXempty(ystore,Conf,W,L,SP1NBdown,upSP1NBdown,downSP1NBdown,leftSP1NBdown,rightSP1NBdown,[],0,0,0,0);
end

upSP1NBleft=[SP1NBleft(1),SP1NBleft(2)+1];       %the position of SP1NBleft neighbours
downSP1NBleft=[SP1NBleft(1),SP1NBleft(2)-1];
leftSP1NBleft=[SP1NBleft(1)-1,SP1NBleft(2)];
rightSP1NBleft=[SP1NBleft(1)+1,SP1NBleft(2)];

if SP1NBleft(1)>=1&Conf(SP1NBleft(1),SP1NBleft(2))==CX
     ystore=scanCXempty(ystore,Conf,W,L,SP1NBleft,upSP1NBleft,downSP1NBleft,leftSP1NBleft,rightSP1NBleft,[],0,0,0,0);
end

upSP1NBright=[SP1NBright(1),SP1NBright(2)+1];       %the position of SP1NBright neighbours
downSP1NBright=[SP1NBright(1),SP1NBright(2)-1];
leftSP1NBright=[SP1NBright(1)-1,SP1NBright(2)];
rightSP1NBright=[SP1NBright(1)+1,SP1NBright(2)];

if SP1NBright(1)<=W&Conf(SP1NBright(1),SP1NBright(2))==CX
     ystore=scanCXempty(ystore,Conf,W,L,SP1NBright,upSP1NBright,downSP1NBright,leftSP1NBright,rightSP1NBright,[],0,0,0,0);
end
end