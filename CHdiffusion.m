function [NZE,Conf,CHDSP,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CH2PSP]=CHdiffusion(NZE,W,L,Conf,CH,CHDSP,H,CH3,CH2,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CH2PSP)

EPstore=zeros(4,2);

k=find(CHDSP);
N=ceil(rand(1)*numel(k));
ind=k(N);
n=ceil(ind/W);
m=ind-W*(n-1);
CHpickedup=[m n];  %pickup an random position for CH

upCHpicked=[CHpickedup(1),CHpickedup(2)+1];       %the position of its neighbours
downCHpicked=[CHpickedup(1),CHpickedup(2)-1];
leftCHpicked=[CHpickedup(1)-1,CHpickedup(2)];
rightCHpicked=[CHpickedup(1)+1,CHpickedup(2)];

if upCHpicked(2)<=L&&Conf(upCHpicked(1),upCHpicked(2))==0 %find the CH neighbours which is 0 
    EPstore(1,:)=upCHpicked;
end
if downCHpicked(2)>=1&&Conf(downCHpicked(1),downCHpicked(2))==0
    EPstore(2,:)=downCHpicked;
end
if leftCHpicked(1)>=1&&Conf(leftCHpicked(1),leftCHpicked(2))==0
    EPstore(3,:)=leftCHpicked;
end
if rightCHpicked(1)<=W&&Conf(rightCHpicked(1),rightCHpicked(2))==0
    EPstore(4,:)=rightCHpicked;
end

index=find(EPstore(:,1));
row=ceil(rand(1)*length(index));
EPpickedup=EPstore(index(row),:);  % randomly pick up an position which is 0 

upEPpicked=[EPpickedup(1),EPpickedup(2)+1]; % find the neighbours of this 0 site
downEPpicked=[EPpickedup(1),EPpickedup(2)-1];
leftEPpicked=[EPpickedup(1)-1,EPpickedup(2)];
rightEPpicked=[EPpickedup(1)+1,EPpickedup(2)];                                         

Conf(CHpickedup(1),CHpickedup(2))=0;  % update the configuration of the lattice
Conf(EPpickedup(1),EPpickedup(2))=CH;

CHDSP(EPpickedup(1),EPpickedup(2))=CHDSP(EPpickedup(1),EPpickedup(2))+1;%addevent(CHDSP,EPpickedup,'CHDSP');
CHDSP(CHpickedup(1),CHpickedup(2))=0; %remove CH dissociation at this site

if CHpickedup(1)>1&&CHpickedup(1)<W&&CHpickedup(2)>1&&CHpickedup(2)<L&&EPpickedup(1)>1&&EPpickedup(1)<W&&EPpickedup(2)>1&&EPpickedup(2)<L
    RP=CHpickedup(1)-EPpickedup(1);%relative position
    switch(RP)
        case(0)% the same column
            position=CHpickedup(2)-EPpickedup(2);
            switch(position)
                case(1)                                                % .....CH.....  
                                                                       % .....EP  ..... 
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,upCHpicked);           
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,leftCHpicked);
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,rightCHpicked);
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,leftEPpicked);
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,downEPpicked);
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,rightEPpicked);   
                case(-1)                                               % .....EP  .....  
                                                                       % .....CH.....
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,upEPpicked);                 
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,leftEPpicked);                
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,rightEPpicked);
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,leftCHpicked);
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,downCHpicked);
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,rightCHpicked);
            end
        case(1)                                                         % .....EPCH..... 
            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,upEPpicked); 
            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,leftEPpicked);
            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,downEPpicked);
            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,upCHpicked); 
            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,rightCHpicked);
            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,downCHpicked);
        case(-1)                                                        % .....CHEP..... 
            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,upCHpicked);  
            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,leftCHpicked);
            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,downCHpicked); 
            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,upEPpicked);  
            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,rightEPpicked);
            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,downEPpicked); 
    end
