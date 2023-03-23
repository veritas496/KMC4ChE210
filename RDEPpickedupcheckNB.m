function [meetpointST,meetpointNN,BCpoint] = RDEPpickedupcheckNB(W,L,lattice,meetpointST,meetpointNN,BCpoint,upEPpicked,downEPpicked,leftEPpicked,rightEPpicked)

if upEPpicked(2)<=L&&lattice(upEPpicked(1),upEPpicked(2))==1 
         meetpointNN=meetpointNN+1;
elseif upEPpicked(2)<=L&&lattice(upEPpicked(1),upEPpicked(2))==2
         meetpointST=meetpointST+1;
end
          
if downEPpicked(2)>=1&&lattice(downEPpicked(1),downEPpicked(2))==1
         meetpointNN=meetpointNN+1;
elseif downEPpicked(2)>=1&&lattice(downEPpicked(1),downEPpicked(2))==2
         meetpointST=meetpointST+1;
end
          
if leftEPpicked(1)>=1&&lattice(leftEPpicked(1),leftEPpicked(2))==1
         meetpointNN=meetpointNN+1;
elseif leftEPpicked(1)>=1&&lattice(leftEPpicked(1),leftEPpicked(2))==2
         meetpointST=meetpointST+1;
end

if rightEPpicked(1)<=W&&lattice(rightEPpicked(1),rightEPpicked(2))==1
         meetpointNN=meetpointNN+1;
elseif rightEPpicked(1)<=W&&lattice(rightEPpicked(1),rightEPpicked(2))==2
         meetpointST=meetpointST+1;
end  

if upEPpicked(2)>L % calculate the BC point
      BCpoint=BCpoint+1;
end
if downEPpicked(2)==0 % calculate the BC point
      BCpoint=BCpoint+1;
end
if leftEPpicked(1)==0 % calculate the BC point
      BCpoint=BCpoint+1;
end
if rightEPpicked(1)>L % calculate the BC point
      BCpoint=BCpoint+1;
end

end

