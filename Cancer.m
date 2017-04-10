clear all, close all, clc
A = importdata('WDBC.dat');
P = A.data;
t1 = A.textdata(:,1);
t2 = A.textdata(:,2);

for i=1:length(A.textdata(:,2))
    if(t2{i} == 'M')
        t3(i) = 1;
    else
        t3(i) = 0;
    end
end

%?
T = t3'