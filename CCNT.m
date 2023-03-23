function [ystore,NZE,Conf,CNum,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP]=CCNT(NZE,W,L,Conf,CNum,C,CdiffusionSP,H,CH3,CH2,CH,C2,C3,...
    CX,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP,ystore)

k=find(CCNTSP);
N=ceil(rand(1)*numel(k));
ind=k(N);
n=ceil(ind/W);
m=ind-W*(n-1);
Cpickedup=[m n];  %pickup an random position for C or C3

upCpicked=[Cpickedup(1),Cpickedup(2)+1];       %the position of its neighbours
downCpicked=[Cpickedup(1),Cpickedup(2)-1];
leftCpicked=[Cpickedup(1)-1,Cpickedup(2)];
rightCpicked=[Cpickedup(1)+1,Cpickedup(2)];

if Conf(Cpickedup(1),Cpickedup(2))==C
    
    Conf(Cpickedup(1),Cpickedup(2))=0;  % update the configuration of the lattice  
    CNum=CNum+1;
    if CdiffusionSP(Cpickedup(1),Cpickedup(2))>0
        NZE(3)=NZE(3)-1;
        CdiffusionSP(Cpickedup(1),Cpickedup(2))=0;%remove C diffusion at this site
    end
        
    CCNTSP(Cpickedup(1),Cpickedup(2))=0;
    NZE(19)=NZE(19)-1;
    CBdiffusionSP(Cpickedup(1),Cpickedup(2))=0;%remove C bulk diffusion at this site
    NZE(20)=NZE(20)-1;
    
    ystore=scanNBP(ystore,Conf,W,L,CX,Cpickedup,upCpicked,downCpicked,leftCpicked,rightCpicked,[],0,0,0,0);

    if Cpickedup(2)==L&&Cpickedup(1)>1&&Cpickedup(1)<W                      %....C0000...upmost
                                                                        
            [NZE,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP]=CCNTcheckCNB(NZE,Conf,H,C,CH3,CH2,CH,C2,C3,...
                CX,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,Cpickedup,downCpicked,rightCpicked,leftCpicked);

    elseif Cpickedup(2)==1&&Cpickedup(1)>1&&Cpickedup(1)<W                  %....C0000...downmost
            [NZE,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP]=CCNTcheckCNB(NZE,Conf,H,C,CH3,CH2,CH,C2,C3,...
                CX,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,Cpickedup,upCpicked,rightCpicked,leftCpicked);

    
    elseif Cpickedup(1)==1&&Cpickedup(2)>1&&Cpickedup(2)<L
                                                                       %C0000.......leftmost
            [NZE,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP]=CCNTcheckCNB(NZE,Conf,H,C,CH3,CH2,CH,C2,C3,...
                CX,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,Cpickedup,upCpicked,downCpicked,rightCpicked);

    elseif Cpickedup(1)==W&&Cpickedup(2)>1&&Cpickedup(2)<L                 %.......0000C rightmost
            [NZE,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP]=CCNTcheckCNB(NZE,Conf,H,C,CH3,CH2,CH,C2,C3,...
                CX,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,Cpickedup,upCpicked,downCpicked,leftCpicked);

    elseif Cpickedup(2)==L                    %upconers
    
        checkleftright=(Cpickedup(1)==W);
        switch(checkleftright)
            case(0)                                               %C0000...upleft corner
                [NZE,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP]=CCNTcheckCNB(NZE,Conf,H,C,CH3,CH2,CH,C2,C3,...
                    CX,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,Cpickedup,downCpicked,rightCpicked,0);

            case(1)                                               %...0000C upright corner
                [NZE,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP]=CCNTcheckCNB(NZE,Conf,H,C,CH3,CH2,CH,C2,C3,...
                    CX,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,Cpickedup,downCpicked,leftCpicked,0);
                
        end
    
    elseif Cpickedup(1)==1                  %C0000...downleft corner
    
        [NZE,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP]=CCNTcheckCNB(NZE,Conf,H,C,CH3,CH2,CH,C2,C3,...
            CX,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,Cpickedup,upCpicked,rightCpicked,0);

    else                                    %...0000C downright corner
    
        [NZE,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP]=CCNTcheckCNB(NZE,Conf,H,C,CH3,CH2,CH,C2,C3,...
            CX,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,Cpickedup,upCpicked,leftCpicked,0);

    end
  
