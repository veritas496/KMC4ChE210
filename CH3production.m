function [NZE,CH4PSP,Conf,CH4DSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP]=CH3production(NZE,CH4PSP,W,L,Conf,H,CH4DSP,...
            CH3,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP)
        
Hstore=zeros(4,2);

k=find(CH3PSP);
N=ceil(rand(1)*numel(k));
ind=k(N);
n=ceil(ind/W);
m=ind-W*(n-1);
CH2pickedup=[m n];   %pickup an random position for CH2

upCH2picked=[CH2pickedup(1),CH2pickedup(2)+1];       %the position of its neighbours
downCH2picked=[CH2pickedup(1),CH2pickedup(2)-1];
leftCH2picked=[CH2pickedup(1)-1,CH2pickedup(2)];
rightCH2picked=[CH2pickedup(1)+1,CH2pickedup(2)];

if upCH2picked(2)<=L&&Conf(upCH2picked(1),upCH2picked(2))==H %find the CH2 neighbours which is H 
    Hstore(1,:)=upCH2picked;
end
if downCH2picked(2)>=1&&Conf(downCH2picked(1),downCH2picked(2))==H
    Hstore(2,:)=downCH2picked;
end
if leftCH2picked(1)>=1&&Conf(leftCH2picked(1),leftCH2picked(2))==H
    Hstore(3,:)=leftCH2picked;
end
if rightCH2picked(1)<=W&&Conf(rightCH2picked(1),rightCH2picked(2))==H
    Hstore(4,:)=rightCH2picked;
end

index=find(Hstore(:,1));
row=ceil(rand(1)*length(index));
Hpickedup=Hstore(index(row),:);  % randomly pick up an position which is H 

upHpicked=[Hpickedup(1),Hpickedup(2)+1]; % find the neighbours of this H
downHpicked=[Hpickedup(1),Hpickedup(2)-1];
leftHpicked=[Hpickedup(1)-1,Hpickedup(2)];
rightHpicked=[Hpickedup(1)+1,Hpickedup(2)];                                         

Conf(CH2pickedup(1),CH2pickedup(2))=CH3;  % update the configuration of the lattice
Conf(Hpickedup(1),Hpickedup(2))=0;


CH3PSP(CH2pickedup(1),CH2pickedup(2))=0; %remove CH3 production at this site
NZE(16)=NZE(16)-1;

CH3DSP(CH2pickedup(1),CH2pickedup(2))=1;%addevent(CH3DSP,CH2pickedup,'CH3DSP');
NZE(6)=NZE(6)+1;

if CH2pickedup(1)>1&&CH2pickedup(1)<W&&CH2pickedup(2)>1&&CH2pickedup(2)<L&&Hpickedup(1)>1&&Hpickedup(1)<W&&Hpickedup(2)>1&&Hpickedup(2)<L
    RP=CH2pickedup(1)-Hpickedup(1);%relative position
    switch(RP)
        case(0)% the same column
            position=CH2pickedup(2)-Hpickedup(2);
            switch(position)
                case(1)                                                % .....CH2.....  
                                                                       % .....H  ..... 
                    [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                        CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,upCH2picked,leftCH2picked,rightCH2picked,...
                        Hpickedup,leftHpicked,downHpicked,rightHpicked);  
                case(-1)                                               % .....H  .....  
                                                                       % .....CH2.....
                    [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                        CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,downCH2picked,leftCH2picked,rightCH2picked,...
                        Hpickedup,leftHpicked,upHpicked,rightHpicked);  
            end
        case(1)                                                         % .....HCH2..... 
            [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                        CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,upCH2picked,downCH2picked,rightCH2picked,...
                        Hpickedup,leftHpicked,downHpicked,upHpicked);  
        case(-1)                                                        % .....CH2H..... 
            [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                        CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,upCH2picked,leftCH2picked,downCH2picked,...
                        Hpickedup,upHpicked,downHpicked,rightHpicked);  
    end