elseif CHpickedup(1)>1&&CHpickedup(1)<W&&EPpickedup(1)>1&&EPpickedup(1)<W
    checkupdown=(CHpickedup(2)==1||EPpickedup(2)==1);
    switch(checkupdown)   
        case(0)                                                        %upmost
            RP=CHpickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)      %same column                      
                    position=CHpickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                 % ... CH... upmost 2 to W-1
                                                                                % ... EP  ...        2 to W-1
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,leftCHpicked);          
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,rightCHpicked);
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,leftEPpicked);
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,rightEPpicked); 
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,downEPpicked); 
                        case(-1)                                                % ... EP  ... upmost 2 to W-1
                                                                                % ... CH...        2 to W-1
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,leftCHpicked);              
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,rightCHpicked);
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,downCHpicked); 
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,leftEPpicked); 
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,rightEPpicked); 
                    end
                case(1)                                                         % ... EPCH... upmost 2 to W-1
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,rightCHpicked); 
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,downCHpicked); 
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,leftEPpicked);
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,downEPpicked);
                case(-1)                                                        % ... CHEP... upmost 2 to W-1
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,leftCHpicked); 
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,downCHpicked); 
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,rightEPpicked); 
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,downEPpicked); 
            end
        case(1)                                                      %downmost
            RP=CHpickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)            %same column
                    position=CHpickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                  % ... CH... 2 to W-1
                                                                                 % ... EP  ... downmost  2 to W-1 
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,upCHpicked);                
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,leftCHpicked); 
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,rightCHpicked);
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,leftEPpicked); 
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,rightEPpicked);
                        case(-1)                                                 % ... EP  ...  2 to W-1
                                                                                 % ... CH...  downmost  2 to W-1
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,leftCHpicked);           
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,rightCHpicked); 
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,upEPpicked);  
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,leftEPpicked);
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,rightEPpicked); 
                    end
                case(1)                                                          % ... EPCH... downmost 2 to W-1
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,upCHpicked); 
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,rightCHpicked);
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,upEPpicked);  
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,leftEPpicked); 
                case(-1)                                                         % ... CHEP... downmost 2 to W-1
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,upCHpicked);   
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,leftCHpicked); 
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,upEPpicked); 
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,rightEPpicked); 
            end
    end
elseif CHpickedup(2)>1&&CHpickedup(2)<L&&EPpickedup(2)>1&&EPpickedup(2)<L
    checkleftright=(CHpickedup(1)==W||EPpickedup(1)==W);
    switch(checkleftright)
        case(0)                                                   %leftmost
            RP=CHpickedup(1)-EPpickedup(1); 
            switch(RP)
                case(0)                                           %same column
                    position=CHpickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                 % CH......  leftmost 2 to L-1
                                                                                % EP......    leftmost 2 to L-1
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,upCHpicked);            
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,rightCHpicked);
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,downEPpicked);
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,rightEPpicked);
                        case(-1)                                                % EP......    leftmost 2 to L-1
                                                                                % CH......  leftmost 2 to L-1 
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,downCHpicked);           
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,rightCHpicked); 
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,upEPpicked);  
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,rightEPpicked); 
                    end
                case(1)                                                         % EPCH......  leftmost 2 to L-1
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,upCHpicked); 
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,downCHpicked);
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,rightCHpicked);  
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,upEPpicked);  
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,downEPpicked); 
                case(-1)                                                        % CHEP......  leftmost 2 to L-1
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,upCHpicked); 
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,downCHpicked);
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,upEPpicked);  
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,downEPpicked); 
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,rightEPpicked); 
            end
        case(1)                                                 %rightmost
            RP=CHpickedup(1)-EPpickedup(1); 
            switch(RP)
                case(0)                                         %same column
                    position=CHpickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                % ......CH  righttmost 2 to L-1
                                                                               % ......EP    rightmost 2 to L-1 
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,upCHpicked);           
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,leftCHpicked);
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,leftEPpicked); 
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,downEPpicked); 
                        case(-1)                                               % ......EP    righttmost 2 to L-1
                                                                               % ......CH  rightmost 2 to L-1 
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,leftCHpicked);         
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,downCHpicked); 
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,upEPpicked);  
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,leftEPpicked); 
                    end
                case(1)                                                        % ......EPCH  righttmost 2 to L-1
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,upCHpicked);  
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,downCHpicked);
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,upEPpicked);  
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,leftEPpicked); 
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,downEPpicked);
                case(-1)                                                       % ......CHEP  righttmost 2 to L-1
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,upCHpicked); 
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,leftCHpicked); 
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,downCHpicked);
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,upEPpicked); 
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,downEPpicked); 
            end
    end
