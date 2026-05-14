%% =========================================================
%  PLL Loop Filter Parameters Calculation
%  Author : Mohamed Amr Mohamed
%  Based on: Dr. Hesham Omran MSc Thesis (2010)
%  Description:
%  This script calculates the passive loop filter
%  parameters for a Charge-Pump PLL using classical
%  second-order PLL design equations. 
% ==========================================================

clc;
clear;
close all;

%% ===================== Specifications ====================

PM_deg   = 70;              % Phase Margin [deg]
Ichp     = 10e-6;           % Charge Pump Current [A]
M        = 8;               % Divider Ratio
Fref     = 120e6;           % Reference Frequency [Hz]
Kvco     = 2.24e9;          % VCO Gain [Hz/V]

%% ================= Angular Frequencies ===================

wref     = 2*pi*Fref;       % Reference Angular Frequency [rad/s]
PM       = deg2rad(PM_deg); % Convert Phase Margin to radians

%% ================= PLL Design Equations ==================

% Damping factor
damping  = 0.5 / sqrt(sec(PM) - tan(PM));

% Loop Bandwidth
wu       = wref / 30;
% Loop Filter Time Constants
tp       = (sec(PM) - tan(PM)) / wu;
tz       = 1 / (wu^2 * tp);
% Pole to Zero Ratio
alphasq    = tz/tp;
alpha      = sqrt(alphasq);

%% ================= Loop Filter Components =================

Cp       = (Ichp * Kvco) / (alpha * M * wu^2);
Cz       = (alpha * Ichp * Kvco) / (M * wu^2);
Rz       = (M * wu) / (Kvco * Ichp);

%% ====================== Results ===========================

fprintf('===========================================\n');
fprintf('        PLL Loop Filter Parameters         \n');
fprintf('===========================================\n\n');

fprintf('Phase Margin        = %.2f deg\n', PM_deg);
fprintf('Reference Frequency = %.2f MHz\n', Fref/1e6);
fprintf('Kvco                = %.2f GHz/V\n', Kvco/1e9);
fprintf('Charge Pump Current = %.2f uA\n', Ichp*1e6);
fprintf('Divider Ratio       = %d\n\n', M);

fprintf('--------------- Loop Filter Parameters ---------\n');

fprintf('Cp  = %.3f pF\n', Cp*1e12);
fprintf('Cz  = %.3f pF\n', Cz*1e12);
fprintf('Rz  = %.3f kOhm\n', Rz*1e-3);

fprintf('===========================================\n');