elseif CH2pickedup(1)>1&&CH2pickedup(1)<W&&Hpickedup(1)>1&&Hpickedup(1)<W
    checkupdown=(CH2pickedup(2)==1||Hpickedup(2)==1);
    switch(checkupdown)   
        case(0)                                                        %upmost
            RP=CH2pickedup(1)-Hpickedup(1);
            switch(RP)
                case(0)      %same column                      
                    position=CH2pickedup(2)-Hpickedup(2);
                    switch(position)
                        case(1)                                                 % ... CH2... upmost 2 to W-1
                                                                                % ... H  ...        2 to W-1
                            [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                            CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,leftCH2picked,rightCH2picked,0,...
                            Hpickedup,leftHpicked,downHpicked,rightHpicked);  
                        case(-1)                                                % ... H  ... upmost 2 to W-1
                                                                                % ... CH2...        2 to W-1    
                            [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                            CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,leftCH2picked,rightCH2picked,downCH2picked,...
                            Hpickedup,leftHpicked,rightHpicked,0); 
                    end
                case(1)                                                         % ... HCH2... upmost 2 to W-1
                    [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                        CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,rightCH2picked,downCH2picked,0,...
                        Hpickedup,leftHpicked,downHpicked,0); 
                case(-1)                                                        % ... CH2H... upmost 2 to W-1
                    [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                        CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,leftCH2picked,downCH2picked,0,...
                        Hpickedup,rightHpicked,downHpicked,0); 
            end
        case(1)                                                      %downmost
            RP=CH2pickedup(1)-Hpickedup(1);
            switch(RP)
                case(0)            %same column
                    position=CH2pickedup(2)-Hpickedup(2);
                    switch(position)
                        case(1)                                                  % ... CH2... 2 to W-1
                                                                                 % ... H  ... downmost  2 to W-1    
                            [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                                CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,upCH2picked,leftCH2picked,rightCH2picked,...
                                Hpickedup,leftHpicked,rightHpicked,0); 
                        case(-1)                                                 % ... H  ...  2 to W-1
                                                                                 % ... CH2...  downmost  2 to W-1
                            [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                                CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,leftCH2picked,rightCH2picked,0,...
                                Hpickedup,upHpicked,leftHpicked,rightHpicked);  
                    end
                case(1)                                                          % ... HCH2... downmost 2 to W-1
                    [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                        CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,upCH2picked,rightCH2picked,0,...
                        Hpickedup,upHpicked,leftHpicked,0); 
                case(-1)                                                         % ... CH2H... downmost 2 to W-1
                    [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                        CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,upCH2picked,leftCH2picked,0,...
                        Hpickedup,upHpicked,rightHpicked,0);
            end
    end
elseif CH2pickedup(2)>1&&CH2pickedup(2)<L&&Hpickedup(2)>1&&Hpickedup(2)<L
    checkleftright=(CH2pickedup(1)==W||Hpickedup(1)==W);
    switch(checkleftright)
        case(0)                                                   %leftmost
            RP=CH2pickedup(1)-Hpickedup(1); 
            switch(RP)
                case(0)                                           %same column
                    position=CH2pickedup(2)-Hpickedup(2);
                    switch(position)
                        case(1)                                                 % CH2......  leftmost 2 to L-1
                                                                                % H......    leftmost 2 to L-1
                            [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                                CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,upCH2picked,rightCH2picked,0,...
                                Hpickedup,downHpicked,rightHpicked,0); 
                        case(-1)                                                % H......    leftmost 2 to L-1
                                                                                % CH2......  leftmost 2 to L-1  
                            [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                                CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,downCH2picked,rightCH2picked,0,...
                                Hpickedup,upHpicked,rightHpicked,0);  
                    end
                case(1)                                                         % HCH2......  leftmost 2 to L-1
                    [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                        CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,upCH2picked,downCH2picked,rightCH2picked,...
                        Hpickedup,upHpicked,downHpicked,0); 
                case(-1)                                                        % CH2H......  leftmost 2 to L-1
                    [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                        CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,upCH2picked,downCH2picked,0,...
                        Hpickedup,upHpicked,downHpicked,rightHpicked); 
            end
        case(1)                                                 %rightmost
            RP=CH2pickedup(1)-Hpickedup(1); 
            switch(RP)
                case(0)                                         %same column
                    position=CH2pickedup(2)-Hpickedup(2);
                    switch(position)
                        case(1)                                                % ......CH2  righttmost 2 to L-1
                                                                               % ......H    rightmost 2 to L-1 
                            [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                                CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,upCH2picked,leftCH2picked,0,...
                                Hpickedup,leftHpicked,downHpicked,0);           
                        case(-1)                                               % ......H    righttmost 2 to L-1
                                                                               % ......CH2  rightmost 2 to L-1 
                            [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                                CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,leftCH2picked,downCH2picked,0,...
                                Hpickedup,upHpicked,leftHpicked,0);
                    end
                case(1)                                                        % ......HCH2  righttmost 2 to L-1
                    [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                        CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,upCH2picked,downCH2picked,0,...
                        Hpickedup,upHpicked,leftHpicked,downHpicked); 
                case(-1)                                                       % ......CH2H  righttmost 2 to L-1
                    [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                        CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,upCH2picked,leftCH2picked,downCH2picked,...
                        Hpickedup,upHpicked,downHpicked,0); 
            end
    end
