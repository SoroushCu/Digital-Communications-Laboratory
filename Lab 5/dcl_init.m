%% Simulation Parameters
flg_hrdwr_usg = 0;
stop_time = 100;
%% Receiver Parameters
fs = 10e6; % Baseband Sampling Rate (65105 to 61.44e6 Hz)
ts = 1/fs; % Baseband Sampling Time
pkt_size = 1e5; % Number of Symbol in Each Packet
rx_alg = 0; % Receiver Detection Algorithm
cmpnst_mode = 0; % Compensate Mode (0: No Compensation, 1: Amplitude Compensation, 2: Phase Compensation, 3: Compensation)
%% Modulation Parameters
modulation = 'psk'; % Modulation Name ('psk', 'pam', 'qam', 'fsk')
k = 2; % Bit Per Symbol
M = 2^k; % Modulation Order
smpl_per_symbl = 8; % Sample Per Symbol
Ts = smpl_per_symbl*ts; % Symbol Time
flg_gray_encode = 1; % Gray Code Usage Flag
mod_det_opt = 'coherent'; % Modulation Detection Option ('coherent', 'noncoherent')
% Pulse Shape Parameters
pulse_name = 'triangular'; % Name of Pulse Shaping Function
beta = 0.99; % Parameter for RC, RRC and Gaussian Pulse Shape
span_in_symbl = 0; % Trunctation Length for RC, RRC and Gaussian Pulse Shape (Multiple of Symbol Time)
% Header Option
flg_add_hdr = 0; % Flag For Having Packets with Header
% SNR Bound for BER Plots
snr_min = 0; % Minimum SNR (dB)
snr_max = 10; % Maximum SNR (dB)
snr_step = 1; % SNR Step (dB)
snr_db = snr_min:snr_step:snr_max; % SNR Vector (dB)
%% Channel Parameters
chnl_delay_in_smpl = 0; % Channel Delay in Sample
chnl_phase_offset = 0 * pi/180; % Channel Phase Offset
chnl_freq_offset = 0; % Channel Frequency Offset
%% Hardware Parameters
% Transmitter Parameters
tx_fc = 2400e6; % Set Transmiter Center Frequency (AD9363: 325-3800MHz) (AD9364: 70-6000MHz)
tx_gain = 0; % Set Transmiter Attenutaion As a Negative Gain (-89.75 to 0 dB)
tx_address = 'usb:0'; % Set Transmiter Identification Number
% Receiver Parameters
rx_fc = 2400e6; % Set Receiver Center Frequency (AD9363: 325-3800MHz) (AD9364: 70-6000MHz)
rx_gain = 20; % Set Receiver Gain (-4dB to 71dB)
rx_address = 'usb:0'; % Set Receiver Identification Number
% Initialize ADALM-PLUTO
% % % % if flg_hrdwr_usg
% % % % dev = sdrdev('Pluto'); % Create Radio Object for ADALM-PLUTO
% % % % setupSession(dev)
% % % % configurePlutoRadio('AD9364'); % Configure ADALM-PLUTO Radio Firmware
% % % % end