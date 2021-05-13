clear
close all

alpha=2;
A=1;
tend=1; %t 끝 값
dx=pi/20;
dt=0.001;
timestep=0.2; %timestep 초마다 plot함.

method = 1;
exactsolution = 1;

u = initialization(A, dx, dt, tend);

u = FTCS(u, alpha, dx, dt, tend);

uex = [];
if exactsolution
uex = exact(alpha, A, dx, dt, tend);
end

solplot(alpha, A, u, uex, dx, dt, tend, timestep, method, exactsolution)