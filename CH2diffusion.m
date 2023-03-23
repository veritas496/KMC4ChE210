global W L Conf CH2 CH2DSP   

EPstore=zeros(4,2);

[row,colum]=find(CH2DSP);
S=length(row);
M=[row,colum];
N=ceil(rand(1)*S);

CH2pickedup=M(N,:);  %pickup an random position for CH2

upCH2picked=[CH2pickedup(1),CH2pickedup(2)+1];       %the position of its neighbours
downCH2picked=[CH2pickedup(1),CH2pickedup(2)-1];
leftCH2picked=[CH2pickedup(1)-1,CH2pickedup(2)];
rightCH2picked=[CH2pickedup(1)+1,CH2pickedup(2)];

if upCH2picked(2)<=L&&Conf(upCH2picked(1),upCH2picked(2))==0 %find the CH2 neighbours which is 0 
    EPstore(1,:)=upCH2picked;
end
if downCH2picked(2)>=1&&Conf(downCH2picked(1),downCH2picked(2))==0
    EPstore(2,:)=downCH2picked;
end
if leftCH2picked(1)>=1&&Conf(leftCH2picked(1),leftCH2picked(2))==0
    EPstore(3,:)=leftCH2picked;
end
if rightCH2picked(1)<=W&&Conf(rightCH2picked(1),rightCH2picked(2))==0
    EPstore(4,:)=rightCH2picked;
end

index=find(EPstore(:,1));
row=randperm(length(index));
EPpickedup=EPstore(index(row(1)),:);  % randomly pick up an position which is 0 

upEPpicked=[EPpickedup(1),EPpickedup(2)+1]; % find the neighbours of this 0 site
downEPpicked=[EPpickedup(1),EPpickedup(2)-1];
leftEPpicked=[EPpickedup(1)-1,EPpickedup(2)];
rightEPpicked=[EPpickedup(1)+1,EPpickedup(2)];                                         

Conf(CH2pickedup(1),CH2pickedup(2))=0;  % update the configuration of the lattice
Conf(EPpickedup(1),EPpickedup(2))=CH2;

%addevent(CH2diffusionSP,EPpickedup,'CH2diffusionSP');
NR(3)=NR(3)+1;
CH2DSP(EPpickedup(1),EPpickedup(2))=CH2DSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CH2DSP,EPpickedup,'CH2DSP');
NR(3)=NR(3)-CH2DSP(CH2pickedup(1),CH2pickedup(2));
CH2DSP(CH2pickedup(1),CH2pickedup(2))=0;%CH2DSP(strmatch(CH2pickedup, CH2DSP),:) = []; %remove CH2 dissociation at this site
%CH2diffusionSP(strmatch(CH2pickedup, CH2diffusionSP),:) = []; %remove CH2 diffusion at this site

