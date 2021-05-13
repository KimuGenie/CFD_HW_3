function uex = exact(alpha, A, dx, dt, tend)

for n=1:tend/dt+1
    for i=1:pi/dx+1
        uex(i, n) = A*exp(-alpha*dt*(n-1))*sin(dx*(i-1));
    end
end

end