global W L Conf H CH2 CH2DSP CH2PSP 

Hstore=zeros(4,2);

[row,colum]=find(CH2PSP);
S=length(row);
M=[row,colum];
N=ceil(rand(1)*S);

CHpickedup=M(N,:);  %pickup an random position for CH

upCHpicked=[CHpickedup(1),CHpickedup(2)+1];       %the position of its neighbours
downCHpicked=[CHpickedup(1),CHpickedup(2)-1];
leftCHpicked=[CHpickedup(1)-1,CHpickedup(2)];
rightCHpicked=[CHpickedup(1)+1,CHpickedup(2)];

if upCHpicked(2)<=L&&Conf(upCHpicked(1),upCHpicked(2))==H %find the CH neighbours which is H 
    Hstore(1,:)=upCHpicked;
end
if downCHpicked(2)>=1&&Conf(downCHpicked(1),downCHpicked(2))==H
    Hstore(2,:)=downCHpicked;
end
if leftCHpicked(1)>=1&&Conf(leftCHpicked(1),leftCHpicked(2))==H
    Hstore(3,:)=leftCHpicked;
end
if rightCHpicked(1)<=W&&Conf(rightCHpicked(1),rightCHpicked(2))==H
    Hstore(4,:)=rightCHpicked;
end

index=find(Hstore(:,1));
row=randperm(length(index));
Hpickedup=Hstore(index(row(1)),:);  % randomly pick up an position which is H 

upHpicked=[Hpickedup(1),Hpickedup(2)+1]; % find the neighbours of this H
downHpicked=[Hpickedup(1),Hpickedup(2)-1];
leftHpicked=[Hpickedup(1)-1,Hpickedup(2)];
rightHpicked=[Hpickedup(1)+1,Hpickedup(2)];                                         

Conf(CHpickedup(1),CHpickedup(2))=CH2;  % update the configuration of the lattice
Conf(Hpickedup(1),Hpickedup(2))=0;

NR(3)=NR(3)+1;
CH2DSP(CHpickedup(1),CHpickedup(2))=CH2DSP(CHpickedup(1),CHpickedup(2))+1;%addevent(CH2DSP,CHpickedup,'CH2DSP');
%addevent(CH2diffusionSP,CHpickedup,'CH2diffusionSP');
NR(9)=NR(9)-CH2PSP(CHpickedup(1),CHpickedup(2));
CH2PSP(CHpickedup(1),CHpickedup(2))=0;%CH2PSP(strmatch(CHpickedup, CH2PSP),:) = []; %remove CH2 production at this site

if CHpickedup(1)>1&&CHpickedup(1)<W&&CHpickedup(2)>1&&CHpickedup(2)<L&&Hpickedup(1)>1&&Hpickedup(1)<W&&Hpickedup(2)>1&&Hpickedup(2)<L
    RP=CHpickedup(1)-Hpickedup(1);%relative position
    switch(RP)
        case(0)% the same column
            position=CHpickedup(2)-Hpickedup(2);
            switch(position)
                case(1)                                                % .....CH3.....  
                    CH2PcheckCHNB(CHpickedup,upCHpicked);           % .....H  ..... 
                    CH2PcheckCHNB(CHpickedup,leftCHpicked);
                    CH2PcheckCHNB(CHpickedup,rightCHpicked);
                    CH2PcheckHNB(Hpickedup,leftHpicked);
                    CH2PcheckHNB(Hpickedup,downHpicked);
                    CH2PcheckHNB(Hpickedup,rightHpicked);   
                case(-1)                                               % .....H  .....  
                    CH2PcheckHNB(Hpickedup,upHpicked);                 % .....CH3.....
                    CH2PcheckHNB(Hpickedup,leftHpicked);                
                    CH2PcheckHNB(Hpickedup,rightHpicked);
                    CH2PcheckCHNB(CHpickedup,leftCHpicked);
                    CH2PcheckCHNB(CHpickedup,downCHpicked);
                    CH2PcheckCHNB(CHpickedup,rightCHpicked);
            end
        case(1)                                                         % .....HCH3..... 
            CH2PcheckHNB(Hpickedup,upHpicked); 
            CH2PcheckHNB(Hpickedup,leftHpicked);
            CH2PcheckHNB(Hpickedup,downHpicked);
            CH2PcheckCHNB(CHpickedup,upCHpicked); 
            CH2PcheckCHNB(CHpickedup,rightCHpicked);
            CH2PcheckCHNB(CHpickedup,downCHpicked);
        case(-1)                                                        % .....CH3H..... 
            CH2PcheckCHNB(CHpickedup,upCHpicked);  
            CH2PcheckCHNB(CHpickedup,leftCHpicked);
            CH2PcheckCHNB(CHpickedup,downCHpicked); 
            CH2PcheckHNB(Hpickedup,upHpicked);  
            CH2PcheckHNB(Hpickedup,rightHpicked);
            CH2PcheckHNB(Hpickedup,downHpicked); 
    end