else                                    %Conf(Cpickedup(1),Cpickedup(2))==C3
    Conf(Cpickedup(1),Cpickedup(2))=0;  % update the configuration of the lattice  
    CNum=CNum+3;
    
    if C3diffusionSP(Cpickedup(1),Cpickedup(2))>0
        NZE(4)=NZE(4)-1;
        C3diffusionSP(Cpickedup(1),Cpickedup(2))=0;%remove C3 diffusion at this site
    end
    
    CCNTSP(Cpickedup(1),Cpickedup(2))=0;
    NZE(19)=NZE(19)-1;
    
    ystore=scanNBP(ystore,Conf,W,L,CX,Cpickedup,upCpicked,downCpicked,leftCpicked,rightCpicked,[],0,0,0,0);


    if Cpickedup(2)==L&&Cpickedup(1)>1&&Cpickedup(1)<W                      %....C30000...upmost
                                                                        
            [NZE,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=CCNTcheckC3NB(NZE,Conf,H,C,CH3,CH2,CH,C2,C3,...
                CX,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Cpickedup,downCpicked,rightCpicked,leftCpicked);

    elseif Cpickedup(2)==1&&Cpickedup(1)>1&&Cpickedup(1)<W                  %....C30000...downmost
            [NZE,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=CCNTcheckC3NB(NZE,Conf,H,C,CH3,CH2,CH,C2,C3,...
                CX,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Cpickedup,upCpicked,rightCpicked,leftCpicked);
    
    elseif Cpickedup(1)==1&&Cpickedup(2)>1&&Cpickedup(2)<L
                                                                       %C30000.......leftmost
            [NZE,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=CCNTcheckC3NB(NZE,Conf,H,C,CH3,CH2,CH,C2,C3,...
                CX,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Cpickedup,upCpicked,downCpicked,rightCpicked);

    elseif Cpickedup(1)==W&&Cpickedup(2)>1&&Cpickedup(2)<L                 %.......0000C3 rightmost
            [NZE,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=CCNTcheckC3NB(NZE,Conf,H,C,CH3,CH2,CH,C2,C3,...
                CX,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Cpickedup,upCpicked,downCpicked,leftCpicked);

    elseif Cpickedup(2)==L                    %upconers
    
        checkleftright=(Cpickedup(1)==W);
        switch(checkleftright)
            case(0)                                               %C30000...upleft corner
                [NZE,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=CCNTcheckC3NB(NZE,Conf,H,C,CH3,CH2,CH,C2,C3,...
                    CX,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Cpickedup,downCpicked,rightCpicked,0);
 
            case(1)                                               %...0000C3 upright corner
                [NZE,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=CCNTcheckC3NB(NZE,Conf,H,C,CH3,CH2,CH,C2,C3,...
                    CX,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Cpickedup,downCpicked,leftCpicked,0);
        end
    
    elseif Cpickedup(1)==1                  %C30000...downleft corner
    
        [NZE,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=CCNTcheckC3NB(NZE,Conf,H,C,CH3,CH2,CH,C2,C3,...
            CX,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Cpickedup,upCpicked,rightCpicked,0);

    else                                    %...0000C3 downright corner
    
        [NZE,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=CCNTcheckC3NB(NZE,Conf,H,C,CH3,CH2,CH,C2,C3,...
            CX,CdiffusionSP,CH4DSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,Cpickedup,upCpicked,leftCpicked,0);

    end
end
                                                                                                                                                                               
end
