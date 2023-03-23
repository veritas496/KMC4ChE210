function [A]=kineticparameters(T)

P=1.01e5; N=6.02e23;
h = 6.626068e-34;kb = 1.3806503e-23;

Cvib = [504 518 599];
C2vib = [306 307 309 425 438 1476];
C2TS = [332 456 537 560 609];
C3vib = [243 274 333 396 434 439 461 1137 1442];
C3TS = [223 276 334 406 454 548 622 1435];
CXvib = [134 143 167 406 412 421 439 446 460 582 591 763 918 966 989 1126 1127 1186];
CXTS = [46 130 214 249 261 295 324 371 403 455 462 481 507 1083 1166 1394 1596];
Hvib = [795 822 1205];
CHvib = [414 425 617 685 719 3016];
CHTS = [450 503 593 1847];
CH2vib = [245 356 491 539 687 1364 2579 3074];
CH2TS = [235 331 396 516 691 851 1943 3136];
CH3vib = [262 317 437 515 1165 1196 1282 2740 2884 2893];
CH3TS = [265 441 502 711 865 1241 1846 2859 3061];
CH4GAS = [3067 3067 3067 2956 1519 1519 1296 1296 1296];
CH4TS = [134 181 309 543 581 960 995 1134 1172 1359 1392 2897 2977 3034];
H2TS = [244 379 1662 1853];

% Surface Reaction

for i = 1:length(C2vib)
    xb(i) = 4.8e-3*C2vib(i)*300/T;
    Mb(i) = 1/(1-exp(-xb(i)));
end
QvibC2 = prod(Mb); %Svib for surface C2

for i = 1:length(C2TS)
    xc(i) = 4.8e-3*C2TS(i)*300/T;
    Mc(i) = 1/(1-exp(-xc(i)));
end
QvibC2TS = prod(Mc); %Svib for surface C2TS


for i = 1:length(CHTS)
    xf(i) = 4.8e-3*CHTS(i)*300/T;
    Mf(i) = 1/(1-exp(-xf(i)));
end
QvibCHTS = prod(Mf); %Svib for surface CHTS

for i = 1:length(CH2vib)
    xg(i) = 4.8e-3*CH2vib(i)*300/T;
    Mg(i) = 1/(1-exp(-xg(i)));
end
QvibCH2 = prod(Mg); %Svib for surface CH2

for i = 1:length(CH2TS)
    xh(i) = 4.8e-3*CH2TS(i)*300/T;
    Mh(i) = 1/(1-exp(-xh(i)));
end
QvibCH2TS = prod(Mh); %Svib for surface CH2TS

for i = 1:length(CH3TS)
    xi(i) = 4.8e-3*CH3TS(i)*300/T;
    Mi(i) = 1/(1-exp(-xi(i)));
end
QvibCH3TS = prod(Mi); %Svib for surface CH3TS

for i = 1:length(CH3vib)
    xj(i) = 4.8e-3*CH3vib(i)*300/T;
    Mj(i) = 1/(1-exp(-xj(i)));
end
QvibCH3 = prod(Mj); %Svib for surface CH3

for i = 1:length(C3TS)
    xk(i) = 4.8e-3*C3TS(i)*300/T;
    Mk(i) = 1/(1-exp(-xk(i)));
end
QvibC3TS = prod(Mk); %Svib for surface C3TS

for i = 1:length(C3vib)
    xl(i) = 4.8e-3*C3vib(i)*300/T;
    Ml(i) = 1/(1-exp(-xl(i)));
end
QvibC3 = prod(Ml); %Svib for surface C3

for i = 1:length(CH4GAS)
    xm(i) = 4.8e-3*CH4GAS(i)*300/T;
    Mm(i) = 1/(1-exp(-xm(i)));
end
QvibCH4GAS = prod(Mm); %Svib for surface CH4GAS

for i = 1:length(CH4TS)
    xn(i) = 4.8e-3*CH4TS(i)*300/T;
    Mn(i) = 1/(1-exp(-xn(i)));
end
QvibCH4TS = prod(Mn); %Svib for surface CH4TS

for i = 1:length(H2TS)
    xo(i) = 4.8e-3*H2TS(i)*300/T;
    Mo(i) = 1/(1-exp(-xo(i)));
end
QvibH2TS = prod(Mo); %Svib for surface H2TS

for i = 1:length(CXTS)
    xp(i) = 4.8e-3*CXTS(i)*300/T;
    Mp(i) = 1/(1-exp(-xp(i)));
end
QvibCXTS = prod(Mp); %Svib for surface CXTS

for i = 1:length(CXvib)
    xq(i) = 4.8e-3*CXvib(i)*300/T;
    Mq(i) = 1/(1-exp(-xq(i)));
end
QvibCX= prod(Mq); %Svib for surface CX