elseif CHpickedup(1)>1&&CHpickedup(1)<W&&Hpickedup(1)>1&&Hpickedup(1)<W
    checkupdown=(CHpickedup(2)==1||Hpickedup(2)==1);
    switch(checkupdown)   
        case(0)                                                        %upmost
            RP=CHpickedup(1)-Hpickedup(1);
            switch(RP)
                case(0)      %same column                      
                    position=CHpickedup(2)-Hpickedup(2);
                    switch(position)
                        case(1)                                                 % ... CH3... upmost 2 to W-1
                            CH2PcheckCHNB(CHpickedup,leftCHpicked);          % ... H  ...        2 to W-1
                            CH2PcheckCHNB(CHpickedup,rightCHpicked);
                            CH2PcheckHNB(Hpickedup,leftHpicked);
                            CH2PcheckHNB(Hpickedup,rightHpicked); 
                            CH2PcheckHNB(Hpickedup,downHpicked); 
                        case(-1)                                                % ... H  ... upmost 2 to W-1
                            CH2PcheckCHNB(CHpickedup,leftCHpicked);          % ... CH3...        2 to W-1    
                            CH2PcheckCHNB(CHpickedup,rightCHpicked);
                            CH2PcheckCHNB(CHpickedup,downCHpicked); 
                            CH2PcheckHNB(Hpickedup,leftHpicked); 
                            CH2PcheckHNB(Hpickedup,rightHpicked); 
                    end
                case(1)                                                         % ... HCH3... upmost 2 to W-1
                    CH2PcheckCHNB(CHpickedup,rightCHpicked); 
                    CH2PcheckCHNB(CHpickedup,downCHpicked); 
                    CH2PcheckHNB(Hpickedup,leftHpicked);
                    CH2PcheckHNB(Hpickedup,downHpicked);
                case(-1)                                                        % ... CH3H... upmost 2 to W-1
                    CH2PcheckCHNB(CHpickedup,leftCHpicked); 
                    CH2PcheckCHNB(CHpickedup,downCHpicked); 
                    CH2PcheckHNB(Hpickedup,rightHpicked); 
                    CH2PcheckHNB(Hpickedup,downHpicked); 
            end
        case(1)                                                      %downmost
            RP=CHpickedup(1)-Hpickedup(1);
            switch(RP)
                case(0)            %same column
                    position=CHpickedup(2)-Hpickedup(2);
                    switch(position)
                        case(1)                                                  % ... CH3... 2 to W-1
                            CH2PcheckCHNB(CHpickedup,upCHpicked);             % ... H  ... downmost  2 to W-1    
                            CH2PcheckCHNB(CHpickedup,leftCHpicked); 
                            CH2PcheckCHNB(CHpickedup,rightCHpicked);
                            CH2PcheckHNB(Hpickedup,leftHpicked); 
                            CH2PcheckHNB(Hpickedup,rightHpicked);
                        case(-1)                                                 % ... H  ...  2 to W-1
                            CH2PcheckCHNB(CHpickedup,leftCHpicked);           % ... CH3...  downmost  2 to W-1
                            CH2PcheckCHNB(CHpickedup,rightCHpicked); 
                            CH2PcheckHNB(Hpickedup,upHpicked);  
                            CH2PcheckHNB(Hpickedup,leftHpicked);
                            CH2PcheckHNB(Hpickedup,rightHpicked); 
                    end
                case(1)                                                          % ... HCH3... downmost 2 to W-1
                    CH2PcheckCHNB(CHpickedup,upCHpicked); 
                    CH2PcheckCHNB(CHpickedup,rightCHpicked);
                    CH2PcheckHNB(Hpickedup,upHpicked);  
                    CH2PcheckHNB(Hpickedup,leftHpicked); 
                case(-1)                                                         % ... CH3H... downmost 2 to W-1
                    CH2PcheckCHNB(CHpickedup,upCHpicked);   
                    CH2PcheckCHNB(CHpickedup,leftCHpicked); 
                    CH2PcheckHNB(Hpickedup,upHpicked); 
                    CH2PcheckHNB(Hpickedup,rightHpicked); 
            end
    end
