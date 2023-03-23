% Kinetic Monte Carlo Simulations of the CNT Growth Base on Carbon Surface Nucleation and Diffusion Mechanism
% Written by Jingde Li
% Department of Chemical Engineering
% Univeristy of Waterloo,Canada

clear;
clc;
CCC=0;
H2Num=0;
W = input('LATTICE W =');
L=W; %size of the lattice
H=1;CH3=2;CH2=3;CH=4;C=5;C2=6;C3=7;CX=8;R=8.3145; % surface species lables
CNum=0;% the number of surface C atom that diffuse out of the lattice
CdiffusionNum=0;C3diffusionNum=0;HdiffusionNum=0;CHdiffusionNum=0;CH3diffusionNum=0;CH4dissociationNum=0;CH4productionNum=0;CH3productionNum=0;CHdissociationNum=0;
CH2dissociationNum=0;C2FNum=0;C3FNum=0;C2on=0;CH3on=0;
CHproductionNum=0;H2productionNum=0;CXFNum=0;CCNTNum=0;CbulkNum=0;CH3dissociationNum=0;% the number of excuted events   
trap1=0;trap2=0;

tem = input('Temperature(C) =');
coveragecheck = input('coverage check =');
%tchecker = input('tchecker(s) =');
coverageSTD= input('coverageSTD(%) =');
PS = input('print step =');
d = (W*0.249*L*0.249*2/pi)^0.5;
T = tem + 273.15;% the temperature of the system
t=0; step=0;count=0;%initialization of the time and steps
Conf=zeros(W,L);%initialization of the lattice configurations
%Conf(70,70)=CX;

%initialization of the event matrix
CH4DSP=zeros(W,L); CH3DSP=zeros(W,L); CH2DSP=zeros(W,L); CHDSP=zeros(W,L); C2FSP=zeros(W,L);C3FSP=zeros(W,L);CXFSP=zeros(W,L);
CH4PSP=zeros(W,L); CH3PSP=zeros(W,L); CH2PSP=zeros(W,L); CHPSP=zeros(W,L); H2PSP=zeros(W,L);
CdiffusionSP=zeros(W,L);C3diffusionSP=zeros(W,L);HdiffusionSP=zeros(W,L); CCNTSP=zeros(W,L);CBdiffusionSP=zeros(W,L);

%initialization of the event matrix for CH4 dissociation
CH4DSP(1,1)=2;CH4DSP(1,L)=2;CH4DSP(W,1)=2;CH4DSP(W,L)=2;CH4DSP(2:(W-1),1)=3;CH4DSP(2:(W-1),L)=3;CH4DSP(1,2:(L-1))=3;CH4DSP(W,2:(L-1))=3;CH4DSP(2:(W-1),2:(L-1))=4;
%CH4DSP(70,70)=0;CH4DSP(70,69)=3;CH4DSP(70,71)=3;CH4DSP(69,70)=3;CH4DSP(71,70)=3;

rate=zeros(1,20);%initialization of the reaction rate

NZE=zeros(1,20);%initialization of the sites number for each species: non-zero elements in each event matrix
NZE(5)=nnz(CH4DSP);
s=W*L; % Total site on the lattice
ystore=zeros(W,L);

[A]=kineticparameters(T); % Calculation of the pre-exponnatianl factor
g=[]; % store the output 
outpchecker=[];
gchecker=[];

coverage=1;
CXFN=0;
test=[];
mmm=0;
nnn=0;
t000=100000000;
tcheck=0;
CXF000=0;
CXF001=0;
CNT000=0;
CNT001=0;
CNT002=0;
coverageinCXFrate=0;
dropCNTrate=0;
aveCNTrate=0;
CNTrate001=0;


