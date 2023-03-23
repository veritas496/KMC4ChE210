function [g,NZE,Conf,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,C3FSP,CCNTSP,CBdiffusionSP,CXFSP,ystore,...
    HdiffusionNum,CdiffusionNum,C3diffusionNum,CH4dissociationNum,CH3on,CH3dissociationNum,CH2dissociationNum,CHdissociationNum,C2FNum,C2on,CXFNum,H2productionNum,...
    CH4productionNum,CHproductionNum,CbulkNum,step,t,C2FSP,H2Num,CNum,count,trap1,trap2,C3FNum,d]=KMCsub(NZE,W,L,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,...
    C3diffusionSP,CH3DSP,CH2DSP,CHDSP,C3FSP,CCNTSP,CBdiffusionSP,CXFSP,step,A,R,T,CXFNum,s,ystore,HdiffusionNum,CdiffusionNum,C3diffusionNum,CH4dissociationNum,...
    CH3on,CH3dissociationNum,CH2dissociationNum,CHdissociationNum,C2FNum,C2on,H2productionNum,CH4productionNum,CHproductionNum,CbulkNum,t,CX,C2,C2FSP,H2Num,CNum,count,trap1,trap2,C3FNum,d,PS,g)

steporiginal=step;

while step<steporiginal+40
    %tic
    
    NZE(13)=NZE(6);
    NZE(14)=NZE(7);
    NZE(2)=NZE(8);
    coverage=(NZE(3)+NZE(4)+CXFNum)/s; % The carbon atoms surface coverage on the lattice
    [Ea]=energybarrier(coverage);
    k=A.*exp(-Ea./(R*T));
    rate=k.*NZE;

    RN=rand(1);
    %do normal KMC
        
            totalrate=sum(rate);
            %pick up the event i
            if RN<=rate(1)/totalrate
                [NZE,Conf,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=Hdiffusion(NZE,W,L,Conf,H,CH3,...
                    CH2,CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP);
                HdiffusionNum=HdiffusionNum+1;
            %elseif RN<=(sum(rate(1:2))/totalrate)
            %    [NZE,Conf,CHDSP,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CH2PSP]=CHdiffusion(NZE,W,L,Conf,CH,CHDSP,H,CH3,CH2,C,C3,HdiffusionSP,...
            %        CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CH2PSP);
            %    CHdiffusionNum=CHdiffusionNum+1;
            elseif RN<=(sum(rate(1:3))/totalrate)
                [NZE,Conf,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP]=Cdiffusion(NZE,W,L,Conf,C,CdiffusionSP,...
                    H,CH3,CH2,CH,C2,C3,CX,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP); 
                CdiffusionNum=CdiffusionNum+1;
            elseif RN<=(sum(rate(1:4))/totalrate)
                [NZE,Conf,CH4DSP,CXFSP,C3diffusionSP,CdiffusionSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CCNTSP]=C3diffusion(NZE,W,L,Conf,CH4DSP,CXFSP,C3diffusionSP,H,C,...
                    CH3,CH2,CH,C2,C3,CX,CdiffusionSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CCNTSP);
                C3diffusionNum=C3diffusionNum+1;
            elseif RN<=(sum(rate(1:5))/totalrate)
                [NZE,CH4DSP,Conf,CH4PSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,CH3PSP,CH2PSP,CHPSP,H2PSP]=CH4dissociation(NZE,CH4DSP,W,L,Conf,...
                    H,CH3,CH4PSP,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,CH3PSP,CH2PSP,CHPSP,H2PSP);
                CH4dissociationNum=CH4dissociationNum+1;
                CH3on=CH3on+1;
            elseif RN<=(sum(rate(1:6))/totalrate)
                [NZE,Conf,CH3DSP,CH3PSP,CH2DSP,CH4PSP,HdiffusionSP,CH4DSP,H2PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP]=CH3dissociation(NZE,W,L,Conf,H,CH2,...
                    CH3DSP,CH3PSP,CH2DSP,CH4PSP,CH3,CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP);
                CH3dissociationNum=CH3dissociationNum+1;
                CH3on=CH3on-1;
            elseif RN<=(sum(rate(1:7))/totalrate)
                [NZE,Conf,CH2DSP,CH2PSP,CH3PSP,CHDSP,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP]=CH2dissociation(NZE,W,L,Conf,H,CH,...
                    CH2DSP,CH2PSP,CH3PSP,CHDSP,CH3,CH2,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP);
                CH2dissociationNum=CH2dissociationNum+1;
            elseif RN<=(sum(rate(1:8))/totalrate)
                [CCNTSP,NZE,Conf,CHDSP,CHPSP,CdiffusionSP,CH2PSP,C2FSP,C3FSP,CXFSP,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CBdiffusionSP]=CHdissociation(NZE,...
                    W,L,Conf,H,C,CHDSP,CHPSP,C2,C3,CX,CdiffusionSP,CH2PSP,C2FSP,C3FSP,CXFSP,CH3,CH2,CH,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CCNTSP,CBdiffusionSP);
                CHdissociationNum=CHdissociationNum+1;
            elseif RN<=(sum(rate(1:9))/totalrate)
                [CCNTSP,NZE,Conf,C2FSP,CHPSP,C3FSP,CXFSP,CdiffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP,CBdiffusionSP]=C2formation(NZE,W,L,Conf,C,C2,C2FSP,....
                    H,CX,CHPSP,C3FSP,CXFSP,CdiffusionSP,CH3,CH2,CH,C3,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP,CCNTSP,CBdiffusionSP);
                C2FNum=C2FNum+1;
                C2on=C2on+1;  % The number of C2 dimer on the surface
            elseif RN<=(sum(rate(1:10))/totalrate)
                [CCNTSP,NZE,Conf,C3diffusionSP,C3FSP,CXFSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,CBdiffusionSP]=C3formation(NZE,W,L,Conf,C3diffusionSP,...
                    C,C3,C3FSP,C2,CX,CXFSP,H,CH3,CH2,CH,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,CCNTSP,CBdiffusionSP);
                C3FNum=C3FNum+1;
                C2on=C2on-1;
            elseif RN<=(sum(rate(1:11))/totalrate)
                [ystore,NZE,CCNTSP,Conf,C2FSP,CdiffusionSP,C3FSP,C3diffusionSP,CXFSP,CHPSP,CBdiffusionSP,C2on]=CXformation(NZE,W,L,Conf,H,C,C2,C3,CX,C2FSP,CdiffusionSP,C3FSP,C3diffusionSP,CXFSP,CHPSP,CCNTSP,CBdiffusionSP,C2on);
                CXFNum=CXFNum+1;
            elseif RN<=(sum(rate(1:12))/totalrate)
                [NZE,Conf,H2PSP,H2Num,CH4DSP,HdiffusionSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP]=H2production(NZE,...
                    W,L,Conf,H,H2PSP,H2Num,CH4DSP,CH3,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP);
                H2productionNum=H2productionNum+1;
            %elseif RN<=(sum(rate(1:13))/totalrate)
            %    [NZE,Conf,CH3DSP,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusion(NZE,W,L,Conf,CH3,CH3DSP,H,CH2,CH,C,C3,HdiffusionSP,CH4DSP,...
            %        CdiffusionSP,C3diffusionSP,CH2DSP,CHDSP,CH4PSP);
            %    CH3diffusionNum=CH3diffusionNum+1;
            %elseif RN<=(sum(rate(1:14))/totalrate)
                %CH2diffusion;
            elseif RN<=(sum(rate(1:15))/totalrate)
                [NZE,CH4PSP,Conf,CH4DSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP]=CH4production(NZE,CH4PSP,W,L,Conf,H,CH4DSP,...
                    CH3,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP);
                CH4productionNum=CH4productionNum+1;
                CH3on=CH3on-1;
            %elseif RN<=(sum(rate(1:16))/totalrate)
            %    [NZE,CH4PSP,Conf,CH4DSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP]=CH3production(NZE,CH4PSP,W,L,Conf,H,CH4DSP,...
            %        CH3,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP);
            %    CH3productionNum=CH3productionNum+1;
            %elseif RN<=(sum(rate(1:17))/totalrate)
            %    CH2productionNum=CH2productionNum+1;
            elseif RN<=(sum(rate(1:18))/totalrate)
                [CCNTSP,NZE,Conf,CHDSP,CHPSP,CH2PSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CBdiffusionSP]=CHproduction(NZE,...
                    W,L,Conf,H,CH,CHDSP,CHPSP,C,C2,C3,CX,CH2PSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,CH3,CH2,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CCNTSP,CBdiffusionSP);
                CHproductionNum=CHproductionNum+1;
            elseif RN<=(sum(rate(1:19))/totalrate)
                [NZE,Conf,CNum,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP]=CCNT(NZE,W,L,Conf,CNum,C,...
                    CdiffusionSP,H,CH3,CH2,CH,C2,C3,CX,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP);
                %CCNTNum=CCNTNum+1;
            elseif RN<=(sum(rate(1:20))/totalrate)
                [NZE,Conf,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP]=Cbulkdiffusion(NZE,W,L,Conf,C,...
                    CdiffusionSP,H,CH3,CH2,CH,C2,C3,CX,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP);
                CbulkNum=CbulkNum+1;
            end
            RN2=rand(1);      
            t=t+(-1/totalrate*log(RN2));
            
    pint=rem(step,PS);
    switch(pint)
        case(0)
             count=count+1;
             rate1=0.004277*(CbulkNum+CNum)/d^3/t*60;
             rate2=0.008626*(CbulkNum+CNum)/d/t;
             
             fprintf('count %d\n',count)
             fprintf('CH4dissociationNum %d\n',CH4dissociationNum)
             fprintf('CH4productionNum %d\n',CH4productionNum) 
             fprintf('difference %d\n',CH4dissociationNum-CH4productionNum)
             fprintf('CH3dissociationNum %d\n',CH3dissociationNum)
             %fprintf('CH3productionNum %d\n',CH3productionNum)
             %fprintf('CH2dissociationNum %d\n',CH2dissociationNum)
             %fprintf('CHdissociationNum %d\n',CHdissociationNum)
             fprintf('CHproductionNum %d\n',CHproductionNum)
             fprintf('CH3on %d\n',CH3on)
             
             %fprintf('CH3diffusionNum %d\n',CH3diffusionNum)
             fprintf('HdiffusionNum %d\n',HdiffusionNum)
             fprintf('CdiffusionNum %d\n',CdiffusionNum)
             fprintf('C3diffusionNum %d\n',C3diffusionNum)
             fprintf('H2productionNum %d\n',H2productionNum)
             fprintf('H number on surface %d\n',NZE(1))
             fprintf('C2FNum %d\n',C2FNum)
             fprintf('C3FNum %d\n',C3FNum)
             fprintf('CXFNum %d\n',CXFNum)
             
             fprintf('CNum %d\n',CNum)
             %fprintf('CCNTNum %d\n',CCNTNum)
             fprintf('CbulkNum %d\n',CbulkNum)
             fprintf('coverage %4.3e\n',coverage)
             fprintf('t %4.3e\n',t)
             fprintf('diameter nm %4.3e\n',d)
             fprintf('rate1 gC/gcat/min %4.3e\n',rate1)
             fprintf('rate2 nm/s %4.3e\n',rate2)
             fprintf('trap1 %d\n',trap1)
             fprintf('trap2 %d\n',trap2)
             
             g = [g;t rate1 rate2 CXFNum coverage];
             outp=[W,d,T,PS];
             fileID = fopen ('KMCdata.txt','w');
             fprintf(fileID,'%1s %5s %5s %5s\r\n','lattice','diameter','Temperature','PS');
             fprintf(fileID,'%5.2f %8.2f %8.2f %8.2f\r\n', outp);
             fprintf(fileID,'%1s %16s %8s %12s %12s\r\n','t(s)','gC/gcat/min','nm/s', 'CXFNum', 'coverage');
             fprintf(fileID,'%5.5f %11.5f %11.5f %11.5f %11.5f\r\n', g'); 
             fclose(fileID);
    end
    step=step+1;
end