elseif CHpickedup(2)>1&&CHpickedup(2)<L&&Hpickedup(2)>1&&Hpickedup(2)<L
    checkleftright=(CHpickedup(1)==W||Hpickedup(1)==W);
    switch(checkleftright)
        case(0)                                                   %leftmost
            RP=CHpickedup(1)-Hpickedup(1); 
            switch(RP)
                case(0)                                           %same column
                    position=CHpickedup(2)-Hpickedup(2);
                    switch(position)
                        case(1)                                                 % CH3......  leftmost 2 to L-1
                            CH2PcheckCHNB(CHpickedup,upCHpicked);            % H......    leftmost 2 to L-1
                            CH2PcheckCHNB(CHpickedup,rightCHpicked);
                            CH2PcheckHNB(Hpickedup,downHpicked);
                            CH2PcheckHNB(Hpickedup,rightHpicked);
                        case(-1)                                                % H......    leftmost 2 to L-1
                            CH2PcheckCHNB(CHpickedup,downCHpicked);          % CH3......  leftmost 2 to L-1  
                            CH2PcheckCHNB(CHpickedup,rightCHpicked); 
                            CH2PcheckHNB(Hpickedup,upHpicked);  
                            CH2PcheckHNB(Hpickedup,rightHpicked); 
                    end
                case(1)                                                         % HCH3......  leftmost 2 to L-1
                    CH2PcheckCHNB(CHpickedup,upCHpicked); 
                    CH2PcheckCHNB(CHpickedup,downCHpicked);
                    CH2PcheckCHNB(CHpickedup,rightCHpicked);  
                    CH2PcheckHNB(Hpickedup,upHpicked);  
                    CH2PcheckHNB(Hpickedup,downHpicked); 
                case(-1)                                                        % CH3H......  leftmost 2 to L-1
                    CH2PcheckCHNB(CHpickedup,upCHpicked); 
                    CH2PcheckCHNB(CHpickedup,downCHpicked);
                    CH2PcheckHNB(Hpickedup,upHpicked);  
                    CH2PcheckHNB(Hpickedup,downHpicked); 
                    CH2PcheckHNB(Hpickedup,rightHpicked); 
            end
        case(1)                                                 %rightmost
            RP=CHpickedup(1)-Hpickedup(1); 
            switch(RP)
                case(0)                                         %same column
                    position=CHpickedup(2)-Hpickedup(2);
                    switch(position)
                        case(1)                                                % ......CH3  righttmost 2 to L-1
                            CH2PcheckCHNB(CHpickedup,upCHpicked);           % ......H    rightmost 2 to L-1 
                            CH2PcheckCHNB(CHpickedup,leftCHpicked);
                            CH2PcheckHNB(Hpickedup,leftHpicked); 
                            CH2PcheckHNB(Hpickedup,downHpicked); 
                        case(-1)                                               % ......H    righttmost 2 to L-1
                            CH2PcheckCHNB(CHpickedup,leftCHpicked);         % ......CH3  rightmost 2 to L-1 
                            CH2PcheckCHNB(CHpickedup,downCHpicked); 
                            CH2PcheckHNB(Hpickedup,upHpicked);  
                            CH2PcheckHNB(Hpickedup,leftHpicked); 
                    end
                case(1)                                                        % ......HCH3  righttmost 2 to L-1
                    CH2PcheckCHNB(CHpickedup,upCHpicked);  
                    CH2PcheckCHNB(CHpickedup,downCHpicked);
                    CH2PcheckHNB(Hpickedup,upHpicked);  
                    CH2PcheckHNB(Hpickedup,leftHpicked); 
                    CH2PcheckHNB(Hpickedup,downHpicked);
                case(-1)                                                       % ......CH3H  righttmost 2 to L-1
                    CH2PcheckCHNB(CHpickedup,upCHpicked); 
                    CH2PcheckCHNB(CHpickedup,leftCHpicked); 
                    CH2PcheckCHNB(CHpickedup,downCHpicked);
                    CH2PcheckHNB(Hpickedup,upHpicked); 
                    CH2PcheckHNB(Hpickedup,downHpicked); 
            end
    end
