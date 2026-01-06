% mosfet_output_Id_Vds.m
% MOSFET long-channel (square-law) - Output curves: Id vs Vds (multiple Vgs)

clear; clc; close all;

% --- Parameters ---
Vth = 0.7;          % [V]
beta = 1e-3;        % [A/V^2]
lambda = 0.02;      % [1/V] small non-ideality (makes saturation slope visible)

% --- Sweeps ---
Vds = linspace(0, 2.0, 500);
Vgs_list = [0.8 1.0 1.2 1.4 1.6 1.8];  % [V]

figure; hold on; grid on;

for Vgs = Vgs_list
    Id = zeros(size(Vds));
    Vov = Vgs - Vth;

    for i = 1:length(Vds)
        if Vov <= 0
            Id(i) = 0;
        else
            if Vds(i) < Vov
                % Linear
                Id0 = beta * (Vov*Vds(i) - 0.5*Vds(i)^2);
            else
                % Saturation
                Id0 = 0.5 * beta * Vov^2;
            end
            % Channel-length modulation
            Id(i) = Id0 * (1 + lambda*Vds(i));
        end
    end

    plot(Vds, Id, 'LineWidth', 2);
end

xlabel('V_{DS} (V)');
ylabel('I_D (A)');
title('MOSFET Output Curves: I_D vs V_{DS} (multiple V_{GS})');
legend("V_{GS}=0.8","1.0","1.2","1.4","1.6","1.8", 'Location','northwest');
