function [ystore,NZE,Conf,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=Hdiffusion(NZE,W,L,...
    Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,ystore,CX)

EPstore=zeros(4,2); 

k=find(HdiffusionSP);
N=ceil(rand(1)*numel(k));
ind=k(N);
n=ceil(ind/W);
m=ind-W*(n-1);
Hpickedup=[m n];%pickup an random position for H


upHpicked=[Hpickedup(1),Hpickedup(2)+1];       %the position of its neighbours
downHpicked=[Hpickedup(1),Hpickedup(2)-1];
leftHpicked=[Hpickedup(1)-1,Hpickedup(2)];
rightHpicked=[Hpickedup(1)+1,Hpickedup(2)];

if upHpicked(2)<=L&&Conf(upHpicked(1),upHpicked(2))==0 %find the H neighbours which is 0 
    EPstore(1,:)=upHpicked;
end
if downHpicked(2)>=1&&Conf(downHpicked(1),downHpicked(2))==0
    EPstore(2,:)=downHpicked;
end
if leftHpicked(1)>=1&&Conf(leftHpicked(1),leftHpicked(2))==0
    EPstore(3,:)=leftHpicked;
end
if rightHpicked(1)<=W&&Conf(rightHpicked(1),rightHpicked(2))==0
    EPstore(4,:)=rightHpicked;
end

index=find(EPstore(:,1));
row=ceil(rand(1)*length(index));
EPpickedup=EPstore(index(row),:);  % randomly pick up an position which is 0 

upEPpicked=[EPpickedup(1),EPpickedup(2)+1]; % find the neighbours of this 0 site
downEPpicked=[EPpickedup(1),EPpickedup(2)-1];
leftEPpicked=[EPpickedup(1)-1,EPpickedup(2)];
rightEPpicked=[EPpickedup(1)+1,EPpickedup(2)];                                         

Conf(Hpickedup(1),Hpickedup(2))=0;  % update the configuration of the lattice
Conf(EPpickedup(1),EPpickedup(2))=H;

HdiffusionSP(EPpickedup(1),EPpickedup(2))=1;%addevent(HdiffusionSP,EPpickedup,'HdiffusionSP');

HdiffusionSP(Hpickedup(1),Hpickedup(2))=0; %remove H diffusion at this site

ystore=scanNBP(ystore,Conf,W,L,CX,Hpickedup,upHpicked,downHpicked,leftHpicked,rightHpicked,[],0,0,0,0);
ystore=scanNBD(ystore,Conf,W,L,CX,upEPpicked,downEPpicked,leftEPpicked,rightEPpicked);

if Hpickedup(1)>1&&Hpickedup(1)<W&&Hpickedup(2)>1&&Hpickedup(2)<L&&EPpickedup(1)>1&&EPpickedup(1)<W&&EPpickedup(2)>1&&EPpickedup(2)<L
    RP=Hpickedup(1)-EPpickedup(1);%relative position
    switch(RP)
        case(0)% the same column
            position=Hpickedup(2)-EPpickedup(2);
            switch(position)
                case(1)                                                % .....H.....  
                                                                       % .....EP  ..... 
                    [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                        CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,upHpicked,leftHpicked,rightHpicked,...
                        EPpickedup,leftEPpicked,downEPpicked,rightEPpicked);          
                    
                    
                     
                case(-1)                                               % .....EP  .....  
                                                                       % .....H.....           
                    
                    [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                        CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,leftHpicked,downHpicked,rightHpicked,...
                        EPpickedup,upEPpicked,leftEPpicked,rightEPpicked);
            end
        case(1)                                                         % .....EPH.....  

            [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,upHpicked,rightHpicked,downHpicked,...
                EPpickedup,upEPpicked,leftEPpicked,downEPpicked); 

        case(-1)                                                        % .....HEP..... 
            [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,upHpicked,leftHpicked,downHpicked,...
                EPpickedup,upEPpicked,rightEPpicked,downEPpicked);  
   
    end
elseif Hpickedup(1)>1&&Hpickedup(1)<W&&EPpickedup(1)>1&&EPpickedup(1)<W
    checkupdown=(Hpickedup(2)==1||EPpickedup(2)==1);
    switch(checkupdown)   
        case(0)                                                        %upmost
            RP=Hpickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)      %same column                      
                    position=Hpickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                 % ... H... upmost 2 to W-1
                                                                                % ... EP...        2 to W-1
                            [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                                CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,leftHpicked,rightHpicked,0,...
                                EPpickedup,leftEPpicked,rightEPpicked,downEPpicked);          
                           

                        case(-1)                                                % ... EP  ... upmost 2 to W-1
                                                                                % ... H...           2 to W-1
                            [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                                CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,leftHpicked,rightHpicked,downHpicked,...
                                EPpickedup,leftEPpicked,rightEPpicked,0);              


                    end
                case(1)                                                         % ... EPH... upmost 2 to W-1
                    [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                        CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,rightHpicked,downHpicked,0,...
                        EPpickedup,leftEPpicked,downEPpicked,0); 

                case(-1)                                                        % ... HEP... upmost 2 to W-1
                    [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                        CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,leftHpicked,downHpicked,0,...
                        EPpickedup,rightEPpicked,downEPpicked,0); 

            end
        case(1)                                                      %downmost
            RP=Hpickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)            %same column
                    position=Hpickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                  % ... H... 2 to W-1
                                                                                 % ... EP  ... downmost  2 to W-1 
                            [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                                CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,upHpicked,leftHpicked,rightHpicked,...
                                EPpickedup,leftEPpicked,rightEPpicked,0);                
                            
                        case(-1)                                                 % ... EP  ...  2 to W-1
                                                                                 % ... H...  downmost  2 to W-1
                            [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                                CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,leftHpicked,rightHpicked,0,...
                                EPpickedup,upEPpicked,leftEPpicked,rightEPpicked);             

                    end
                case(1)                                                          % ... EPH... downmost 2 to W-1
                    [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                        CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,upHpicked,rightHpicked,0,...
                        EPpickedup,upEPpicked,leftEPpicked,0); 
 
                case(-1)                                                         % ... HEP... downmost 2 to W-1
                    [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                        CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,upHpicked,leftHpicked,0,...
                        EPpickedup,upEPpicked,rightEPpicked,0);   
 
            end
    end