elseif CHpickedup(2)==L||Hpickedup(2)==L                     %upcorners
    checkleftright=(CHpickedup(1)==W||Hpickedup(1)==W);
    switch(checkleftright)
        case(0)                                               %upleft
            RP=CHpickedup(1)-Hpickedup(1);
            switch(RP)
                case(0)                                       %same column
                    position=CHpickedup(2)-Hpickedup(2);
                    switch(position)
                        case(1)                                                      %CH30000...upleft corner
                            CH2PcheckCHNB(CHpickedup,rightCHpicked);              %H  0000... 
                            CH2PcheckHNB(Hpickedup,downHpicked);
                            CH2PcheckHNB(Hpickedup,rightHpicked);
                        case(-1)                                                     %H   00000...upleft corner
                            CH2PcheckCHNB(CHpickedup,rightCHpicked);              %CH3 00000...
                            CH2PcheckCHNB(CHpickedup,downCHpicked);
                            CH2PcheckHNB(Hpickedup,rightHpicked);
                    end
                case(1)                                                              %H CH30000...upleft corner
                    CH2PcheckCHNB(CHpickedup,downCHpicked);                       %0 0  0000...
                    CH2PcheckCHNB(CHpickedup,rightCHpicked);
                    CH2PcheckHNB(Hpickedup,downHpicked);
                case(-1)                                                             %CH3H000...upleft corner
                    CH2PcheckCHNB(CHpickedup,downCHpicked);                       %0  0000...
                    CH2PcheckHNB(Hpickedup,downHpicked);
                    CH2PcheckHNB(Hpickedup,rightHpicked);
            end
        case(1)                                               %upright
            RP=CHpickedup(1)-Hpickedup(1);
            switch(RP)
                case(0)                                       %same column
                    position=CHpickedup(2)-Hpickedup(2);
                    switch(position)
                        case(1)                                                      %...00000 CH3...upright corner
                            CH2PcheckCHNB(CHpickedup,leftCHpicked);               %...00000 H
                            CH2PcheckHNB(Hpickedup,leftHpicked);
                            CH2PcheckHNB(Hpickedup,downHpicked); 
                        case(-1)                                                     %...00000 H...upright corner
                            CH2PcheckCHNB(CHpickedup,leftCHpicked);               %...00000 CH3
                            CH2PcheckCHNB(CHpickedup,downCHpicked);
                            CH2PcheckHNB(Hpickedup,leftHpicked);
                    end
                case(1)                                                              %...0000H CH3...upright corner
                    CH2PcheckCHNB(CHpickedup,downCHpicked);                       %...00000 0
                    CH2PcheckHNB(Hpickedup,leftHpicked);
                    CH2PcheckHNB(Hpickedup,downHpicked); 
                case(-1)                                                             %...0000CH3 H...upright corner
                    CH2PcheckCHNB(CHpickedup,downCHpicked);                       %...00000   0
                    CH2PcheckCHNB(CHpickedup,leftCHpicked); 
                    CH2PcheckHNB(Hpickedup,downHpicked);
            end
    end
