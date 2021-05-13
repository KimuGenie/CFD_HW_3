function solplot(alpha, A, u, uex, dx, dt, tend, timestep, method, exactsolution)

methods = {'FTCS'};
lin = {'-+', '-*', '-s', '-d', '-^' '-p'};
i=0;

hold on

for n=1:round(timestep/dt):tend/dt+1
    if exactsolution == 1
        plot(0:dx:pi, uex(:, n), '-o', 'markersize', 8, 'color', [0.5 0.5 0.5], 'linewidth', 1)
    end
    plot(0:dx:pi, u(:, n), char(lin(mod(i, 6)+1)), 'markersize', 6, 'markerfacecolor', 'k', 'color', 'k', 'linewidth', 1)
    i=i+1;
end

axis([0 pi 0 A*1.1])
title(strcat(methods(method), '  α(△t)/(△x)=', num2str(round(alpha*dt/(dx^2),2))), 'fontsize', 15)
xlabel('x', 'fontsize', 15)
ylabel('u', 'fontsize', 15)
set(gcf, 'position', [100 300 400 300])

end