% Surface Diffusion
CHBRI = [529 576 668 684 3187];
CBRI = [635 663];
HBRI = [1005 1279];
for i = 1:length(CHBRI)
    za(i) = 4.8e-3*CHBRI(i)*300/T;
    QDa(i) = 1/(1-exp(-za(i)));
end
QvibCHBRI = prod(QDa); %Qvib for CHBRI fprintf('QvibCHBRI %3.2d\n', QvibCHBRI)

for i = 1:length(CBRI)
    zb(i) = 4.8e-3*CBRI(i)*300/T;
    QDb(i) = 1/(1-exp(-zb(i)));
end
QvibCBRI = prod(QDb); %Qvib for CBRI fprintf('QvibCBRI %3.2d\n', QvibCBRI)

for i = 1:length(HBRI)
    zc(i) = 4.8e-3*HBRI(i)*300/T;
    QDc(i) = 1/(1-exp(-zc(i)));
end
QvibHBRI = prod(QDc); %Qvib for HBRI fprintf('QvibHBRI %3.2d\n', QvibHBRI)

for i = 1:length(Cvib)
    zd(i) = 4.8e-3*Cvib(i)*300/T;
    QDd(i) = 1/(1-exp(-zd(i)));
end
QvibC = prod(QDd); %Qvib for C fprintf('QvibC %3.2d\n', QvibC)

for i = 1:length(Hvib)
    ze(i) = 4.8e-3*Hvib(i)*300/T;
    QDe(i) = 1/(1-exp(-ze(i)));
end
QvibH = prod(QDe); %Qvib for H fprintf('QvibH %3.2d\n', QvibH)

for i = 1:length(CHvib)
    zf(i) = 4.8e-3*CHvib(i)*300/T;
    QDf(i) = 1/(1-exp(-zf(i)));
end
QvibCH = prod(QDf); %Qvib for CH fprintf('QvibCH %3.2d\n', QvibCH)

A=zeros(1,18);
% Diffusion Pre-factor A
A(1) = kb*T/h*QvibHBRI/QvibH; %HdiffusionSP Adiff for H diffusion fprintf('AHdiff %3.2d\n',AHdiff)
A(2) = 0*kb*T/h*QvibCHBRI/QvibCH; %CHdiffusionSP Adiff for CH diffusion 0.17
A(3) = kb*T/h*QvibCBRI/QvibC; %CdiffusionSP Adiff for C diffusion fprintf('ACdiff %3.2d\n',ACdiff)

% Reaction Pre-factor A

A(5) = h^2*P/(2*pi*0.016/N*kb*T)^1.5*QvibCH4TS/QvibCH4GAS; %Aforward for CH4=CH3+H reaction fprintf('ACH4for %3.2d\n', ACH4for) 
A(6) = kb*T/h*QvibCH3TS/QvibCH3; %%Aforward for CH3=CH2+H reaction fprintf('ACH3for %3.2d\n', ACH3for)
A(7) = kb*T/h*QvibCH2TS/QvibCH2;%Aforward for CH2=CH+H reaction fprintf('ACH2for %3.2d\n', ACH2for)
A(8) = kb*T/h*QvibCHTS/QvibCH;% Aforward for CH=C+H reaction fprintf('ACHfor %3.2d\n', ACHfor)
A(9) = kb*T/h*QvibC2TS/QvibC/QvibC; %Aforward for C+C=C2 reaction fprintf('AC2for %3.2d\n', AC2for)
A(10) =kb*T/h*QvibC3TS/QvibC2/QvibC;%Aforward for C2+C=C3 reaction fprintf('AC3for %3.2d\n', AC3for)
A(11) = kb*T/h*QvibCXTS/QvibC3/QvibC3;% CXFSP Aforward for C3+C3=C6 reaction fprintf('AC633for %3.2d\n', AC633for)
A(12) = kb*T/h*QvibH2TS/QvibH^2; %H2PSP Abackward for H2=H+H reaction fprintf('AH2back %3.2d\n', AH2back)
A(15) = kb*T/h*QvibCH4TS/QvibCH3/QvibH;%Abackward for CH4=CH3+H reaction fprintf('ACH4back %3.2d\n', ACH4back)
A(16) = 0*kb*T/h*QvibCH3TS/QvibCH2/QvibH;%Abackward for CH3=CH2+H reaction fprintf('ACH3back %3.2d\n', ACH3back)
A(17) = 0*kb*T/h*QvibCH2TS/QvibCH/QvibH; %Abackward for CH2=CH+H reaction fprintf('ACH2back %3.2d\n', ACH2back)
A(18) = kb*T/h*QvibCHTS/QvibC/QvibH; %CHPSP Abackward for CH=C+H  reaction fprintf('ACHback %3.2d\n', ACHback)
A(19)=A(9);% CNT growth
A(20)=A(19);

A(4)=A(3);%C3diffusionSP
A(13)=0*kb*T/h*QvibCHBRI/QvibCH;%CH3diffusionSP = CHdiffusionSP
A(14)=0;%CH2diffusionSP 

end