else                                                         %downcorners
    checkleftright=(CHpickedup(1)==W||Hpickedup(1)==W);
    switch(checkleftright)
        case(0)                                              %downleft
            RP=CHpickedup(1)-Hpickedup(1);
            switch(RP)
                case(0)                                      %same column
                    position=CHpickedup(2)-Hpickedup(2);
                    switch(position)
                        case(1)                                                      %CH3 00000 ...downleft corner
                            CH2PcheckCHNB(CHpickedup,rightCHpicked);              %H   00000...
                            CH2PcheckCHNB(CHpickedup,upCHpicked); 
                            CH2PcheckHNB(Hpickedup,rightHpicked); 
                        case(-1)                                                     %H  00000 ...downleft corner
                            CH2PcheckCHNB(CHpickedup,rightCHpicked);              %CH300000...
                            CH2PcheckHNB(Hpickedup,rightHpicked);
                            CH2PcheckHNB(Hpickedup,upHpicked); 
                    end
                case(1)                                                              %0 0   00000 ...downleft corner
                    CH2PcheckCHNB(CHpickedup,upCHpicked);                         %H CH3 00000...
                    CH2PcheckCHNB(CHpickedup,rightCHpicked);
                    CH2PcheckHNB(Hpickedup,upHpicked); 
                case(-1)                                                             %0   0 00000 ...downleft corner
                    CH2PcheckCHNB(CHpickedup,upCHpicked);                         %CH3 H 00000...
                    CH2PcheckHNB(Hpickedup,rightHpicked);
                    CH2PcheckHNB(Hpickedup,upHpicked);  
            end
        case(1)                                             %downright
            RP=CHpickedup(1)-Hpickedup(1);
            switch(RP)
                case(0)                                     %same column
                    position=CHpickedup(2)-Hpickedup(2);
                    switch(position)
                        case(1)                                                      % ...000000 CH3 downright corner
                            CH2PcheckCHNB(CHpickedup,leftCHpicked);               % ...000000 H  
                            CH2PcheckCHNB(CHpickedup,upCHpicked);  
                            CH2PcheckHNB(Hpickedup,leftHpicked); 
                        case(-1)                                                     % ...000000 H downright corner
                            CH2PcheckCHNB(CHpickedup,leftCHpicked);               % ...000000CH3  
                            CH2PcheckHNB(Hpickedup,upHpicked);  
                            CH2PcheckHNB(Hpickedup,leftHpicked);
                    end
                case(1)                                                              % ...000000 0 downright corner
                    CH2PcheckCHNB(CHpickedup,upCHpicked);                         % ...00000H CH3  
                    CH2PcheckHNB(Hpickedup,upHpicked);  
                    CH2PcheckHNB(Hpickedup,leftHpicked);
                case(-1)                                                             % ...000000   0 downright corner
                    CH2PcheckCHNB(CHpickedup,upCHpicked);                         % ...00000CH3 H  
                    CH2PcheckCHNB(CHpickedup,leftCHpicked); 
                    CH2PcheckHNB(Hpickedup,upHpicked); 
            end
    end
end