while coverage<98
    %tic
    step=step+1;
    NZE(13)=NZE(6);
    NZE(14)=NZE(7);
    NZE(2)=NZE(8);
    coverage=CXFNum/s*100; % The carbon atoms surface coverage (%) on the lattice
    [Ea]=energybarrier(coverage,coveragecheck);


    k=A.*exp(-Ea./(R*T));
    rate=k.*NZE;

    RN=rand(1);
    %{
    if CXFNum>100  % when there is CH2 or too much CX cluster on the surface, do normal KMC  NZE(15)>0||
        
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
                [ystore,NZE,CCNTSP,Conf,C2FSP,CdiffusionSP,C3FSP,C3diffusionSP,CXFSP,CHPSP,CBdiffusionSP,C2on]=CXformation(NZE,W,L,Conf,H,C,C2,C3,CX,C2FSP,CdiffusionSP,C3FSP,C3diffusionSP,CXFSP,CHPSP,CCNTSP,CBdiffusionSP,C2on,ystore);
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
            
            [g,NZE,Conf,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,C3FSP,CCNTSP,CBdiffusionSP,CXFSP,ystore,...
            HdiffusionNum,CdiffusionNum,C3diffusionNum,CH4dissociationNum,CH3on,CH3dissociationNum,CH2dissociationNum,CHdissociationNum,C2FNum,C2on,CXFNum,H2productionNum,...
            CH4productionNum,CHproductionNum,CbulkNum,step,t,C2FSP,H2Num,CNum,count,trap1,trap2,C3FNum,d]=KMCsub(NZE,W,L,Conf,H,CH3,CH2,CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,...
            C3diffusionSP,CH3DSP,CH2DSP,CHDSP,C3FSP,CCNTSP,CBdiffusionSP,CXFSP,step,A,R,T,CXFNum,s,ystore,HdiffusionNum,CdiffusionNum,C3diffusionNum,CH4dissociationNum,...
            CH3on,CH3dissociationNum,CH2dissociationNum,CHdissociationNum,C2FNum,C2on,H2productionNum,CH4productionNum,CHproductionNum,CbulkNum,t,CX,C2,C2FSP,H2Num,CNum,...
            count,trap1,trap2,C3FNum,d,PS,g);
        %}
   if  rate(7)>0 % r7 is CH2 dissociation
            totalrate=sum(rate);
            rest=totalrate-rate(1)-rate(3)-rate(4);   % Do not account for H, C, C3 surface diffusion 
            numstep=(rate(1)+rate(3)+rate(4))/rest;

        if coverage <=80
            if NZE(1)>1
                rate(12)=(NZE(1)^2-1)*k(12)/1360/(W/70)^2;  % redefine H+H=H2 rate
            else
                rete(12)=0;
            end
            rate(18)=k(18)*NZE(1)*NZE(3)/1360/(W/70)^2;       % redefine C+H=CH rate
            rate(19)=k(19)*(NZE(3)+NZE(4))/23/(W/70)*(1+0.3*coverage/80);       % more or zero C on the surface redefine CNT growth rate by C or C3 attachment
            rate(10)=k(10)*NZE(3)*C2on/1360/(W/70)^2;         % redefine C2+C=C3 rate
            rate(15)=k(15)*NZE(1)*NZE(6)/1360/(W/70)^2;         % redefine CH3+H=CH4 rate
            if NZE(3)>1                              % when there are more than one C atoms on the surface
               rate(9)=(NZE(3)^2-1)*k(9)/1360/(W/70)^2; % redefine C+C=C2 rate
            else 
               rate(9)=0;
            end                             
            rate(11)=k(11)*3.1/80*NZE(3)*coverage+k(11)*NZE(3)*NZE(4)/1360/(W/70)^2;         % redefine CX formation rate Note that only C+C3 and C+CX is considered.
        elseif coverage >80
            if NZE(1)>1
                rate(12)=-(NZE(1)^2-1)*k(12)/1360/(W/70)^2/20*(coverage-100);  % redefine H+H=H2 rate
            else
                rate(12)=0;
            end
            rate(18)=-k(18)*NZE(1)*NZE(3)/1360/(W/70)^2/20*(coverage-100);       % redefine C+H=CH rate
            rate(19)=-k(19)*(NZE(3)+NZE(4))/23/(W/70)/20*(coverage-100);       % more or zero C on the surface redefine CNT growth rate by C or C3 attachment
            rate(10)=-k(10)*NZE(3)*C2on/1360/(W/70)^2/20*(coverage-100);         % redefine C2+C=C3 rate
            rate(15)=-k(15)*NZE(1)*NZE(6)/1360/(W/70)^2/20*(coverage-100);         % redefine CH3+H=CH4 rate
            if NZE(3)>1                              % when there are more than one C atoms on the surface
               rate(9)=-(NZE(3)^2-1)*k(9)/1360/(W/70)^2/20*(coverage-100); % redefine C+C=C2 rate
            else 
               rate(9)=0;
            end                             
            rate(11)=-k(11)*3.1/20*NZE(3)*(coverage-100)-k(11)*NZE(3)*NZE(4)/1360/(W/70)^2/20*(coverage-100);         % redefine CX formation rate Note that only C+C3 and C+CX is considered.
        end
            %pick up the event i
            
            if RN<=(rate(5)/rest)
                [CH3pickedup,Hpickedup,ystore,NZE,CH4DSP,Conf,CH4PSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,CH3PSP,CH2PSP,CHPSP,H2PSP]=CH4dissociation(NZE,CH4DSP,W,L,Conf,...
                    H,CH3,CH4PSP,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,CH3PSP,CH2PSP,CHPSP,H2PSP,ystore,CX);
                CH4dissociationNum=CH4dissociationNum+1;
                CH3on=CH3on+1;
                %if Hpickedup==0
                %    break
                %end
            elseif RN<=(sum(rate(5:6))/rest)
                [ystore,NZE,Conf,CH3DSP,CH3PSP,CH2DSP,CH4PSP,HdiffusionSP,CH4DSP,H2PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP]=CH3dissociation(NZE,W,L,Conf,H,CH2,...
                    CH3DSP,CH3PSP,CH2DSP,CH4PSP,CH3,CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,ystore,CX);
                CH3dissociationNum=CH3dissociationNum+1;
                CH3on=CH3on-1;
            elseif RN<=(sum(rate(5:7))/rest)
                [ystore,NZE,Conf,CH2DSP,CH2PSP,CH3PSP,CHDSP,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP]=CH2dissociation(NZE,W,L,Conf,H,CH,...
                    CH2DSP,CH2PSP,CH3PSP,CHDSP,CH3,CH2,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP,ystore,CX);
                CH2dissociationNum=CH2dissociationNum+1;
                for i =1:10
                    [ystore,NZE,Conf,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=Hdiffusion(NZE,W,L,Conf,H,CH3,...
                    CH2,CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,ystore,CX);
                    HdiffusionNum=HdiffusionNum+1;
                end
            elseif RN<=(sum(rate(5:8))/rest)
                [ystore,CCNTSP,NZE,Conf,CHDSP,CHPSP,CdiffusionSP,CH2PSP,C2FSP,C3FSP,CXFSP,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CBdiffusionSP]=CHdissociation(NZE,...
                    W,L,Conf,H,C,CHDSP,CHPSP,C2,C3,CX,CdiffusionSP,CH2PSP,C2FSP,C3FSP,CXFSP,CH3,CH2,CH,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CCNTSP,CBdiffusionSP,ystore);
                CHdissociationNum=CHdissociationNum+1;
            elseif RN<=(sum(rate(5:9))/rest)
                [C2FC1pickedup,C2FC2pickedup,ystore,CCNTSP,NZE,Conf,C2FSP,CHPSP,C3FSP,CXFSP,CdiffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP,CBdiffusionSP]=redefineC2formation(NZE,W,L,Conf,C,C2,C2FSP,....
                    H,CX,CHPSP,C3FSP,CXFSP,CdiffusionSP,CH3,CH2,CH,C3,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP,CCNTSP,CBdiffusionSP,ystore);
                C2FNum=C2FNum+1;
                C2on=C2on+1;
            elseif RN<=(sum(rate(5:10))/rest)
                [C3FC2pickedup,C3FCpickedup,ystore,CCNTSP,NZE,Conf,C3diffusionSP,C3FSP,CXFSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,CBdiffusionSP]=redefineC3formation(NZE,W,L,Conf,C3diffusionSP,...
                    C,C3,C3FSP,C2,CX,CXFSP,H,CH3,CH2,CH,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,CCNTSP,CBdiffusionSP,ystore);
                C3FNum=C3FNum+1;
                C2on=C2on-1;
            elseif RN<=(sum(rate(5:11))/rest)
                [rdCX1pickedup,rdCX2pickedup,CXcheck2,CCC,ystore,NZE,CCNTSP,Conf,C2FSP,CdiffusionSP,C3FSP,C3diffusionSP,CXFSP,CHPSP,CBdiffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP]=redefineCXformation(NZE,W,L,Conf,H,CH3,CH2,CH,C,C2,C3,CX,...
                    C2FSP,CdiffusionSP,C3FSP,C3diffusionSP,CXFSP,CHPSP,CCNTSP,CBdiffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,ystore,CCC);
                CXFNum=CXFNum+1;
            elseif RN<=(sum(rate(5:12))/rest)
                [ystore,NZE,Conf,H2PSP,H2Num,CH4DSP,HdiffusionSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP]=redefinedH2production(NZE,...
                    W,L,Conf,H,H2PSP,H2Num,CH4DSP,CH3,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP,ystore,CX);
                H2productionNum=H2productionNum+1;
            elseif RN<=(sum(rate(5:15))/rest)
                [ystore,NZE,CH4PSP,Conf,CH4DSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP]=redefineCH4production(NZE,CH4PSP,W,L,Conf,H,CH4DSP,...
                    CH3,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP,ystore,CX);
                CH4productionNum=CH4productionNum+1;
                CH3on=CH3on-1;
            %elseif RN<=(sum(rate(5:16))/rest)
            %    [NZE,CH4PSP,Conf,CH4DSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP]=CH3production(NZE,CH4PSP,W,L,Conf,H,CH4DSP,...
            %        CH3,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP);
            %    CH3productionNum=CH3productionNum+1;
            %elseif RN<=(sum(rate(5:17))/rest)
            %    CH2productionNum=CH2productionNum+1;
            elseif RN<=(sum(rate(5:18))/rest)
                [ystore,CCNTSP,NZE,Conf,CHDSP,CHPSP,CH2PSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CBdiffusionSP]=redefineCHproduction(NZE,...
                    W,L,Conf,H,CH,CHDSP,CHPSP,C,C2,C3,CX,CH2PSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,CH3,CH2,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CCNTSP,CBdiffusionSP,ystore);
                CHproductionNum=CHproductionNum+1;
            elseif RN<=(sum(rate(5:19))/rest)
                [ystore,NZE,Conf,CNum,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP]=redefineCCNT(NZE,W,L,Conf,CNum,C,...
                    CdiffusionSP,H,CH3,CH2,CH,C2,C3,CX,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP,ystore);
                %CCNTNum=CCNTNum+1;
            elseif RN<=(sum(rate(5:20))/rest)
                [ystore,NZE,Conf,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP]=Cbulkdiffusion(NZE,W,L,Conf,C,...
                    CdiffusionSP,H,CH3,CH2,CH,C2,C3,CX,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP,ystore);
                CbulkNum=CbulkNum+1;
            end
            t=t+numstep/totalrate;  
            
    elseif NZE(1)>1     % when there is more thane one H diffusion process (two H atom) on the surface,do redefined KMC.
        if coverage <=80
            rate(12)=(NZE(1)^2-1)*k(12)/1360/(W/70)^2;  % redefine H+H=H2 rate
            rate(18)=k(18)*NZE(1)*NZE(3)/1360/(W/70)^2;       % redefine C+H=CH rate
            rate(19)=k(19)*(NZE(3)+NZE(4))/23/(W/70)*(1+0.3*coverage/80);       % more or zero C on the surface redefine CNT growth rate by C or C3 attachment
            rate(10)=k(10)*NZE(3)*C2on/1360/(W/70)^2;         % redefine C2+C=C3 rate
            rate(15)=k(15)*NZE(1)*NZE(6)/1360/(W/70)^2;         % redefine CH3+H=CH4 rate
            if NZE(3)>1                              % when there are more than one C atoms on the surface
               rate(9)=(NZE(3)^2-1)*k(9)/1360/(W/70)^2; % redefine C+C=C2 rate
            else 
               rate(9)=0;
            end                             
            rate(11)=k(11)*3.1/80*NZE(3)*coverage+k(11)*NZE(3)*NZE(4)/1360/(W/70)^2;         % redefine CX formation rate Note that only C+C3 and C+CX is considered.
        elseif coverage >80
            rate(12)=-(NZE(1)^2-1)*k(12)/1360/(W/70)^2/20*(coverage-100);  % redefine H+H=H2 rate
            rate(18)=-k(18)*NZE(1)*NZE(3)/1360/(W/70)^2/20*(coverage-100);       % redefine C+H=CH rate
            rate(19)=-k(19)*(NZE(3)+NZE(4))/23/(W/70)/20*(coverage-100);       % more or zero C on the surface redefine CNT growth rate by C or C3 attachment
            rate(10)=-k(10)*NZE(3)*C2on/1360/(W/70)^2/20*(coverage-100);         % redefine C2+C=C3 rate
            rate(15)=-k(15)*NZE(1)*NZE(6)/1360/(W/70)^2/20*(coverage-100);         % redefine CH3+H=CH4 rate
            if NZE(3)>1                              % when there are more than one C atoms on the surface
               rate(9)=-(NZE(3)^2-1)*k(9)/1360/(W/70)^2/20*(coverage-100); % redefine C+C=C2 rate
            else 
               rate(9)=0;
            end                             
            rate(11)=-k(11)*3.1/20*NZE(3)*(coverage-100)-k(11)*NZE(3)*NZE(4)/1360/(W/70)^2/20*(coverage-100);         % redefine CX formation rate Note that only C+C3 and C+CX is considered.
        end
            totalrate=sum(rate);                         %recalculate totalrate
            rest=totalrate-rate(1)-rate(3)-rate(4);   % Do not account for H,C and C3 surface diffusion 
            numstep=(rate(1)+rate(3)+rate(4))/rest;

            if RN<=(sum(rate(5))/rest)
                [CH3pickedup,Hpickedup,ystore,NZE,CH4DSP,Conf,CH4PSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,CH3PSP,CH2PSP,CHPSP,H2PSP]=CH4dissociation(NZE,CH4DSP,W,L,Conf,...
                    H,CH3,CH4PSP,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,CH3PSP,CH2PSP,CHPSP,H2PSP,ystore,CX);
                CH4dissociationNum=CH4dissociationNum+1;
                CH3on=CH3on+1;
                %if Hpickedup==0
                %    break
               % end
            elseif RN<=(sum(rate(5:6))/rest)
                [ystore,NZE,Conf,CH3DSP,CH3PSP,CH2DSP,CH4PSP,HdiffusionSP,CH4DSP,H2PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP]=CH3dissociation(NZE,W,L,Conf,H,CH2,...
                    CH3DSP,CH3PSP,CH2DSP,CH4PSP,CH3,CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,ystore,CX);
                CH3dissociationNum=CH3dissociationNum+1;
                CH3on=CH3on-1;
            elseif RN<=(sum(rate(5:8))/rest)
                [ystore,CCNTSP,NZE,Conf,CHDSP,CHPSP,CdiffusionSP,CH2PSP,C2FSP,C3FSP,CXFSP,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CBdiffusionSP]=CHdissociation(NZE,...
                    W,L,Conf,H,C,CHDSP,CHPSP,C2,C3,CX,CdiffusionSP,CH2PSP,C2FSP,C3FSP,CXFSP,CH3,CH2,CH,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CCNTSP,CBdiffusionSP,ystore);
                CHdissociationNum=CHdissociationNum+1;
            elseif RN<=(sum(rate(5:9))/rest)
                [C2FC1pickedup,C2FC2pickedup,ystore,CCNTSP,NZE,Conf,C2FSP,CHPSP,C3FSP,CXFSP,CdiffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP,CBdiffusionSP]=redefineC2formation(NZE,W,L,Conf,C,C2,C2FSP,....
                    H,CX,CHPSP,C3FSP,CXFSP,CdiffusionSP,CH3,CH2,CH,C3,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP,CCNTSP,CBdiffusionSP,ystore);
                C2FNum=C2FNum+1;
                C2on=C2on+1;
            elseif RN<=(sum(rate(5:10))/rest)
                [C3FC2pickedup,C3FCpickedup,ystore,CCNTSP,NZE,Conf,C3diffusionSP,C3FSP,CXFSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,CBdiffusionSP]=redefineC3formation(NZE,W,L,Conf,C3diffusionSP,...
                    C,C3,C3FSP,C2,CX,CXFSP,H,CH3,CH2,CH,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,CCNTSP,CBdiffusionSP,ystore);
                C3FNum=C3FNum+1;
                C2on=C2on-1;
            elseif RN<=(sum(rate(5:11))/rest)
                [rdCX1pickedup,rdCX2pickedup,CXcheck2,CCC,ystore,NZE,CCNTSP,Conf,C2FSP,CdiffusionSP,C3FSP,C3diffusionSP,CXFSP,CHPSP,CBdiffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP]=redefineCXformation(NZE,W,L,Conf,H,CH3,CH2,CH,C,C2,C3,CX,...
                    C2FSP,CdiffusionSP,C3FSP,C3diffusionSP,CXFSP,CHPSP,CCNTSP,CBdiffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,ystore,CCC);
                CXFNum=CXFNum+1;
                %test=[test;rdCX1pickedup,rdCX2pickedup,CXcheck2];
            elseif RN<=(sum(rate(5:12))/rest)
                [ystore,NZE,Conf,H2PSP,H2Num,CH4DSP,HdiffusionSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP]=redefinedH2production(NZE,...
                    W,L,Conf,H,H2PSP,H2Num,CH4DSP,CH3,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP,ystore,CX);
                H2productionNum=H2productionNum+1;
            elseif RN<=(sum(rate(5:15))/rest)
                [ystore,NZE,CH4PSP,Conf,CH4DSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP]=redefineCH4production(NZE,CH4PSP,W,L,Conf,H,CH4DSP,...
                    CH3,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP,ystore,CX);
                CH4productionNum=CH4productionNum+1;
                CH3on=CH3on-1;
            %elseif RN<=(sum(rate(5:16))/rest)
            %    [NZE,CH4PSP,Conf,CH4DSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP]=CH3production(NZE,CH4PSP,W,L,Conf,H,CH4DSP,...
            %        CH3,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP);
            %    CH3productionNum=CH3productionNum+1;
            %elseif RN<=(sum(rate(5:17))/rest)
            %    CH2productionNum=CH2productionNum+1;
            elseif RN<=(sum(rate(5:18))/rest)
                [ystore,CCNTSP,NZE,Conf,CHDSP,CHPSP,CH2PSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CBdiffusionSP]=redefineCHproduction(NZE,...
                    W,L,Conf,H,CH,CHDSP,CHPSP,C,C2,C3,CX,CH2PSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,CH3,CH2,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CCNTSP,CBdiffusionSP,ystore);
                CHproductionNum=CHproductionNum+1;
            elseif RN<=(sum(rate(5:19))/rest)
                [ystore,NZE,Conf,CNum,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP]=redefineCCNT(NZE,W,L,Conf,CNum,C,...
                    CdiffusionSP,H,CH3,CH2,CH,C2,C3,CX,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP,ystore);
                %CCNTNum=CCNTNum+1;
            elseif RN<=(sum(rate(5:20))/rest)
                [ystore,NZE,Conf,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP]=Cbulkdiffusion(NZE,W,L,Conf,C,...
                    CdiffusionSP,H,CH3,CH2,CH,C2,C3,CX,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP,ystore);
                CbulkNum=CbulkNum+1;
            end
            
            t=t+numstep/totalrate;
            
            trap1=trap1+1;
           
    elseif NZE(1)==1||NZE(3)==1||NZE(4)==1          %only one H or C or C3, no  H+H=H2, which means that only H diffusion on the surface. Run redefined KMC
        if coverage <=80
            rate(18)=k(18)*NZE(1)*NZE(3)/1360/(W/70)^2;     % redefine C+H=CH rate
            rate(19)=k(19)*(NZE(3)+NZE(4))/23/(W/70)*(1+0.3*coverage/80);     % one or zero C on the surface; redefine CNT growth rate by C attachment
            rate(10)=k(10)*NZE(3)*C2on/1360/(W/70)^2;       % redefine C2+C=C3 rate
            rate(15)=k(15)*NZE(1)*NZE(6)/1360/(W/70)^2;         % redefine CH3+H=CH4 rate
            if NZE(3)>1
               rate(9)=(NZE(3)^2-1)*k(9)/1360/(W/70)^2; %redefine C+C=C2 rate  
            else 
               rate(9)=0;
            end
            rate(11)=k(11)*3.1/80*NZE(3)*coverage+k(11)*NZE(3)*NZE(4)/1360/(W/70)^2;
        elseif coverage >80
            rate(18)=-k(18)*NZE(1)*NZE(3)/1360/(W/70)^2/20*(coverage-100);     % redefine C+H=CH rate
            rate(19)=-k(19)*(NZE(3)+NZE(4))/23/(W/70)/20*(coverage-100);     % one or zero C on the surface; redefine CNT growth rate by C attachment
            rate(10)=-k(10)*NZE(3)*C2on/1360/(W/70)^2/20*(coverage-100);       %redefine C2+C=C3 rate
            rate(15)=-k(15)*NZE(1)*NZE(6)/1360/(W/70)^2/20*(coverage-100);         % redefine CH3+H=CH4 rate
            if NZE(3)>1
               rate(9)=-(NZE(3)^2-1)*k(9)/1360/(W/70)^2/20*(coverage-100); %redefine C+C=C2 rate
            else 
               rate(9)=0;
            end
            rate(11)=-k(11)*3.1/20*NZE(3)*(coverage-100)-k(11)*NZE(3)*NZE(4)/1360/(W/70)^2/20*(coverage-100);
        end
            
            totalrate=sum(rate);                         %recalculate totalrate
            rest=totalrate-rate(1)-rate(3)-rate(4);
            numstep=(rate(1)+rate(3)+rate(4))/rest;
                        
            
            if RN<=(sum(rate(5))/rest)
                [CH3pickedup,Hpickedup,ystore,NZE,CH4DSP,Conf,CH4PSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,CH3PSP,CH2PSP,CHPSP,H2PSP]=CH4dissociation(NZE,CH4DSP,W,L,Conf,...
                    H,CH3,CH4PSP,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,CH3PSP,CH2PSP,CHPSP,H2PSP,ystore,CX);
                CH4dissociationNum=CH4dissociationNum+1;
                CH3on=CH3on+1;
                %if Hpickedup==0
                 %   break
                %end
            elseif RN<=(sum(rate(5:6))/rest)
                [ystore,NZE,Conf,CH3DSP,CH3PSP,CH2DSP,CH4PSP,HdiffusionSP,CH4DSP,H2PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP]=CH3dissociation(NZE,W,L,Conf,H,CH2,...
                    CH3DSP,CH3PSP,CH2DSP,CH4PSP,CH3,CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,ystore,CX);
                CH3dissociationNum=CH3dissociationNum+1;
                CH3on=CH3on-1;
            elseif RN<=(sum(rate(5:8))/rest)
                [ystore,CCNTSP,NZE,Conf,CHDSP,CHPSP,CdiffusionSP,CH2PSP,C2FSP,C3FSP,CXFSP,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CBdiffusionSP]=CHdissociation(NZE,...
                    W,L,Conf,H,C,CHDSP,CHPSP,C2,C3,CX,CdiffusionSP,CH2PSP,C2FSP,C3FSP,CXFSP,CH3,CH2,CH,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CCNTSP,CBdiffusionSP,ystore);
                CHdissociationNum=CHdissociationNum+1;
            elseif RN<=(sum(rate(5:9))/rest)
                [C2FC1pickedup,C2FC2pickedup,ystore,CCNTSP,NZE,Conf,C2FSP,CHPSP,C3FSP,CXFSP,CdiffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP,CBdiffusionSP]=redefineC2formation(NZE,W,L,Conf,C,C2,C2FSP,....
                    H,CX,CHPSP,C3FSP,CXFSP,CdiffusionSP,CH3,CH2,CH,C3,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP,CCNTSP,CBdiffusionSP,ystore);
                C2FNum=C2FNum+1;
                C2on=C2on+1;
            elseif RN<=(sum(rate(5:10))/rest)
                [C3FC2pickedup,C3FCpickedup,ystore,CCNTSP,NZE,Conf,C3diffusionSP,C3FSP,CXFSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,CBdiffusionSP]=redefineC3formation(NZE,W,L,Conf,C3diffusionSP,...
                    C,C3,C3FSP,C2,CX,CXFSP,H,CH3,CH2,CH,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,CCNTSP,CBdiffusionSP,ystore);
                C3FNum=C3FNum+1;
                C2on=C2on-1;
            elseif RN<=(sum(rate(5:11))/rest)
                [rdCX1pickedup,rdCX2pickedup,CXcheck2,CCC,ystore,NZE,CCNTSP,Conf,C2FSP,CdiffusionSP,C3FSP,C3diffusionSP,CXFSP,CHPSP,CBdiffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP]=redefineCXformation(NZE,W,L,Conf,H,CH3,CH2,CH,C,C2,C3,CX,...
                    C2FSP,CdiffusionSP,C3FSP,C3diffusionSP,CXFSP,CHPSP,CCNTSP,CBdiffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,ystore,CCC);
                CXFNum=CXFNum+1;
                %test=[test;rdCX1pickedup,rdCX2pickedup,CXcheck2];
            elseif RN<=(sum(rate(5:12))/rest)
                [ystore,NZE,Conf,H2PSP,H2Num,CH4DSP,HdiffusionSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP]=H2production(NZE,...
                    W,L,Conf,H,H2PSP,H2Num,CH4DSP,CH3,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP,ystore,CX);
                H2productionNum=H2productionNum+1;
            elseif RN<=(sum(rate(5:15))/rest)
                [ystore,NZE,CH4PSP,Conf,CH4DSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP]=redefineCH4production(NZE,CH4PSP,W,L,Conf,H,CH4DSP,...
                    CH3,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP,ystore,CX);
                CH4productionNum=CH4productionNum+1;
                CH3on=CH3on-1;
            %elseif RN<=(sum(rate(5:16))/rest)
            %    [NZE,CH4PSP,Conf,CH4DSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP]=CH3production(NZE,CH4PSP,W,L,Conf,H,CH4DSP,...
            %        CH3,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP);
            %    CH3productionNum=CH3productionNum+1;
            %elseif RN<=(sum(rate(5:17))/rest)
            %    CH2productionNum=CH2productionNum+1;
            elseif RN<=(sum(rate(5:18))/rest)
                [ystore,CCNTSP,NZE,Conf,CHDSP,CHPSP,CH2PSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CBdiffusionSP]=redefineCHproduction(NZE,...
                    W,L,Conf,H,CH,CHDSP,CHPSP,C,C2,C3,CX,CH2PSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,CH3,CH2,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CCNTSP,CBdiffusionSP,ystore);
                CHproductionNum=CHproductionNum+1;
            elseif RN<=(sum(rate(5:19))/rest)
                [ystore,NZE,Conf,CNum,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP]=redefineCCNT(NZE,W,L,Conf,CNum,C,...
                    CdiffusionSP,H,CH3,CH2,CH,C2,C3,CX,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP,ystore);
                %CCNTNum=CCNTNum+1;
            elseif RN<=(sum(rate(5:20))/rest)
                [ystore,NZE,Conf,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP]=Cbulkdiffusion(NZE,W,L,Conf,C,...
                    CdiffusionSP,H,CH3,CH2,CH,C2,C3,CX,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP,ystore);
                CbulkNum=CbulkNum+1;
            end
            
            t=t+numstep/totalrate;   
            trap2=trap2+1;
    %%%%%%%
    elseif NZE(3)>1||NZE(4)>1          %no H, but more than one C or C3 no  H+H=H2 Run redefined KMC
        if coverage <=80
            rate(19)=k(19)*(NZE(3)+NZE(4))/23/(W/70)*(1+0.3*coverage/80);     % one or zero C on the surface; redefine CNT growth rate by C attachment
            rate(10)=k(10)*NZE(3)*C2on/1360/(W/70)^2;       %redefine C2+C=C3 rate
            if NZE(3)==0
                rate (9)=0;
            else
                rate(9)=(NZE(3)^2-1)*k(9)/1360/(W/70)^2; %redefine C+C=C2 rate
            end
            rate(11)=k(11)*3.1/80*NZE(3)*coverage+k(11)*NZE(3)*NZE(4)/1360/(W/70)^2;
        elseif coverage >80
            rate(19)=-k(19)*(NZE(3)+NZE(4))/23/(W/70)/20*(coverage-100);     % one or zero C on the surface; redefine CNT growth rate by C attachment
            rate(10)=-k(10)*NZE(3)*C2on/1360/(W/70)^2/20*(coverage-100);       %redefine C2+C=C3 rate
            if NZE(3)==0
                rate (9)=0;
            else
                rate(9)=(NZE(3)^2-1)*k(9)/1360/(W/70)^2; %redefine C+C=C2 rate
            end
            rate(11)=-k(11)*3.1/20*NZE(3)*(coverage-100)-k(11)*NZE(3)*NZE(4)/1360/(W/70)^2/20*(coverage-100);
        end
            
            totalrate=sum(rate);                         %recalculate totalrate
            rest=totalrate-rate(1)-rate(3)-rate(4);
            numstep=(rate(1)+rate(3)+rate(4))/rest;
                        
            
            if RN<=(sum(rate(5))/rest)
                [CH3pickedup,Hpickedup,ystore,NZE,CH4DSP,Conf,CH4PSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,CH3PSP,CH2PSP,CHPSP,H2PSP]=CH4dissociation(NZE,CH4DSP,W,L,Conf,...
                    H,CH3,CH4PSP,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,CH3PSP,CH2PSP,CHPSP,H2PSP,ystore,CX);
                CH4dissociationNum=CH4dissociationNum+1;
                CH3on=CH3on+1;
                %if Hpickedup==0
                 %   break
                %end
            elseif RN<=(sum(rate(5:6))/rest)
                [ystore,NZE,Conf,CH3DSP,CH3PSP,CH2DSP,CH4PSP,HdiffusionSP,CH4DSP,H2PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP]=CH3dissociation(NZE,W,L,Conf,H,CH2,...
                    CH3DSP,CH3PSP,CH2DSP,CH4PSP,CH3,CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,ystore,CX);
                CH3dissociationNum=CH3dissociationNum+1;
                CH3on=CH3on-1;
            elseif RN<=(sum(rate(5:8))/rest)
                [ystore,CCNTSP,NZE,Conf,CHDSP,CHPSP,CdiffusionSP,CH2PSP,C2FSP,C3FSP,CXFSP,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CBdiffusionSP]=CHdissociation(NZE,...
                    W,L,Conf,H,C,CHDSP,CHPSP,C2,C3,CX,CdiffusionSP,CH2PSP,C2FSP,C3FSP,CXFSP,CH3,CH2,CH,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CCNTSP,CBdiffusionSP,ystore);
                CHdissociationNum=CHdissociationNum+1;
            elseif RN<=(sum(rate(5:9))/rest)
                [C2FC1pickedup,C2FC2pickedup,ystore,CCNTSP,NZE,Conf,C2FSP,CHPSP,C3FSP,CXFSP,CdiffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP,CBdiffusionSP]=redefineC2formation(NZE,W,L,Conf,C,C2,C2FSP,....
                    H,CX,CHPSP,C3FSP,CXFSP,CdiffusionSP,CH3,CH2,CH,C3,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP,CCNTSP,CBdiffusionSP,ystore);
                C2FNum=C2FNum+1;
                C2on=C2on+1;
            elseif RN<=(sum(rate(5:10))/rest)
                [C3FC2pickedup,C3FCpickedup,ystore,CCNTSP,NZE,Conf,C3diffusionSP,C3FSP,CXFSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,CBdiffusionSP]=redefineC3formation(NZE,W,L,Conf,C3diffusionSP,...
                    C,C3,C3FSP,C2,CX,CXFSP,H,CH3,CH2,CH,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,CCNTSP,CBdiffusionSP,ystore);
                C3FNum=C3FNum+1;
                C2on=C2on-1;
            elseif RN<=(sum(rate(5:11))/rest)
                [rdCX1pickedup,rdCX2pickedup,CXcheck2,CCC,ystore,NZE,CCNTSP,Conf,C2FSP,CdiffusionSP,C3FSP,C3diffusionSP,CXFSP,CHPSP,CBdiffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP]=redefineCXformation(NZE,W,L,Conf,H,CH3,CH2,CH,C,C2,C3,CX,...
                    C2FSP,CdiffusionSP,C3FSP,C3diffusionSP,CXFSP,CHPSP,CCNTSP,CBdiffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,ystore,CCC);
                CXFNum=CXFNum+1;
            elseif RN<=(sum(rate(5:19))/rest)
                [ystore,NZE,Conf,CNum,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP]=redefineCCNT(NZE,W,L,Conf,CNum,C,...
                    CdiffusionSP,H,CH3,CH2,CH,C2,C3,CX,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP,ystore);
                %CCNTNum=CCNTNum+1;
            elseif RN<=(sum(rate(5:20))/rest)
                [ystore,NZE,Conf,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP]=Cbulkdiffusion(NZE,W,L,Conf,C,...
                    CdiffusionSP,H,CH3,CH2,CH,C2,C3,CX,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP,ystore);
                CbulkNum=CbulkNum+1;
            end
            
            t=t+numstep/totalrate;   
            trap2=trap2+1;
            %%%%%%
    else                 % all other situations, run normal KMC
            totalrate=sum(rate);
            
                            %pick up the event i
            if RN<=rate(1)/totalrate
                [ystore,NZE,Conf,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP]=Hdiffusion(NZE,W,L,Conf,H,CH3,...
                    CH2,CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH4PSP,CH3PSP,CH2PSP,CHPSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,ystore,CX);
                HdiffusionNum=HdiffusionNum+1;
            %elseif RN<=(sum(rate(1:2))/totalrate)
            %    [NZE,Conf,CHDSP,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CH2PSP]=CHdiffusion(NZE,W,L,Conf,CH,CHDSP,H,CH3,CH2,C,C3,HdiffusionSP,...
            %        CH4DSP,CdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CH2PSP);
            %    CHdiffusionNum=CHdiffusionNum+1;
            elseif RN<=(sum(rate(1:3))/totalrate)
                [ystore,NZE,Conf,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP]=Cdiffusion(NZE,W,L,Conf,C,CdiffusionSP,...
                    H,CH3,CH2,CH,C2,C3,CX,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP,ystore); 
                CdiffusionNum=CdiffusionNum+1;
            elseif RN<=(sum(rate(1:4))/totalrate)
                [ystore,NZE,Conf,CH4DSP,CXFSP,C3diffusionSP,CdiffusionSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CCNTSP]=C3diffusion(NZE,W,L,Conf,CH4DSP,CXFSP,C3diffusionSP,H,C,...
                    CH3,CH2,CH,C2,C3,CX,CdiffusionSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CCNTSP,ystore);
                C3diffusionNum=C3diffusionNum+1;
            elseif RN<=(sum(rate(1:5))/totalrate)
                [CH3pickedup,Hpickedup,ystore,NZE,CH4DSP,Conf,CH4PSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,CH3PSP,CH2PSP,CHPSP,H2PSP]=CH4dissociation(NZE,CH4DSP,W,L,Conf,...
                    H,CH3,CH4PSP,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,CH3PSP,CH2PSP,CHPSP,H2PSP,ystore,CX);
                CH4dissociationNum=CH4dissociationNum+1;
                CH3on=CH3on+1;
                %if Hpickedup==0
                %    break
                %end
            elseif RN<=(sum(rate(1:6))/totalrate)
                [ystore,NZE,Conf,CH3DSP,CH3PSP,CH2DSP,CH4PSP,HdiffusionSP,CH4DSP,H2PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP]=CH3dissociation(NZE,W,L,Conf,H,CH2,...
                    CH3DSP,CH3PSP,CH2DSP,CH4PSP,CH3,CH,C,C3,HdiffusionSP,CH4DSP,H2PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,ystore,CX);
                CH3dissociationNum=CH3dissociationNum+1;
                CH3on=CH3on-1;
            elseif RN<=(sum(rate(1:7))/totalrate)
                [ystore,NZE,Conf,CH2DSP,CH2PSP,CH3PSP,CHDSP,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP]=CH2dissociation(NZE,W,L,Conf,H,CH,...
                    CH2DSP,CH2PSP,CH3PSP,CHDSP,CH3,CH2,C,C3,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP,ystore,CX);
                CH2dissociationNum=CH2dissociationNum+1;
            elseif RN<=(sum(rate(1:8))/totalrate)
                [ystore,CCNTSP,NZE,Conf,CHDSP,CHPSP,CdiffusionSP,CH2PSP,C2FSP,C3FSP,CXFSP,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CBdiffusionSP]=CHdissociation(NZE,...
                    W,L,Conf,H,C,CHDSP,CHPSP,C2,C3,CX,CdiffusionSP,CH2PSP,C2FSP,C3FSP,CXFSP,CH3,CH2,CH,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CCNTSP,CBdiffusionSP,ystore);
                CHdissociationNum=CHdissociationNum+1;
            elseif RN<=(sum(rate(1:9))/totalrate)
                [ystore,CCNTSP,NZE,Conf,C2FSP,CHPSP,C3FSP,CXFSP,CdiffusionSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP,CBdiffusionSP]=C2formation(NZE,W,L,Conf,C,C2,C2FSP,....
                    H,CX,CHPSP,C3FSP,CXFSP,CdiffusionSP,CH3,CH2,CH,C3,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,C3diffusionSP,CCNTSP,CBdiffusionSP,ystore);
                C2FNum=C2FNum+1;
                C2on=C2on+1;
            elseif RN<=(sum(rate(1:10))/totalrate)
                [ystore,CCNTSP,NZE,Conf,C3diffusionSP,C3FSP,CXFSP,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,CBdiffusionSP]=C3formation(NZE,W,L,Conf,C3diffusionSP,...
                    C,C3,C3FSP,C2,CX,CXFSP,H,CH3,CH2,CH,HdiffusionSP,CH4DSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,CHPSP,C2FSP,CCNTSP,CBdiffusionSP,ystore);
                C3FNum=C3FNum+1;
                C2on=C2on-1;
            elseif RN<=(sum(rate(1:11))/totalrate)
                [CX1pickedup,ystore,NZE,CCNTSP,Conf,C2FSP,CdiffusionSP,C3FSP,C3diffusionSP,CXFSP,CHPSP,CBdiffusionSP,C2on]=CXformation(NZE,W,L,Conf,H,C,C2,C3,CX,C2FSP,CdiffusionSP,C3FSP,...
                    C3diffusionSP,CXFSP,CHPSP,CCNTSP,CBdiffusionSP,C2on,ystore);
                CXFNum=CXFNum+1;
            elseif RN<=(sum(rate(1:12))/totalrate)
                [ystore,NZE,Conf,H2PSP,H2Num,CH4DSP,HdiffusionSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP]=H2production(NZE,...
                    W,L,Conf,H,H2PSP,H2Num,CH4DSP,CH3,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CH3PSP,CHDSP,CH2PSP,CdiffusionSP,CHPSP,C3diffusionSP,CH4PSP,ystore,CX);
                H2productionNum=H2productionNum+1;
            %elseif RN<=(sum(rate(1:13))/totalrate)
            %    [NZE,Conf,CH3DSP,HdiffusionSP,CH4DSP,CdiffusionSP,C3diffusionSP,CH2DSP,CHDSP,CH4PSP]=CH3diffusion(NZE,W,L,Conf,CH3,CH3DSP,H,CH2,CH,C,C3,HdiffusionSP,CH4DSP,...
            %        CdiffusionSP,C3diffusionSP,CH2DSP,CHDSP,CH4PSP);
            %    CH3diffusionNum=CH3diffusionNum+1;
            %elseif RN<=(sum(rate(1:14))/totalrate)
                %CH2diffusion;
            elseif RN<=(sum(rate(1:15))/totalrate)
                [ystore,NZE,CH4PSP,Conf,CH4DSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP]=CH4production(NZE,CH4PSP,W,L,Conf,H,CH4DSP,...
                    CH3,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP,ystore,CX);
                CH4productionNum=CH4productionNum+1;
                CH3on=CH3on-1;
            %elseif RN<=(sum(rate(1:16))/totalrate)
            %    [NZE,CH4PSP,Conf,CH4DSP,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP]=CH3production(NZE,CH4PSP,W,L,Conf,H,CH4DSP,...
            %        CH3,CH2,CH,C,C3,HdiffusionSP,CH3DSP,CH2DSP,CHDSP,CdiffusionSP,C3diffusionSP,H2PSP,CH3PSP,CH2PSP,CHPSP);
            %    CH3productionNum=CH3productionNum+1;
            %elseif RN<=(sum(rate(1:17))/totalrate)
            %    CH2productionNum=CH2productionNum+1;
            elseif RN<=(sum(rate(1:18))/totalrate)
                [ystore,CCNTSP,NZE,Conf,CHDSP,CHPSP,CH2PSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CBdiffusionSP]=CHproduction(NZE,...
                    W,L,Conf,H,CH,CHDSP,CHPSP,C,C2,C3,CX,CH2PSP,C2FSP,C3FSP,CXFSP,CdiffusionSP,CH3,CH2,HdiffusionSP,CH4DSP,H2PSP,CH3DSP,CH2DSP,CH3PSP,C3diffusionSP,CH4PSP,CCNTSP,CBdiffusionSP,ystore);
                CHproductionNum=CHproductionNum+1;
            elseif RN<=(sum(rate(1:19))/totalrate)
                [ystore,NZE,Conf,CNum,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP]=CCNT(NZE,W,L,Conf,CNum,C,...
                    CdiffusionSP,H,CH3,CH2,CH,C2,C3,CX,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP,ystore);
                %CCNTNum=CCNTNum+1;
            elseif RN<=(sum(rate(1:20))/totalrate)
                [ystore,NZE,Conf,CdiffusionSP,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP]=Cbulkdiffusion(NZE,W,L,Conf,C,...
                    CdiffusionSP,H,CH3,CH2,CH,C2,C3,CX,CH4DSP,C2FSP,CXFSP,HdiffusionSP,C3diffusionSP,CH3DSP,CH2DSP,CHDSP,CHPSP,C3FSP,CCNTSP,CBdiffusionSP,ystore);
                CbulkNum=CbulkNum+1;
            end
            RN2=rand(1);      
            t=t+(-1/totalrate*log(RN2));
   end

    if coverage>=coveragecheck
       mmm=mmm+1;
       if mmm==1
          t000=t;
          CXF000=CXFNum;
          CNT000=CbulkNum+CNum;
       else
          tcheck=t-t000;
       end
    end

    
   if coverage>(coveragecheck+coverageSTD)
       CXF001=CXFNum-CXF000;
       CNT002=(CbulkNum+CNum)-CNT000;
       coverageinCXFrate=CXF001/W^2*100/tcheck*60; % coverage percentage
       aveCNTrate=1e3*0.004277*CNT002/d^3/tcheck*60; % CNT rate (1e3)
       dropCNTrate=CNTrate001-aveCNTrate; % CNT rate drop (1e3)
       outpchecker=[W,d,T,coveragecheck,coverageSTD];
       gchecker=[tcheck coverageinCXFrate dropCNTrate CXF001 aveCNTrate];
       fileID = fopen ('KMCdeactivationdata.txt','w');
       fprintf(fileID,'%1s %5s %5s  %5s %5s\r\n','lattice','diameter','Temperature','coveragecheck','coverageSTD');
       fprintf(fileID,'%5.2f %8.2f %8.2f %10.2f %10.2f\r\n', outpchecker);
       fprintf(fileID,'%1s %12s %12s %12s %12s\r\n','tcheck(s)','coverageinrease/min','CNTdrop(gC/gcat/min 1e3)', 'CXF001', 'aveCNTrate(gC/gcat/min) 1e3');
       fprintf(fileID,'%5.5f %18.5f %18.5f %18.5f %18.5f\r\n', gchecker'); 
       fclose(fileID);
       break
    elseif coverage>(coveragecheck+coverageSTD*0.2)
           nnn=nnn+1;
           if nnn==1
              CNT001=(CbulkNum+CNum)-CNT000; 
              CNTrate001=1e3*0.004277*(CNT001)/d^3/tcheck*60; % CNT rate (1e3)
           end
    end
       

   
    if coverage <22
        pint=rem(step,PS);
    elseif coverage <33
        pint=rem(step,PS/5);
    elseif coverage <56
        pint=rem(step,PS/10);
    else
        pint=rem(step,PS/50);
    end
    
    switch(pint)
        case(0)
             count=count+1;
             rate1=0.004277*(CbulkNum+CNum)/d^3/t*60;
             rate2=0.008626*(CbulkNum+CNum)/d/t;
             
             fprintf('count %d\n',count)
             %fprintf('CH4dissociationNum %d\n',CH4dissociationNum)
             %fprintf('CH4productionNum %d\n',CH4productionNum) 
             %fprintf('difference %d\n',CH4dissociationNum-CH4productionNum)
             %fprintf('CH3dissociationNum %d\n',CH3dissociationNum)
             %fprintf('CH3productionNum %d\n',CH3productionNum)
             %fprintf('CH2dissociationNum %d\n',CH2dissociationNum)
             %fprintf('CHdissociationNum %d\n',CHdissociationNum)
             %fprintf('CHproductionNum %d\n',CHproductionNum)
             %fprintf('CH3on %d\n',CH3on)
             
             %fprintf('CH3diffusionNum %d\n',CH3diffusionNum)
             %fprintf('HdiffusionNum %d\n',HdiffusionNum)
             %fprintf('CdiffusionNum %d\n',CdiffusionNum)
             %fprintf('C3diffusionNum %d\n',C3diffusionNum)
             %fprintf('H2productionNum %d\n',H2productionNum)
             %fprintf('H number on surface %d\n',NZE(1))
             fprintf('C2FNum %d\n',C2FNum)
             fprintf('C3FNum %d\n',C3FNum)
             fprintf('CXFNum %d\n',CXFNum)
             %fprintf('CXFNum %d\n',CXFN)
             
             %fprintf('CNum %d\n',CNum)
             %fprintf('CCNTNum %d\n',CCNTNum)
             fprintf('CbulkNum %d\n',CbulkNum)
             fprintf('coverage %4.3e\n',coverage) %coveragennz(Conf)/W/L
             fprintf('t %4.3e\n',t)
             fprintf('tcheck %4.3e\n',tcheck)
             fprintf('rate1 gC/gcat/min %4.3e\n',rate1)
             %fprintf('rate2 nm/s %4.3e\n',rate2)
             %fprintf('trap1 %d\n',trap1)
             %fprintf('CCC %d\n',CCC)
             
             g = [g;t rate1 rate2 CXFNum coverage];
             outp=[W,d,T,PS];
             fileID = fopen ('KMCdata.txt','w');
             fprintf(fileID,'%1s %5s %5s %5s\r\n','lattice','diameter','Temperature','PS');
             fprintf(fileID,'%5.2f %8.2f %8.2f %8.2f\r\n', outp);
             fprintf(fileID,'%1s %16s %8s %12s %12s\r\n','t(s)','gC/gcat/min','nm/s', 'CXFNum', 'coverage');
             fprintf(fileID,'%5.5f %11.5f %11.5f %11.5f %11.5f\r\n', g'); 
             fclose(fileID);
    end
   %toc
    
end      

