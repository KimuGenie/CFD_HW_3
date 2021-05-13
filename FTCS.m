function u = FTCS(u, alpha, dx, dt, tend)

for n=1:tend/dt
    for i=2:pi/dx
        u(i, n+1) = u(i, n)+alpha*dt/(dx^2)*(u(i+1, n)-2*u(i, n)+u(i-1, n));
    end
end

end