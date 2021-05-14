clear
close all

%input data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alpha=2;
A=1;
tend=1; %t 끝 값
dx=pi/20;
dt=0.7*(dx^2)/alpha;
timestep=0.2; %timestep 초마다 plot함
beta=0.6; %Beta formulation에 사용할 beta

method = 6;
exactsolution = 1; %exact solution을 같이 표시하려면 1, 아니면 0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%method
%1.FTCS  2.Richardson  3.DuFort-Frankel 4.Laasonen  5.Crank-Nicolson
%6.Beta formulation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%initialization%%%%%
[u, imax, nmax] = initialization(A, dx, dt, tend);

%%%%%method%%%%%
if method == 1
    u = FTCS(u, alpha, dx, dt, imax, nmax);
elseif method == 2
    u = Richardson(u, alpha, dx, dt, imax, nmax);
elseif method == 3
    u = D_F(u, alpha, dx, dt, imax, nmax);
elseif method == 4
    u = Laasonen(u, alpha, dx, dt, imax, nmax);
elseif method == 5
    u = C_N(u, alpha, dx, dt, imax, nmax);
elseif method == 6
    u = Beta(beta, u, alpha, dx, dt, imax, nmax);
end

%%%%%exact solution%%%%%
uex=[];
if exactsolution
uex = exact(alpha, A, dx, dt, imax, nmax);
end

%%%%%plot%%%%%
t=solplot(alpha, A, u, uex, dx, dt, tend, timestep, method, exactsolution, beta);