elseif CH2pickedup(2)==L||Hpickedup(2)==L                     %upcorners
    checkleftright=(CH2pickedup(1)==W||Hpickedup(1)==W);
    switch(checkleftright)
        case(0)                                               %upleft
            RP=CH2pickedup(1)-Hpickedup(1);
            switch(RP)
                case(0)                                       %same column
                    position=CH2pickedup(2)-Hpickedup(2);
                    switch(position)
                        case(1)                                                      %CH20000...upleft corner
                                                                                     %H  0000... 
                            [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                                CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,rightCH2picked,0,0,...
                                Hpickedup,downHpicked,rightHpicked,0); 
                        case(-1)                                                     %H   00000...upleft corner
                                                                                     %CH2 00000...
                            [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                                CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,rightCH2picked,downCH2picked,0,...
                                Hpickedup,rightHpicked,0,0); 
                    end
                case(1)                                                              %H CH20000...upleft corner
                                                                                     %0 0  0000...
                    [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                        CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,downCH2picked,rightCH2picked,0,...
                        Hpickedup,downHpicked,0,0);
                case(-1)                                                             %CH2H000...upleft corner
                                                                                     %0  0000...
                    [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                        CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,downCH2picked,0,0,...
                        Hpickedup,downHpicked,rightHpicked,0);  
            end
        case(1)                                               %upright
            RP=CH2pickedup(1)-Hpickedup(1);
            switch(RP)
                case(0)                                       %same column
                    position=CH2pickedup(2)-Hpickedup(2);
                    switch(position)
                        case(1)                                                      %...00000 CH2...upright corner
                                                                                     %...00000 H
                            [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                                CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,leftCH2picked,0,0,...
                                Hpickedup,leftHpicked,downHpicked,0); 
                        case(-1)                                                     %...00000 H...upright corner
                                                                                     %...00000 CH2
                            [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                                CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,leftCH2picked,downCH2picked,0,...
                                Hpickedup,leftHpicked,0,0); 
                    end
                case(1)                                                              %...0000H CH2...upright corner
                                                                                     %...00000 0
                    [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                        CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,downCH2picked,0,0,...
                        Hpickedup,leftHpicked,downHpicked,0); 
                case(-1)                                                             %...0000CH2 H...upright corner
                                                                                     %...00000   0
                    [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                        CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,downCH2picked,leftCH2picked,0,...
                        Hpickedup,downHpicked,0,0);  
            end
    end
else                                                         %downcorners
    checkleftright=(CH2pickedup(1)==W||Hpickedup(1)==W);
    switch(checkleftright)
        case(0)                                              %downleft
            RP=CH2pickedup(1)-Hpickedup(1);
            switch(RP)
                case(0)                                      %same column
                    position=CH2pickedup(2)-Hpickedup(2);
                    switch(position)
                        case(1)                                                      %CH2 00000 ...downleft corner
                                                                                     %H   00000...
                            [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                                CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,rightCH2picked,upCH2picked,0,...
                                Hpickedup,rightHpicked,0,0);
                        case(-1)                                                     %H  00000 ...downleft corner
                                                                                     %CH200000...
                            [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                                CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,rightCH2picked,0,0,...
                                Hpickedup,rightHpicked,upHpicked,0);   
                    end
                case(1)                                                              %0 0   00000 ...downleft corner
                                                                                     %H CH2 00000...
                    [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                        CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,upCH2picked,rightCH2picked,0,...
                        Hpickedup,upHpicked,0,0);
                case(-1)                                                             %0   0 00000 ...downleft corner
                                                                                     %CH2 H 00000...
                    [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                        CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,upCH2picked,0,0,...
                        Hpickedup,rightHpicked,upHpicked,0);  
            end
        case(1)                                             %downright
            RP=CH2pickedup(1)-Hpickedup(1);
            switch(RP)
                case(0)                                     %same column
                    position=CH2pickedup(2)-Hpickedup(2);
                    switch(position)
                        case(1)                                                      % ...000000 CH2 downright corner
                                                                                     % ...000000 H  
                            [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                                CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,leftCH2picked,upCH2picked,0,...
                                Hpickedup,leftHpicked,0,0);  
                        case(-1)                                                     % ...000000 H downright corner
                                                                                     % ...000000CH2  
                            [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                                CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,leftCH2picked,0,0,...
                                Hpickedup,upHpicked,leftHpicked,0);
                    end
                case(1)                                                              % ...000000 0 downright corner
                                                                                     % ...00000H CH2  
                    [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                        CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,upCH2picked,0,0,...
                        Hpickedup,upHpicked,leftHpicked,0);
                case(-1)                                                             % ...000000   0 downright corner
                                                                                     % ...00000CH2 H  
                    [NZE,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP]=CH3PcheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,...
                        CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CH2pickedup,upCH2picked,leftCH2picked,0,...
                        Hpickedup,upHpicked,0,0);   
            end
    end
end
