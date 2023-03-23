clear
clc
W=input('the size of the lattice');
L=W;

m=input('round');%
n=input('step per round');%step per round
numstick=input('number of stick'); % number of non-movable atoms
Natom=input('number of atom');% number of movable atoms
g=[];
A=200:200:numstick;
B=[1 A];

for i=1:length(B)
    coverage = B(i)/W/L*100;
    [ lattice,MPST,MPNN,BCC ] = SRF( W,L,m,n,B(i),Natom );
    g = [g;Natom B(i) coverage MPST MPNN BCC];
    outp=[W,m,n];
    fileID = fopen ('randomdata.txt','w');
    fprintf(fileID,'%1s %5s %5s\r\n','lattice size','round','step');
    fprintf(fileID,'%5.2f %8.2f %8.2f\r\n', outp);
    fprintf(fileID,'%1s %12s %12s %12s %12s %10s\r\n','Natom','numstick','coverage%','MPST/step', 'MPNN/step','BC/step');
    fprintf(fileID,'%5.3e %5.3e %11.5f %11.5f %11.5f %11.5f\r\n', g'); 
    fclose(fileID);
end