if CH2pickedup(1)>1&&CH2pickedup(1)<W&&CH2pickedup(2)>1&&CH2pickedup(2)<L&&EPpickedup(1)>1&&EPpickedup(1)<W&&EPpickedup(2)>1&&EPpickedup(2)<L
    RP=CH2pickedup(1)-EPpickedup(1);%relative position
    switch(RP)
        case(0)% the same column
            position=CH2pickedup(2)-EPpickedup(2);
            switch(position)
                case(1)                                                % .....CH3.....  
                    CH2diffusioncheckCH2NB(CH2pickedup,upCH2picked);           % .....H  ..... 
                    CH2diffusioncheckCH2NB(CH2pickedup,leftCH2picked);
                    CH2diffusioncheckCH2NB(CH2pickedup,rightCH2picked);
                    CH2diffusioncheckEPNB(EPpickedup,leftEPpicked);
                    CH2diffusioncheckEPNB(EPpickedup,downEPpicked);
                    CH2diffusioncheckEPNB(EPpickedup,rightEPpicked);   
                case(-1)                                               % .....H  .....  
                    CH2diffusioncheckEPNB(EPpickedup,upEPpicked);                 % .....CH3.....
                    CH2diffusioncheckEPNB(EPpickedup,leftEPpicked);                
                    CH2diffusioncheckEPNB(EPpickedup,rightEPpicked);
                    CH2diffusioncheckCH2NB(CH2pickedup,leftCH2picked);
                    CH2diffusioncheckCH2NB(CH2pickedup,downCH2picked);
                    CH2diffusioncheckCH2NB(CH2pickedup,rightCH2picked);
            end
        case(1)                                                         % .....HCH3..... 
            CH2diffusioncheckEPNB(EPpickedup,upEPpicked); 
            CH2diffusioncheckEPNB(EPpickedup,leftEPpicked);
            CH2diffusioncheckEPNB(EPpickedup,downEPpicked);
            CH2diffusioncheckCH2NB(CH2pickedup,upCH2picked); 
            CH2diffusioncheckCH2NB(CH2pickedup,rightCH2picked);
            CH2diffusioncheckCH2NB(CH2pickedup,downCH2picked);
        case(-1)                                                        % .....CH3H..... 
            CH2diffusioncheckCH2NB(CH2pickedup,upCH2picked);  
            CH2diffusioncheckCH2NB(CH2pickedup,leftCH2picked);
            CH2diffusioncheckCH2NB(CH2pickedup,downCH2picked); 
            CH2diffusioncheckEPNB(EPpickedup,upEPpicked);  
            CH2diffusioncheckEPNB(EPpickedup,rightEPpicked);
            CH2diffusioncheckEPNB(EPpickedup,downEPpicked); 
    end
elseif CH2pickedup(1)>1&&CH2pickedup(1)<W&&EPpickedup(1)>1&&EPpickedup(1)<W
    checkupdown=(CH2pickedup(2)==1||EPpickedup(2)==1);
    switch(checkupdown)   
        case(0)                                                        %upmost
            RP=CH2pickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)      %same column                      
                    position=CH2pickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                 % ... CH3... upmost 2 to W-1
                            CH2diffusioncheckCH2NB(CH2pickedup,leftCH2picked);          % ... H  ...        2 to W-1
                            CH2diffusioncheckCH2NB(CH2pickedup,rightCH2picked);
                            CH2diffusioncheckEPNB(EPpickedup,leftEPpicked);
                            CH2diffusioncheckEPNB(EPpickedup,rightEPpicked); 
                            CH2diffusioncheckEPNB(EPpickedup,downEPpicked); 
                        case(-1)                                                % ... H  ... upmost 2 to W-1
                            CH2diffusioncheckCH2NB(CH2pickedup,leftCH2picked);          % ... CH3...        2 to W-1    
                            CH2diffusioncheckCH2NB(CH2pickedup,rightCH2picked);
                            CH2diffusioncheckCH2NB(CH2pickedup,downCH2picked); 
                            CH2diffusioncheckEPNB(EPpickedup,leftEPpicked); 
                            CH2diffusioncheckEPNB(EPpickedup,rightEPpicked); 
                    end
                case(1)                                                         % ... HCH3... upmost 2 to W-1
                    CH2diffusioncheckCH2NB(CH2pickedup,rightCH2picked); 
                    CH2diffusioncheckCH2NB(CH2pickedup,downCH2picked); 
                    CH2diffusioncheckEPNB(EPpickedup,leftEPpicked);
                    CH2diffusioncheckEPNB(EPpickedup,downEPpicked);
                case(-1)                                                        % ... CH3H... upmost 2 to W-1
                    CH2diffusioncheckCH2NB(CH2pickedup,leftCH2picked); 
                    CH2diffusioncheckCH2NB(CH2pickedup,downCH2picked); 
                    CH2diffusioncheckEPNB(EPpickedup,rightEPpicked); 
                    CH2diffusioncheckEPNB(EPpickedup,downEPpicked); 
            end
        case(1)                                                      %downmost
            RP=CH2pickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)            %same column
                    position=CH2pickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                  % ... CH3... 2 to W-1
                            CH2diffusioncheckCH2NB(CH2pickedup,upCH2picked);             % ... H  ... downmost  2 to W-1    
                            CH2diffusioncheckCH2NB(CH2pickedup,leftCH2picked); 
                            CH2diffusioncheckCH2NB(CH2pickedup,rightCH2picked);
                            CH2diffusioncheckEPNB(EPpickedup,leftEPpicked); 
                            CH2diffusioncheckEPNB(EPpickedup,rightEPpicked);
                        case(-1)                                                 % ... H  ...  2 to W-1
                            CH2diffusioncheckCH2NB(CH2pickedup,leftCH2picked);           % ... CH3...  downmost  2 to W-1
                            CH2diffusioncheckCH2NB(CH2pickedup,rightCH2picked); 
                            CH2diffusioncheckEPNB(EPpickedup,upEPpicked);  
                            CH2diffusioncheckEPNB(EPpickedup,leftEPpicked);
                            CH2diffusioncheckEPNB(EPpickedup,rightEPpicked); 
                    end
                case(1)                                                          % ... HCH3... downmost 2 to W-1
                    CH2diffusioncheckCH2NB(CH2pickedup,upCH2picked); 
                    CH2diffusioncheckCH2NB(CH2pickedup,rightCH2picked);
                    CH2diffusioncheckEPNB(EPpickedup,upEPpicked);  
                    CH2diffusioncheckEPNB(EPpickedup,leftEPpicked); 
                case(-1)                                                         % ... CH3H... downmost 2 to W-1
                    CH2diffusioncheckCH2NB(CH2pickedup,upCH2picked);   
                    CH2diffusioncheckCH2NB(CH2pickedup,leftCH2picked); 
                    CH2diffusioncheckEPNB(EPpickedup,upEPpicked); 
                    CH2diffusioncheckEPNB(EPpickedup,rightEPpicked); 
            end
    end
