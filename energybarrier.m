function [Ea] =energybarrier(coverage,coveragecheck)
Ea=zeros(1,20);

% Diffusion Process
Ea(1)=0.3*96.4869*1000; %0.3%0.28 HdiffusionSP Adiff for H diffusion 0.31 0.34        553
Ea(3)=0.45*96.4869*1000; %0.83%0.48 CdiffusionSP Adiff for C diffusion 1.62 0.45      P33 0.48
Ea(4)=0.48*96.4869*1000; %0.6%C3diffusionSP  0.48                                         P33 0.48
Ea(20)=1.34*96.4869*1000;%1.6%1.15 C Bulk diffusionSP

% Diffusion Process not considered
Ea(2)=0.45*96.4869*1000;%0.45%0.17 CHdiffusionSP Adiff for CH diffusion 1.04 0.55 
Ea(13)=0.3*96.4869*1000;%0.3%0.23 CH3diffusionSP 
Ea(14)=0.39*96.4869*1000;%0.39%0.39 CH2diffusionSP 

if coverage<=coveragecheck
    Ea(11)=0.02*96.4869*1000; %1.2%  CXFSP Aforward for CX formation reaction   
else
    Ea(11)=1.872*96.4869*1000;   %P33 1.31 revised CX 1.56 p20% 1.872
end

% CNT growth reaction
Ea(19)=0.89*96.4869*1000;%0.89%  0.89 CCNTSP  P33   % 1.03 from Ding et al.
Ea(12)=1.31*96.4869*1000; %1%1 H2PSP Abackward for H2=H+H reaction  P33  1.31
% CHx Reactions
%Ea(5)=((1.48-1.18)/(0.25-0)*(coverage-0.25)+1.48)*96.4869*1000;%1.31
%%CH4DSP  Aforward for CH4=CH3+H reaction  1.23 1.08     Coverage Dependent
%%1.14 %P33 1.14
Ea(6)=0.73*96.4869*1000;%0.845%0.89 CH3DSP  Aforward for CH3=CH2+H reaction 0.62 0.71   P33 0.73
Ea(7)=0.34*96.4869*1000;%0.365%0.41 CH2DSP Aforward for CH2=CH+H reaction 0.22  0.15  p33 0.35
Ea(16)=0.95*96.4869*1000;%0.70%0.73 CH3PSP Abackward for CH3=CH2+H reaction 0.53 0.79        Not Considered PP33 0.95
Ea(17)=0.75*96.4869*1000;%0.75%0.79 CH2PSP Abackward for CH2=CH+H reaction 0.55 0.66         Not Considered
Ea(8)=1.17*(1+0.0025*coverage)*96.4869*1000;%1.15 %1.38 CHDSP
if coverage <=10
    Ea(18)=1.21*96.4869*1000;%0.91%0.96 CHPSP Abackward for CH=C+H  reaction 0.67 0.76  ...0.91 P33 1.29 1.15
else
    Ea(18)=0.51*96.4869*1000;%0.91%0.96 CHPSP Abackward for CH=C+H  reaction 0.67 0.76  ...0.91 P33 1.29 1.15
end

if coverage <=22
    Ea(5)=1.14*(1+0.0008*coverage)*96.4869*1000;% 1.14 CH4DSP
    Ea(15)=0.65*(1-0.0025*coverage)*96.4869*1000;%0.5%0.4 %CH4PSP Abackward for CH4=CH3+H reaction 0.56 1.0  p33 0.68
    % Carbons nucleation reactions
    Ea(9)=0.88*96.4869*1000;%0.89%  0.88 C2FSP Aforward for C+C=C2 reaction   P33 0.88
    Ea(10)=0.97*96.4869*1000;%1.07%  1.07 C3FSP Aforward for C2+C=C3 reaction   P33 0.97
elseif coverage<=33
    Ea(5)=1.16*(1+0.012*(coverage-22))*96.4869*1000;% 1.14 CH4DSP
    Ea(15)=0.53*(1+0.002*(coverage-22))*96.4869*1000;%0.5%0.4 %CH4PSP Abackward for CH4=CH3+H reaction 0.56 1.0  p33 0.68
    % Carbons nucleation reactions
    Ea(9)=0.88*(1-0.0175*(coverage-22))*96.4869*1000;%0.89%  0.88 C2FSP Aforward for C+C=C2 reaction   P33 0.88
    Ea(10)=0.97*96.4869*1000;%1.07%  1.07 C3FSP Aforward for C2+C=C3 reaction   P33 0.97
elseif coverage<=56
    Ea(5)=1.31*(1+0.011*(coverage-33))*96.4869*1000;% 1.14 CH4DSP
    Ea(15)=0.54*(1+0.002*(coverage-33))*96.4869*1000;%0.5%0.4 %CH4PSP Abackward for CH4=CH3+H reaction 0.56 1.0  p33 0.68
    % Carbons nucleation reactions
    Ea(9)=0.71*(1-0.0215*(coverage-33))*96.4869*1000;%0.89%  0.88 C2FSP Aforward for C+C=C2 reaction   P33 0.88
    Ea(10)=0.97*(1-0.02*(coverage-33))*96.4869*1000;%1.07%  1.07 C3FSP Aforward for C2+C=C3 reaction   P33 0.97
else 
    Ea(5)=1.64*(1+0.005*(coverage-56))*96.4869*1000;% 1.14 CH4DSP
    Ea(15)=0.57*(1-0.040*(coverage-56))*96.4869*1000;%0.5%0.4 %CH4PSP Abackward for CH4=CH3+H reaction 0.56 1.0  p33 0.68
    % Carbons nucleation reactions
    Ea(9)=0.45*96.4869*1000;%0.89%  0.88 C2FSP Aforward for C+C=C2 reaction   P33 0.88
    Ea(10)=0.64*96.4869*1000;%1.07%  1.07 C3FSP Aforward for C2+C=C3 reaction   P33 0.97
    
end

end

