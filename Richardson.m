function u = Richardson(u, alpha, dx, dt, imax, nmax)

%FTCS
for i=2:imax-1
    u(i, 2) = u(i, 1)+alpha*dt/(dx^2)*(u(i+1, 1)-2*u(i, 1)+u(i-1, 1));
end

%Richardson
for n=2:nmax-1
    for i=2:imax-1
        u(i, n+1) = u(i, n-1)+2*alpha*dt/(dx^2)*(u(i+1, n)-2*u(i, n)+u(i-1, n));
    end
end

end