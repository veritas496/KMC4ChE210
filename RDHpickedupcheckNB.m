function [meetpointST,meetpointNN,BCpoint] = RDHpickedupcheckNB(W,L,lattice,meetpointST,meetpointNN,BCpoint,up,down,left,right)


if up(2)<=L&&lattice(up(1),up(2))==1 
         meetpointNN=meetpointNN-1;
elseif up(2)<=L&&lattice(up(1),up(2))==2
         meetpointST=meetpointST-1;
end
          
if down(2)>=1&&lattice(down(1),down(2))==1
         meetpointNN=meetpointNN-1;
elseif down(2)>=1&&lattice(down(1),down(2))==2
         meetpointST=meetpointST-1;
end
          
if left(1)>=1&&lattice(left(1),left(2))==1
         meetpointNN=meetpointNN-1;
elseif left(1)>=1&&lattice(left(1),left(2))==2
         meetpointST=meetpointST-1;
end

if right(1)<=W&&lattice(right(1),right(2))==1
         meetpointNN=meetpointNN-1;
elseif right(1)<=W&&lattice(right(1),right(2))==2
         meetpointST=meetpointST-1;
end  


if up(2)>L % calculate the BC point
      BCpoint=BCpoint-1;
end
if down(2)==0 % calculate the BC point
      BCpoint=BCpoint-1;
end
if left(1)==0 % calculate the BC point
      BCpoint=BCpoint-1;
end
if right(1)>L % calculate the BC point
      BCpoint=BCpoint-1;
end

end

