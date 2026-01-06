% mosfet_transfer_Id_Vgs.m
% MOSFET long-channel (square-law) - Transfer curve: Id vs Vgs (Vds fixed)

clear; clc; close all;

% --- Parameters (simple, reasonable example) ---
Vth = 0.7;          % Threshold voltage [V]
beta = 1e-3;        % beta = mu*Cox*(W/L) [A/V^2] (effective)
Vds = 1.0;          % Fixed drain-source voltage [V]

% Optional: channel-length modulation (set to 0 for now)
lambda = 0.0;       % [1/V]

% --- Sweep Vgs ---
Vgs = linspace(0, 2.0, 500);
Id  = zeros(size(Vgs));

for i = 1:length(Vgs)
    Vov = Vgs(i) - Vth;  % Overdrive voltage

    if Vov <= 0
        Id(i) = 0; % Cutoff
    else
        % Determine region
        if Vds < Vov
            % Linear region
            Id0 = beta * (Vov*Vds - 0.5*Vds^2);
        else
            % Saturation region
            Id0 = 0.5 * beta * Vov^2;
        end

        % Channel-length modulation (optional)
        Id(i) = Id0 * (1 + lambda*Vds);
    end
end

% --- Plot ---
figure;
plot(Vgs, Id, 'LineWidth', 2);
grid on;
xlabel('V_{GS} (V)');
ylabel('I_D (A)');
title(sprintf('MOSFET Transfer Curve: I_D vs V_{GS} (V_{DS}=%.1f V)', Vds));
