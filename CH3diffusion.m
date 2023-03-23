function [NZE,Conf,CH3DSP,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusion(NZE,W,L,Conf,CH3,CH3DSP,H,CH2,CH,C,C3,...
    HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH2DSP,CHDSP,CH4PSP)

EPstore=zeros(4,2); 

k=find(CH3DSP);
N=ceil(rand(1)*numel(k));
ind=k(N);
n=ceil(ind/W);
m=ind-W*(n-1);
CH3pickedup=[m n];  %pickup an random position for CH3

upCH3picked=[CH3pickedup(1),CH3pickedup(2)+1];       %the position of its neighbours
downCH3picked=[CH3pickedup(1),CH3pickedup(2)-1];
leftCH3picked=[CH3pickedup(1)-1,CH3pickedup(2)];
rightCH3picked=[CH3pickedup(1)+1,CH3pickedup(2)];

if upCH3picked(2)<=L&&Conf(upCH3picked(1),upCH3picked(2))==0 %find the CH3 neighbours which is 0 
    EPstore(1,:)=upCH3picked;
end
if downCH3picked(2)>=1&&Conf(downCH3picked(1),downCH3picked(2))==0
    EPstore(2,:)=downCH3picked;
end
if leftCH3picked(1)>=1&&Conf(leftCH3picked(1),leftCH3picked(2))==0
    EPstore(3,:)=leftCH3picked;
end
if rightCH3picked(1)<=W&&Conf(rightCH3picked(1),rightCH3picked(2))==0
    EPstore(4,:)=rightCH3picked;
end

index=find(EPstore(:,1));
row=ceil(rand(1)*length(index));
EPpickedup=EPstore(index(row),:);  % randomly pick up an position which is 0 

upEPpicked=[EPpickedup(1),EPpickedup(2)+1]; % find the neighbours of this 0 site
downEPpicked=[EPpickedup(1),EPpickedup(2)-1];
leftEPpicked=[EPpickedup(1)-1,EPpickedup(2)];
rightEPpicked=[EPpickedup(1)+1,EPpickedup(2)];                                         

Conf(CH3pickedup(1),CH3pickedup(2))=0;  % update the configuration of the lattice
Conf(EPpickedup(1),EPpickedup(2))=CH3;

CH3DSP(EPpickedup(1),EPpickedup(2))=1;%addevent(CH3DSP,EPpickedup,'CH3DSP');

CH3DSP(CH3pickedup(1),CH3pickedup(2))=0; %remove CH3 dissociation at this site

if CH3pickedup(1)>1&&CH3pickedup(1)<W&&CH3pickedup(2)>1&&CH3pickedup(2)<L&&EPpickedup(1)>1&&EPpickedup(1)<W&&EPpickedup(2)>1&&EPpickedup(2)<L
    RP=CH3pickedup(1)-EPpickedup(1);%relative position
    switch(RP)
        case(0)% the same column
            position=CH3pickedup(2)-EPpickedup(2);
            switch(position)
                case(1)                                                % .....CH3.....  
                                                                       % .....H  .....
                    [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                        HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,upCH3picked,leftCH3picked,rightCH3picked,...
                        EPpickedup,leftEPpicked,downEPpicked,rightEPpicked);            
 
                case(-1)                                               % .....H  .....  
                                                                       % .....CH3.....

                    [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                        HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,leftCH3picked,downCH3picked,rightCH3picked,...
                        EPpickedup,upEPpicked,leftEPpicked,rightEPpicked);

            end
        case(1)                                                         % .....HCH3..... 

            [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,upCH3picked,rightCH3picked,downCH3picked,...
                EPpickedup,upEPpicked,leftEPpicked,downEPpicked); 
 
        case(-1)                                                        % .....CH3H..... 
            [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,upCH3picked,leftCH3picked,downCH3picked,...
                EPpickedup,upEPpicked,rightEPpicked,downEPpicked);  

    end
elseif CH3pickedup(1)>1&&CH3pickedup(1)<W&&EPpickedup(1)>1&&EPpickedup(1)<W
    checkupdown=(CH3pickedup(2)==1||EPpickedup(2)==1);
    switch(checkupdown)   
        case(0)                                                        %upmost
            RP=CH3pickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)      %same column                      
                    position=CH3pickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                 % ... CH3... upmost 2 to W-1
                                                                                % ... H  ...        2 to W-1
                            [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                                HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,leftCH3picked,rightCH3picked,0,...
                                EPpickedup,leftEPpicked,rightEPpicked,downEPpicked);          

                        case(-1)                                                % ... H  ... upmost 2 to W-1
                                                                                % ... CH3...        2 to W-1 
                            [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                                HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,leftCH3picked,rightCH3picked,downCH3picked,...
                                EPpickedup,leftEPpicked,rightEPpicked,0);             

                    end
                case(1)                                                         % ... HCH3... upmost 2 to W-1
                    [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                        HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,rightCH3picked,downCH3picked,0,...
                        EPpickedup,leftEPpicked,downEPpicked,0); 
                    
                case(-1)                                                        % ... CH3H... upmost 2 to W-1
                    [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                        HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,leftCH3picked,downCH3picked,0,...
                        EPpickedup,rightEPpicked,downEPpicked,0); 
 
            end
        case(1)                                                      %downmost
            RP=CH3pickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)            %same column
                    position=CH3pickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                  % ... CH3... 2 to W-1
                                                                                 % ... H  ... downmost  2 to W-1
                            [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                                HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,upCH3picked,leftCH3picked,rightCH3picked,...
                                EPpickedup,leftEPpicked,rightEPpicked,0);                 

                        case(-1)                                                 % ... H  ...  2 to W-1
                                                                                 % ... CH3...  downmost  2 to W-1
                            [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                                HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,leftCH3picked,rightCH3picked,0,...
                                EPpickedup,upEPpicked,leftEPpicked,rightEPpicked);           

                    end
                case(1)                                                          % ... HCH3... downmost 2 to W-1
                    [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                        HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,upCH3picked,rightCH3picked,0,...
                        EPpickedup,upEPpicked,leftEPpicked,0); 

                case(-1)                                                         % ... CH3H... downmost 2 to W-1
                    [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                        HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,upCH3picked,leftCH3picked,0,...
                        EPpickedup,upEPpicked,rightEPpicked,0);   
            end
    end
