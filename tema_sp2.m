% Tema 2 SP 
% Numarul de ordine D = 17 => semnal dreptunghiular
% Numarul de coeficienti N = 50
% Perioada semnalului P = 40


N = 50; 
D = 17; 
P = 40; 
f = 1/P;                         % frecventa semnalului
w0 = 2*pi/P;                     % pulsatia semnalului
t = 0:0.02:P-0.02;                 % timpul pentru o perioada 
x = zeros(1,length(t));          % initializarea vectorului x care va avea ca valori 0
x = 0.5+0.5*square(t*w0,50);     % se va inmulti semnalul cu 0.5 si se va aduna un 0.5 pentru a avea amplitudinea pe intervalul 0,1, in loc de -1,1
t4 = 0:0.02:4*P-0.02;            % vectorul timp pentru reprezentarea pe 4 perioade
x4 = repmat(x,1,4);              % vectorul x pe 4 perioade (repmat va afisa o matrice de copii ale lui x, cu 1 rand si 4 coloane)

figure(1);
plot(t4,x4);                     % afisarea lui x(t)
title('x(t)');
hold on

for k = -N:N
    xnou = x;
    xnou = xnou.*exp(-j*k*w0*t);    % transformarea semnalului in serie fourier complexa, inmultirea intre doi vectori
    X(k+51) = trapz(t,xnou);        % trapz calculeaza integrala impartind suprafata semnalului in forme trapezoidale pentru calculul ariei
end

% reconstruirea semnalului dat:

for i = 1:length(t);
    xnew(i) = 0;                    % xnew = semnalul reconstruit
for k = -N:N
xnew(i) = xnew(i) + (1/P)*X(k+N+1)*exp(j*k*w0*t(i));
end
end
xnew4 = repmat(xnew,1,4);           % xnew cu 4 perioade

figure(2);
plot(t4,x4);                        % afisarea lui x(t)
title('x(t) si new(t)');
hold on
plot(t4,xnew4);                     % afisarea lui xnew4
xlabel('Timp [s]');
ylabel('Amplitudine');

F = -N*f:f:N*f;                     % vectorul de frecvente pentru generarea spectrului
figure(3);
stem(F,abs(X)); 
title('Spectrul lui x(t)');



%Seria  Fourier Complexa ofera o descompunere a semnalului periodic intr-o
%suma de componente elementare de tip exponential, acestea putand fi scrise
%ca o suma de sinusuri si cosinusuri care au diferite frecvente si diferiti
%coeficienti( acesti coeficienti reprezinta spectrul).Semnalul reconstruit 
%cu un numar finit de termeni se apropie ca forma de semnalul original avand 
%o anumita marja de eroare. 
