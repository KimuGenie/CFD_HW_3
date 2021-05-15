clear
close all

%input data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alpha=2;
A=1;
dxbox={'pi/20', 'pi/25', 'pi/30'}; %원하는 dx 값들
tend=1; %t 끝 값
beta=0.51; %Beta formulation에 사용할 beta

method = 6;
ed = 1; %α(△t)/(△x)²값을 어디까지 볼 것인지
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%method
%1.FTCS  2.Richardson  3.DuFort-Frankel 4.Laasonen  5.Crank-Nicolson
%6.Beta formulation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

lin = {'-.k', '-k', '--k'};
methods = {'FTCS', 'Richardson', 'DuFort-Frankel', 'Laasonen', 'Crank-Nicolson', strcat('β=', num2str(beta)), 'kim'};

hold on

for j=1:numel(dxbox)
    
i=1;
del = zeros(1, ed/0.01);
dx = str2num(cell2mat(dxbox(j)));

for s = 0.01:0.01:ed
    
    dt=s*(dx^2)/alpha;
    
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

uex = exact(alpha, A, dx, dt, imax, nmax);

n=round(tend/dt)+1;
del(i)=abs(max(u(:, n))-max(uex(:, n)))/max(uex(:, n))*100;

i=i+1;
end

plot(0.01:0.01:ed, del, char(lin(mod(j, 3)+1)), 'linewidth', 1)

end

title(methods(method), 'fontsize', 15)
xlabel('α(△t)/(△x)²', 'fontsize', 15)
ylabel('error(%)', 'fontsize', 15)
legend(dxbox, 'location', 'northwest')
set(gcf, 'position', [100 300 400 300])