clear all, close all, clc
A = importdata('WDBC.dat');
P = A.data';
t1 = A.textdata(:,1);
t2 = A.textdata(:,2);

for i=1:length(A.textdata(:,2))
    if(t2{i} == 'M')
        t3(i) = 1;
    else
        t3(i) = -1;
    end
end

%?
T = t3;

Q = length(P);

n1 = 300;
ep = 1;

W1 = ep*(2*rand(n1, 30)-1);
b1 = ep*(2*rand(n1, 1)-1);

W2 = ep*(2*rand(1, n1)-1);
b2 = ep*(2*rand-1);
alfa = 0.01;

for epocas=1:5000
   sum = 0;
   for q = 1:Q
       a1 = tansig(W1*P(:,q)+b1);
       a2(q) = tansig(W2*a1+b2);
       
       e = T(q) - a2(q);
       
       S2 = -2*(1-a2(q)^2)*e;
       S1 = diag(1-a1.^2)*W2'*S2;
       
       W2 = W2 - alfa*S2*a1';
       b2 = b2 - alfa*S2;
       W1 = W1 - alfa*S1*P(:,q)';
       b1 = b1 - alfa*S1;
       
       sum = e^2+sum;       
   end
   emedio(epocas) = sum/Q;
   
   if(mod(100000, epocas) == 0)
      clc
      disp('Mientras tanto sigo esperando...')
      epocas
   end
end

figure
title('Error cuadratico medio')
hold on
title('Emedio');
plot(emedio)
hold off

for q=1:Q
   a(q) = tansig(W2*tansig(W1*P(:,q)+b1)+b2);
end
figure
hold on
a
title('Salida (a)');
plot(a)
hold off