elseif CH2pickedup(2)>1&&CH2pickedup(2)<L&&EPpickedup(2)>1&&EPpickedup(2)<L
    checkleftright=(CH2pickedup(1)==W||EPpickedup(1)==W);
    switch(checkleftright)
        case(0)                                                   %leftmost
            RP=CH2pickedup(1)-EPpickedup(1); 
            switch(RP)
                case(0)                                           %same column
                    position=CH2pickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                 % CH3......  leftmost 2 to L-1
                            CH2diffusioncheckCH2NB(CH2pickedup,upCH2picked);            % H......    leftmost 2 to L-1
                            CH2diffusioncheckCH2NB(CH2pickedup,rightCH2picked);
                            CH2diffusioncheckEPNB(EPpickedup,downEPpicked);
                            CH2diffusioncheckEPNB(EPpickedup,rightEPpicked);
                        case(-1)                                                % H......    leftmost 2 to L-1
                            CH2diffusioncheckCH2NB(CH2pickedup,downCH2picked);          % CH3......  leftmost 2 to L-1  
                            CH2diffusioncheckCH2NB(CH2pickedup,rightCH2picked); 
                            CH2diffusioncheckEPNB(EPpickedup,upEPpicked);  
                            CH2diffusioncheckEPNB(EPpickedup,rightEPpicked); 
                    end
                case(1)                                                         % HCH3......  leftmost 2 to L-1
                    CH2diffusioncheckCH2NB(CH2pickedup,upCH2picked); 
                    CH2diffusioncheckCH2NB(CH2pickedup,downCH2picked);
                    CH2diffusioncheckCH2NB(CH2pickedup,rightCH2picked);  
                    CH2diffusioncheckEPNB(EPpickedup,upEPpicked);  
                    CH2diffusioncheckEPNB(EPpickedup,downEPpicked); 
                case(-1)                                                        % CH3H......  leftmost 2 to L-1
                    CH2diffusioncheckCH2NB(CH2pickedup,upCH2picked); 
                    CH2diffusioncheckCH2NB(CH2pickedup,downCH2picked);
                    CH2diffusioncheckEPNB(EPpickedup,upEPpicked);  
                    CH2diffusioncheckEPNB(EPpickedup,downEPpicked); 
                    CH2diffusioncheckEPNB(EPpickedup,rightEPpicked); 
            end
        case(1)                                                 %rightmost
            RP=CH2pickedup(1)-EPpickedup(1); 
            switch(RP)
                case(0)                                         %same column
                    position=CH2pickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                % ......CH3  righttmost 2 to L-1
                            CH2diffusioncheckCH2NB(CH2pickedup,upCH2picked);           % ......H    rightmost 2 to L-1 
                            CH2diffusioncheckCH2NB(CH2pickedup,leftCH2picked);
                            CH2diffusioncheckEPNB(EPpickedup,leftEPpicked); 
                            CH2diffusioncheckEPNB(EPpickedup,downEPpicked); 
                        case(-1)                                               % ......H    righttmost 2 to L-1
                            CH2diffusioncheckCH2NB(CH2pickedup,leftCH2picked);         % ......CH3  rightmost 2 to L-1 
                            CH2diffusioncheckCH2NB(CH2pickedup,downCH2picked); 
                            CH2diffusioncheckEPNB(EPpickedup,upEPpicked);  
                            CH2diffusioncheckEPNB(EPpickedup,leftEPpicked); 
                    end
                case(1)                                                        % ......HCH3  righttmost 2 to L-1
                    CH2diffusioncheckCH2NB(CH2pickedup,upCH2picked);  
                    CH2diffusioncheckCH2NB(CH2pickedup,downCH2picked);
                    CH2diffusioncheckEPNB(EPpickedup,upEPpicked);  
                    CH2diffusioncheckEPNB(EPpickedup,leftEPpicked); 
                    CH2diffusioncheckEPNB(EPpickedup,downEPpicked);
                case(-1)                                                       % ......CH3H  righttmost 2 to L-1
                    CH2diffusioncheckCH2NB(CH2pickedup,upCH2picked); 
                    CH2diffusioncheckCH2NB(CH2pickedup,leftCH2picked); 
                    CH2diffusioncheckCH2NB(CH2pickedup,downCH2picked);
                    CH2diffusioncheckEPNB(EPpickedup,upEPpicked); 
                    CH2diffusioncheckEPNB(EPpickedup,downEPpicked); 
            end
    end