elseif CH3pickedup(2)>1&&CH3pickedup(2)<L&&EPpickedup(2)>1&&EPpickedup(2)<L
    checkleftright=(CH3pickedup(1)==W||EPpickedup(1)==W);
    switch(checkleftright)
        case(0)                                                   %leftmost
            RP=CH3pickedup(1)-EPpickedup(1); 
            switch(RP)
                case(0)                                           %same column
                    position=CH3pickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                 % CH3......  leftmost 2 to L-1
                                                                                % H......    leftmost 2 to L-1
                            [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                                HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,upCH3picked,rightCH3picked,0,...
                                EPpickedup,downEPpicked,rightEPpicked,0);            

                        case(-1)                                                % H......    leftmost 2 to L-1
                                                                                % CH3......  leftmost 2 to L-1 
                            [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                                HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,downCH3picked,rightCH3picked,0,...
                                EPpickedup,upEPpicked,rightEPpicked,0);           

                    end
                case(1)                                                         % HCH3......  leftmost 2 to L-1
                    [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                        HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,upCH3picked,downCH3picked,rightCH3picked,...
                        EPpickedup,upEPpicked,downEPpicked,0); 
 
                case(-1)                                                        % CH3H......  leftmost 2 to L-1
                    [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                        HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,upCH3picked,downCH3picked,0,...
                        EPpickedup,upEPpicked,downEPpicked,rightEPpicked); 

            end
        case(1)                                                 %rightmost
            RP=CH3pickedup(1)-EPpickedup(1); 
            switch(RP)
                case(0)                                         %same column
                    position=CH3pickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                % ......CH3  righttmost 2 to L-1
                                                                               % ......H    rightmost 2 to L-1 
                            [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                                HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,upCH3picked,leftCH3picked,0,...
                                EPpickedup,leftEPpicked,downEPpicked,0);           

                        case(-1)                                               % ......H    righttmost 2 to L-1
                                                                               % ......CH3  rightmost 2 to L-1
                            [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                                HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,leftCH3picked,downCH3picked,0,...
                                EPpickedup,upEPpicked,leftEPpicked,0);          

                    end
                case(1)                                                        % ......HCH3  righttmost 2 to L-1
                    [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                        HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,upCH3picked,downCH3picked,0,...
                        EPpickedup,upEPpicked,leftEPpicked,downEPpicked);  

                case(-1)                                                       % ......CH3H  righttmost 2 to L-1
                    [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                        HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,upCH3picked,leftCH3picked,downCH3picked,...
                        EPpickedup,upEPpicked,downEPpicked,0); 
            end
    end
