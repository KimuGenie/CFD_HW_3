function summary(alpha, dx, dt, u, uex, n, t)
disp(['α(△t)/(△x)² = ', num2str(alpha*dt/(dx^2))])
disp(['plotted time = ', num2str(t)])
disp(['%error at t = ', num2str(t(end)), ' is ',...
    num2str(round(abs(max(uex(:, n))-max(u(:, n)))/max(uex(:, n))*100, 6)), '%'])