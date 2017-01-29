global C Iext T Glbar Gnabar Gkbar Ena Ek El phi q;

q=3;
T=6.3;
phi=q^((T-6.3)/10);

Gnabar=120;
Gkbar=36;
Glbar=0.3;
Ena=55;
Ek= -72;
El= -49;
C=1;

V = -60 ;
m = 0 ;
h = 0.6 ;
n = 0.3 ;

statevari=[V,m,h,n];

iext(1)=0;
iext(2)=9.62;
iext(3)=0;

tlen=100;
stimstart=5;
stimdur=75;
stimend=stimstart+stimdur;


stim(1)=0;
stim(2)=stimstart;
stim(3)=stimend;
stim(4)=tlen;

time=0;

statevarloop=statevari;

for i=1:3

    [t,var]= ode15s(@(t,var) hodgkin(t,var,Iext(i)) ,[stim(i) stim(i+1)],statevarloop(end,:));
    statevarloop=[statevarloop;var];
    time=[time;t];
end

figure
subplot(211)
plot(time,statevarloop(:,1));
xlabel('Time(msec)');
ylabel('Voltage(mV)');

subplot(212)
hold on
plot(time,statevarloop(:,2),'b');
plot(time,statevarloop(:,3),'y');
plot(time,statevarloop(:,4),'r');
legend('m','h','n');
set(gca,'TickDir','Out');

