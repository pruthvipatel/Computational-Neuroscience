function [dydt]=hodgkin(t,statevars,Iext)

global C Gk Gna Gl Ek Ena El  Gnabar Gkbar Glbar phi;

V=statevars(1);
m=statevars(2);
h=statevars(3);
n=statevars(4);

Gna = Gnabar*m^3*h;

Gk = Gkbar*n^4; 

Gl = Glbar;



an = 0.01*phi*(V+50)/(1-exp(-(V+50)/10));
bn = 0.125*phi*exp(-(V+60)/80);
  
am = 0.1*phi*(V+35)/(1-exp(-(V+35)/10));
bm = 4*phi*exp(-(V+60)/18) ;
  
ah = 0.07*phi*exp(-(V+60)/20);
bh = phi/(exp(-(V+30)/10)+1);

dV= (1/C)*(Iext-Gk*(V-Ek)-Gna*(V-Ena)-Gl*(V-El));
dm= am*(1-m)- bm*m;
dn= an*(1-n)- bn*n;
dh= ah*(1-h)- bh*h;

dydt=[dV;dm;dh;dn];

return;


