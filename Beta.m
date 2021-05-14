function u = Beta(beta, u, alpha, dx, dt, imax, nmax)

A=zeros(imax-2);
k=2*alpha*dt/(dx^2);

b=-beta*k/2;
d=1+beta*k;
a=-beta*k/2;

for n=1:nmax-1
    for i=2:imax-1
        c(i)=u(i, n)+(1-beta)*k/2*(u(i+1, n)-2*u(i, n)+u(i-1, n));
    end
    
    for i=1:imax-3
        A(i,i+1)=a;
        A(i+1,i)=b;
    end
    
    for i=1:imax-2
        A(i,i)=d;
        C(i,1)=c(i+1);
    end
    C(1, 1)=C(1, 1)-b*u(1, n+1);
    C(imax-2, 1)=C(imax-2, 1)-a*u(imax, n+1);
    U=A\C; %gauss elimination
    
    for i=1:imax-2
        u(i+1, n+1)=U(i);
    end
end

end