elseif Hpickedup(2)>1&&Hpickedup(2)<L&&EPpickedup(2)>1&&EPpickedup(2)<L
    checkleftright=(Hpickedup(1)==W||EPpickedup(1)==W);
    switch(checkleftright)
        case(0)                                                   %leftmost
            RP=Hpickedup(1)-EPpickedup(1); 
            switch(RP)
                case(0)                                           %same column
                    position=Hpickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                 % H......  leftmost 2 to L-1
                                                                                % EP......    leftmost 2 to L-1
                            [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                                CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,upHpicked,rightHpicked,0,...
                                EPpickedup,downEPpicked,rightEPpicked,0);            

                        case(-1)                                                % EP......    leftmost 2 to L-1
                                                                                % H......  leftmost 2 to L-1
                            [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                                CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,downHpicked,rightHpicked,0,...
                                EPpickedup,upEPpicked,rightEPpicked,0);            
   
                    end
                case(1)                                                         % EPH......  leftmost 2 to L-1
                    [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                        CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,upHpicked,downHpicked,rightHpicked,...
                        EPpickedup,upEPpicked,downEPpicked,0); 
 
 
                case(-1)                                                        % HEP......  leftmost 2 to L-1
                    [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                        CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,upHpicked,downHpicked,0,...
                        EPpickedup,upEPpicked,downEPpicked,rightEPpicked);  

            end
        case(1)                                                 %rightmost
            RP=Hpickedup(1)-EPpickedup(1); 
            switch(RP)
                case(0)                                         %same column
                    position=Hpickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                % ......H  righttmost 2 to L-1
                                                                               % ......EP    rightmost 2 to L-1 
                            [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                                CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,upHpicked,leftHpicked,0,...
                                EPpickedup,leftEPpicked,downEPpicked,0);           
                            
                        case(-1)                                               % ......ep    righttmost 2 to L-1
                                                                               % ......h  rightmost 2 to L-1 
                            [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                                CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,leftHpicked,downHpicked,0,...
                                EPpickedup,upEPpicked,leftEPpicked,0);         
                            
                    end
                case(1)                                                        % ......EPH  righttmost 2 to L-1
                    [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                        CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,upHpicked,downHpicked,0,...
                        EPpickedup,upEPpicked,leftEPpicked,downEPpicked);   
                    
                case(-1)                                                       % ......HEP  righttmost 2 to L-1
                    [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                        CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,upHpicked,leftHpicked,downHpicked,...
                        EPpickedup,upEPpicked,downEPpicked,0); 

            end
    end