elseif CH2pickedup(2)==L||EPpickedup(2)==L                     %upcorners
    checkleftright=(CH2pickedup(1)==W||EPpickedup(1)==W);
    switch(checkleftright)
        case(0)                                               %upleft
            RP=CH2pickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)                                       %same column
                    position=CH2pickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                      %CH30000...upleft corner
                            CH2diffusioncheckCH2NB(CH2pickedup,rightCH2picked);              %H  0000... 
                            CH2diffusioncheckEPNB(EPpickedup,downEPpicked);
                            CH2diffusioncheckEPNB(EPpickedup,rightEPpicked);
                        case(-1)                                                     %H   00000...upleft corner
                            CH2diffusioncheckCH2NB(CH2pickedup,rightCH2picked);              %CH3 00000...
                            CH2diffusioncheckCH2NB(CH2pickedup,downCH2picked);
                            CH2diffusioncheckEPNB(EPpickedup,rightEPpicked);
                    end
                case(1)                                                              %H CH30000...upleft corner
                    CH2diffusioncheckCH2NB(CH2pickedup,downCH2picked);                       %0 0  0000...
                    CH2diffusioncheckCH2NB(CH2pickedup,rightCH2picked);
                    CH2diffusioncheckEPNB(EPpickedup,downEPpicked);
                case(-1)                                                             %CH3H000...upleft corner
                    CH2diffusioncheckCH2NB(CH2pickedup,downCH2picked);                       %0  0000...
                    CH2diffusioncheckEPNB(EPpickedup,downEPpicked);
                    CH2diffusioncheckEPNB(EPpickedup,rightEPpicked);
            end
        case(1)                                               %upright
            RP=CH2pickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)                                       %same column
                    position=CH2pickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                      %...00000 CH3...upright corner
                            CH2diffusioncheckCH2NB(CH2pickedup,leftCH2picked);               %...00000 H
                            CH2diffusioncheckEPNB(EPpickedup,leftEPpicked);
                            CH2diffusioncheckEPNB(EPpickedup,downEPpicked); 
                        case(-1)                                                     %...00000 H...upright corner
                            CH2diffusioncheckCH2NB(CH2pickedup,leftCH2picked);               %...00000 CH3
                            CH2diffusioncheckCH2NB(CH2pickedup,downCH2picked);
                            CH2diffusioncheckEPNB(EPpickedup,leftEPpicked);
                    end
                case(1)                                                              %...0000H CH3...upright corner
                    CH2diffusioncheckCH2NB(CH2pickedup,downCH2picked);                       %...00000 0
                    CH2diffusioncheckEPNB(EPpickedup,leftEPpicked);
                    CH2diffusioncheckEPNB(EPpickedup,downEPpicked); 
                case(-1)                                                             %...0000CH3 H...upright corner
                    CH2diffusioncheckCH2NB(CH2pickedup,downCH2picked);                       %...00000   0
                    CH2diffusioncheckCH2NB(CH2pickedup,leftCH2picked); 
                    CH2diffusioncheckEPNB(EPpickedup,downEPpicked);
            end
    end
