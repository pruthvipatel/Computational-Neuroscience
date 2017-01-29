function [dydt]=HH(t,statevar,Iext)

global C Gk Gna Gl Ek Ena El  Gnabar Gkbar Glbar phi;

vars = num2cell(statevar) ;

[V,m,h,n] = deal(vars{:}) ;

Gna = Gnabar*m^3*h;

Gk = Gkbar*n^4; 

Gl = Glbar;



alphan = 0.01*phi*(V+50)/(1-exp(-(V+50)/10));
betan = 0.125*phi*exp(-(V+60)/80);
  
alpham = 0.1*phi*(V+35)/(1-exp(-(V+35)/10));
betam = 4*phi*exp(-(V+60)/18) ;
  
alphah = 0.07*phi*exp(-(V+60)/20);
betah = phi/(exp(-(V+30)/10)+1);

dV= (1/C)*(Iext-Gk*(V-Ek)-Gna*(V-Ena)-Gl*(V-El));
dm= alpham*(1-m)- betam*m;
dn= alphan*(1-n)- betan*n;
dh= alphah*(1-h)- betah*h;

dydt=[dV;dm;dh;dn];

return;