elseif Hpickedup(2)==L||EPpickedup(2)==L                     %upcorners
    checkleftright=(Hpickedup(1)==W||EPpickedup(1)==W);
    switch(checkleftright)
        case(0)                                               %upleft
            RP=Hpickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)                                       %same column
                    position=Hpickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                      %H 0000...upleft corner
                                                                                     %EP0000... 
                            [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                                CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,rightHpicked,0,0,...
                                EPpickedup,downEPpicked,rightEPpicked,0);              


                        case(-1)                                                     %EP 00000...upleft corner
                                                                                     %H  00000...
                            [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                                CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,rightHpicked,downHpicked,0,...
                                EPpickedup,rightEPpicked,0,0);              
                           
                    end
                case(1)                                                              %EPH0000...upleft corner
                                                                                     %0 00000...
                    [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                        CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,downHpicked,rightHpicked,0,...
                        EPpickedup,downEPpicked,0,0);                       
                    
                case(-1)                                                             %HEP000...upleft corner
                                                                                     %0 0000...
                    [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                        CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,downHpicked,0,0,...
                        EPpickedup,downEPpicked,rightEPpicked,0);                       

            end
        case(1)                                               %upright
            RP=Hpickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)                                       %same column
                    position=Hpickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                      %...00000 H...upright corner
                                                                                     %...00000 EP
                            [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                                CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,leftHpicked,0,0,...
                                EPpickedup,leftEPpicked,downEPpicked,0);               

                             
                        case(-1)                                                     %...00000 EP...upright corner
                                                                                     %...00000 H
                            [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                                CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,leftHpicked,downHpicked,0,...
                                EPpickedup,leftEPpicked,0,0);               

                    end
                case(1)                                                              %...0000EP H...upright corner
                    [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                        CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,downHpicked,0,0,...
                        EPpickedup,leftEPpicked,downEPpicked,0);                       %...00000 0

                case(-1)                                                             %...0000H EP...upright corner
                    [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                        CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,downHpicked,leftHpicked,0,...
                        EPpickedup,downEPpicked,0,0);                       %...00000   0

            end
    end
else                                                         %downcorners
    checkleftright=(Hpickedup(1)==W||EPpickedup(1)==W);
    switch(checkleftright)
        case(0)                                              %downleft
            RP=Hpickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)                                      %same column
                    position=Hpickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                      %H 00000 ...downleft corner
                                                                                     %EP   00000...           
                            [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                                CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,rightHpicked,upHpicked,0,...
                                EPpickedup,rightEPpicked,0,0);              

                        case(-1)                                                     %EP  00000 ...downleft corner
                                                                                     %H00000...
                            [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                                CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,rightHpicked,0,0,...
                                EPpickedup,rightEPpicked,upEPpicked,0);              

                           
                    end
                case(1)                                                              %0  0 00000 ...downleft corner
                                                                                     %EP H 00000...
                    [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                        CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,upHpicked,rightHpicked,0,...
                        EPpickedup,upEPpicked,0,0);                         
 
                case(-1)                                                             %0 0 00000 ...downleft corner
                                                                                     %H EP 00000...
                    [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                        CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,upHpicked,0,0,...
                        EPpickedup,rightEPpicked,upEPpicked,0);                         
 
            end
        case(1)                                             %downright
            RP=Hpickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)                                     %same column
                    position=Hpickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                      % ...000000 H downright corner
                                                                                     % ...000000 EP 
                            [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                                CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,leftHpicked,upHpicked,0,...
                                EPpickedup,leftEPpicked,0,0);                
   
                        case(-1)                                                     % ...000000 EP downright corner
                                                                                     % ...000000 H
                            [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                                CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,leftHpicked,0,0,...
                                EPpickedup,upEPpicked,leftEPpicked,0);                

                    end
                case(1)                                                              % ...000000 0 downright corner
                                                                                     % ...00000EPH
                    [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                        CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,upHpicked,0,0,...
                        EPpickedup,upEPpicked,leftEPpicked,0);                            

                case(-1)                                                             % ...000000 0 downright corner
                                                                                     % ...00000H EP 
                    [NZE,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=HdiffusioncheckNB(NZE,Conf,H,CH3,CH2,...
                        CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Hpickedup,upHpicked,leftHpicked,0,...
                        EPpickedup,upEPpicked,0,0);                          
  
            end
    end
end
end