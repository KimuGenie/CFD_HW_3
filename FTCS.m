function u = FTCS(u, alpha, dx, dt, imax, nmax)

for n=1:nmax-1
    for i=2:imax-1
        u(i, n+1) = u(i, n)+alpha*dt/(dx^2)*(u(i+1, n)-2*u(i, n)+u(i-1, n));
    end
end

end