elseif CHpickedup(2)==L||EPpickedup(2)==L                     %upcorners
    checkleftright=(CHpickedup(1)==W||EPpickedup(1)==W);
    switch(checkleftright)
        case(0)                                               %upleft
            RP=CHpickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)                                       %same column
                    position=CHpickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                      %CH0000...upleft corner
                                                                                     %EP0000...
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,rightCHpicked);               
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,downEPpicked);
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,rightEPpicked);
                        case(-1)                                                     %EP 00000...upleft corner
                                                                                     %CH 00000...
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,rightCHpicked);              
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,downCHpicked);
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,rightEPpicked);
                    end
                case(1)                                                              %EP CH0000...upleft corner
                                                                                     %0 0  0000...
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,downCHpicked);                       
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,rightCHpicked);
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,downEPpicked);
                case(-1)                                                             %CH EP000...upleft corner
                                                                                     %0  0000...
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,downCHpicked);                       
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,downEPpicked);
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,rightEPpicked);
            end
        case(1)                                               %upright
            RP=CHpickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)                                       %same column
                    position=CHpickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                      %...00000 CH...upright corner
                                                                                     %...00000 EP
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,leftCHpicked);              
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,leftEPpicked);
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,downEPpicked); 
                        case(-1)                                                     %...00000 EP...upright corner
                                                                                     %...00000 CH
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,leftCHpicked);               
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,downCHpicked);
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,leftEPpicked);
                    end
                case(1)                                                              %...0000EP CH...upright corner
                                                                                     %...00000 0
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,downCHpicked);                      
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,leftEPpicked);
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,downEPpicked); 
                case(-1)                                                             %...0000CH EP...upright corner
                                                                                     %...00000   0
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,downCHpicked);                       
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,leftCHpicked); 
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,downEPpicked);
            end
    end
else                                                         %downcorners
    checkleftright=(CHpickedup(1)==W||EPpickedup(1)==W);
    switch(checkleftright)
        case(0)                                              %downleft
            RP=CHpickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)                                      %same column
                    position=CHpickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                      %CH 00000 ...downleft corner
                                                                                     %EP 00000...
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,rightCHpicked);              
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,upCHpicked); 
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,rightEPpicked); 
                        case(-1)                                                     %EP00000 ...downleft corner
                                                                                     %CH00000...
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,rightCHpicked);              
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,rightEPpicked);
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,upEPpicked); 
                    end
                case(1)                                                              %0 0  00000 ...downleft corner
                                                                                     %EPCH 00000...
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,upCHpicked);                         
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,rightCHpicked);
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,upEPpicked); 
                case(-1)                                                             %0  0 00000 ...downleft corner
                                                                                     %CH EP00000...
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,upCHpicked);                         
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,rightEPpicked);
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,upEPpicked);  
            end
        case(1)                                             %downright
            RP=CHpickedup(1)-EPpickedup(1);
            switch(RP)
                case(0)                                     %same column
                    position=CHpickedup(2)-EPpickedup(2);
                    switch(position)
                        case(1)                                                      % ...000000 CH downright corner
                                                                                     % ...000000 EP
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,leftCHpicked);                
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,upCHpicked);  
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,leftEPpicked); 
                        case(-1)                                                     % ...000000EP downright corner
                                                                                     % ...000000CH
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,leftCHpicked);                
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,upEPpicked);  
                            [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,leftEPpicked);
                    end
                case(1)                                                              % ...000000 0 downright corner
                                                                                     % ...00000EPC 
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,upCHpicked);                          
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,upEPpicked);  
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,leftEPpicked);
                case(-1)                                                             % ...000000  0 downright corner
                                                                                     % ...00000CH EP 
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,upCHpicked);                          
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP,CHpickedup,leftCHpicked); 
                    [NZE,Conf,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CH2PSP]=CHdiffusioncheckCHNB(NZE,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,CHDSP,CH2PSP,CH2DSP,CH3DSP,CdiffusionSP,C3diffusionSP,EPpickedup,upEPpicked); 
            end
    end
end
end