%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Results parameters neutronic calculation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Instrutions %%%%%%%%%%%%%%%%%
%The program calculate K-inf,Conversion Ratio,Prompt Neutron Generation
%Time, Delayed neutrons and alpha rossi.
%Figures - NuScale comparative
%copy and paste [file.res] and [file.dep] results from SERPENT and run code in MATLAB
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Run Section
%K-infinite
SIX_FF_KINF(1:end,1)
%standart desviation
SIX_FF_KINF(1:end,2)
DAYS
BU
%Graph
%k-infinity
hold on;
figure (1)
hold on;
plot(BU(1:length(CONVERSION_RATIO)),SIX_FF_KINF(1:end,1))
xlabel('Queima cumulativa[MWd/kgHM]')
ylabel('[K_{\infty}]')
%Conversion Ratio1

hold on
figure (2)
hold on;
plot(BU(1:length(CONVERSION_RATIO)),CONVERSION_RATIO(1:end,1))
xlabel('Queima cumulativa[MWd/kgHM]')
ylabel('[CR]')

%Method Calculation of adjoint-weighted kinetic parameters with the reactor
%Monte Carlo code RMC - SERPENT

%Delayed neutrons - Beta-Effective
hold on;
figure (3)
hold on;
plot(BU(1:length(CONVERSION_RATIO)),ADJ_PERT_BETA_EFF(1:end,1))
xlabel('Queima cumulativa[MWd/kgHM]')
ylabel('[\beta_{eff}]')


%Propmt Neutron Generation Time
ADJ_PERT_BETA_EFF(1:end,1)';
PNGT=ADJ_PERT_LIFETIME./ABS_KEFF;

hold on;
figure (4)
hold on;
plot(BU(1:length(CONVERSION_RATIO)),(10^6)*PNGT(1:end,1))
xlabel('Queima cumulativa[MWd/kgHM]')
ylabel('[\Lambda](\mu s)')

%Rossi_Alpha
%hold on
%figure (9)
%ALPHA=-(ADJ_PERT_BETA_EFF./ADJ_PERT_GEN_TIME)
%plot(DAYS,ALPHA(1:end,1),'o')
%xlabel('Time[days]')
%ylabel('ALPHA-ROSSI')

hold on;
figure (5)
plot(BU(1:length(CONVERSION_RATIO)),ADJ_PERT_ROSSI_ALPHA(1:end,1))
xlabel('Time[days]')
ylabel('ROSSI ALPHA[\alpha]')


hold on;
figure (6)
plot(BU(1:length(CONVERSION_RATIO)),SIX_FF_ETA (1:end,1))
xlabel('Queima cumulativa[MWd/kgHM]')
ylabel('REPRODUÇÃO[\eta]')


REACTIVITY=(1-ABS_KEFF(1:end,1))/(ABS_KEFF(1:end,1))
hold on;
figure (7)
plot(BU(1:length(CONVERSION_RATIO)),REACTIVITY(1:end,1))
ylim([-0.2 0.2])
xlabel('Queima cumulativa[MWd/kgHM]')
ylabel('REATIVIDADE[\rho]')


%lifetime neutrons
hold on;
figure (8)
hold on;
plot(BU(1:length(CONVERSION_RATIO)),ADJ_PERT_LIFETIME(1:end,1))
xlabel('Queima cumulativa[MWd/kgHM]')
ylabel('[\lambda]')

PNGT2=(ADJ_PERT_LIFETIME(:,1)./ABS_KEFF(:,1))*10^6
%errorbar(DAYS(1:length(CONVERSION_RATIO)),ABS_KINF(1:end,1),ABS_KINF(1:end,2))