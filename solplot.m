function t=solplot(alpha, A, u, uex, dx, dt, tend, timestep, method, exactsolution, beta)

methods = {'FTCS', 'Richardson', 'DuFort-Frankel', 'Laasonen', 'Crank-Nicolson', strcat('β=', num2str(beta))};
lin = {'-^', '-p', '-d', '-s', '-*', '-+'};
i=0;

hold on

while i*timestep <= tend
    n=round(i*timestep/dt)+1; %i*timestep초가 몇 n인지 계산
    t(i+1)=(n-1)*dt;
    if exactsolution == 1
        plot(0:dx:pi, uex(:, n), '-o', 'markersize', 8, 'color', 'k', 'linewidth', 0.1)
    end
    plot(0:dx:pi, u(:, n), char(lin(mod(i, 6)+1)), 'markersize', 6, 'markerfacecolor', 'k', 'color', 'k', 'linewidth', 0.1)
    i=i+1;
end

axis([0 pi 0 A*1.1])
title(strcat(methods(method), '  α(△t)/(△x)²=', num2str(alpha*dt/(dx^2))), 'fontsize', 15)
xlabel('x', 'fontsize', 15)
ylabel('u', 'fontsize', 15)
set(gcf, 'position', [100 300 400 300])

end