else                                                         %downcorners
    checkleftright=(CH2pickedup(1)==W||EPpickedup(1)==W);
    switch(checkleftright)
        case(0)                                              %downleft
            RP=CH2pickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)                                      %same column
                    position=CH2pickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                      %CH3 00000 ...downleft corner
                            CH2diffusioncheckCH2NB(CH2pickedup,rightCH2picked);              %H   00000...
                            CH2diffusioncheckCH2NB(CH2pickedup,upCH2picked); 
                            CH2diffusioncheckEPNB(EPpickedup,rightEPpicked); 
                        case(-1)                                                     %H  00000 ...downleft corner
                            CH2diffusioncheckCH2NB(CH2pickedup,rightCH2picked);              %CH300000...
                            CH2diffusioncheckEPNB(EPpickedup,rightEPpicked);
                            CH2diffusioncheckEPNB(EPpickedup,upEPpicked); 
                    end
                case(1)                                                              %0 0   00000 ...downleft corner
                    CH2diffusioncheckCH2NB(CH2pickedup,upCH2picked);                         %H CH3 00000...
                    CH2diffusioncheckCH2NB(CH2pickedup,rightCH2picked);
                    CH2diffusioncheckEPNB(EPpickedup,upEPpicked); 
                case(-1)                                                             %0   0 00000 ...downleft corner
                    CH2diffusioncheckCH2NB(CH2pickedup,upCH2picked);                         %CH3 H 00000...
                    CH2diffusioncheckEPNB(EPpickedup,rightEPpicked);
                    CH2diffusioncheckEPNB(EPpickedup,upEPpicked);  
            end
        case(1)                                             %downright
            RP=CH2pickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)                                     %same column
                    position=CH2pickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                      % ...000000 CH3 downright corner
                            CH2diffusioncheckCH2NB(CH2pickedup,leftCH2picked);               % ...000000 H  
                            CH2diffusioncheckCH2NB(CH2pickedup,upCH2picked);  
                            CH2diffusioncheckEPNB(EPpickedup,leftEPpicked); 
                        case(-1)                                                     % ...000000 H downright corner
                            CH2diffusioncheckCH2NB(CH2pickedup,leftCH2picked);               % ...000000CH3  
                            CH2diffusioncheckEPNB(EPpickedup,upEPpicked);  
                            CH2diffusioncheckEPNB(EPpickedup,leftEPpicked);
                    end
                case(1)                                                              % ...000000 0 downright corner
                    CH2diffusioncheckCH2NB(CH2pickedup,upCH2picked);                         % ...00000H CH3  
                    CH2diffusioncheckEPNB(EPpickedup,upEPpicked);  
                    CH2diffusioncheckEPNB(EPpickedup,leftEPpicked);
                case(-1)                                                             % ...000000   0 downright corner
                    CH2diffusioncheckCH2NB(CH2pickedup,upCH2picked);                         % ...00000CH3 H  
                    CH2diffusioncheckCH2NB(CH2pickedup,leftCH2picked); 
                    CH2diffusioncheckEPNB(EPpickedup,upEPpicked); 
            end
    end
end