elseif CH3pickedup(2)==L||EPpickedup(2)==L                     %upcorners
    checkleftright=(CH3pickedup(1)==W||EPpickedup(1)==W);
    switch(checkleftright)
        case(0)                                               %upleft
            RP=CH3pickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)                                       %same column
                    position=CH3pickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                      %CH30000...upleft corner
                                                                                     %H  0000... 
                            [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                                HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,rightCH3picked,0,0,...
                                EPpickedup,downEPpicked,rightEPpicked,0);              

                        case(-1)                                                     %H   00000...upleft corner
                                                                                     %CH3 00000...
                            [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                                HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,rightCH3picked,downCH3picked,0,...
                                EPpickedup,rightEPpicked,0,0);              

                    end
                case(1)                                                              %H CH30000...upleft corner
                                                                                     %0 0  0000...
                    [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                        HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,downCH3picked,rightCH3picked,0,...
                        EPpickedup,downEPpicked,0,0);                       

                case(-1)                                                             %CH3H000...upleft corner
                                                                                     %0  0000...
                    [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                        HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,downCH3picked,0,0,...
                        EPpickedup,downEPpicked,rightEPpicked,0);                       

            end
        case(1)                                               %upright
            RP=CH3pickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)                                       %same column
                    position=CH3pickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                      %...00000 CH3...upright corner
                                                                                     %...00000 H
                            [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                                HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,leftCH3picked,0,0,...
                                EPpickedup,leftEPpicked,downEPpicked,0);               
 
                        case(-1)                                                     %...00000 H...upright corner
                                                                                     %...00000 CH3
                            [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                                HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,leftCH3picked,downCH3picked,0,...
                            EPpickedup,leftEPpicked,0,0);               

                    end
                case(1)                                                              %...0000H CH3...upright corner
                                                                                     %...00000 0
                    [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                        HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,downCH3picked,0,0,...
                        EPpickedup,leftEPpicked,downEPpicked,0);                       

                case(-1)                                                             %...0000CH3 H...upright corner
                                                                                     %...00000   0
                    [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                        HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,downCH3picked,leftCH3picked,0,...
                        EPpickedup,downEPpicked,0,0);                       
 
            end
    end
else                                                         %downcorners
    checkleftright=(CH3pickedup(1)==W||EPpickedup(1)==W);
    switch(checkleftright)
        case(0)                                              %downleft
            RP=CH3pickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)                                      %same column
                    position=CH3pickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                      %CH3 00000 ...downleft corner
                                                                                     %H   00000...
                            [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                                HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,rightCH3picked,upCH3picked,0,...
                                EPpickedup,rightEPpicked,0,0);              
 
                        case(-1)                                                     %H  00000 ...downleft corner
                                                                                     %CH300000...
                            [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                                HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,rightCH3picked,0,0,...
                                EPpickedup,rightEPpicked,upEPpicked,0);              

                    end
                case(1)                                                              %0 0   00000 ...downleft corner
                                                                                     %H CH3 00000...
                    [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                        HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,upCH3picked,rightCH3picked,0,...
                        EPpickedup,upEPpicked,0,0);                         

                case(-1)                                                             %0   0 00000 ...downleft corner
                                                                                     %CH3 H 00000...
                    [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                        HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,upCH3picked,0,0,...
                        EPpickedup,rightEPpicked,upEPpicked,0);                         
 
            end
        case(1)                                             %downright
            RP=CH3pickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)                                     %same column
                    position=CH3pickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                      % ...000000 CH3 downright corner
                                                                                     % ...000000 H 
                            [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                                HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,leftCH3picked,upCH3picked,0,...
                                EPpickedup,leftEPpicked,0,0);                

                        case(-1)                                                     % ...000000 H downright corner
                                                                                     % ...000000CH3
                            [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                                HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,leftCH3picked,0,0,...
                                EPpickedup,upEPpicked,leftEPpicked,0);                 

                    end
                case(1)                                                              % ...000000 0 downright corner
                                                                                     % ...00000H CH3
                    [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                        HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,upCH3picked,0,0,...
                        EPpickedup,upEPpicked,leftEPpicked,0);                           

                case(-1)                                                             % ...000000   0 downright corner
                                                                                     % ...00000CH3 H 
                    [NZE,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusioncheckNB(NZE,Conf,H,CH3,CH2,CH,C,C3,...
                        HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH4PSP,CH3pickedup,upCH3picked,leftCH3picked,0,...
                        EPpickedup,upEPpicked,0,0);                          

            end
    end
end
end