% Define PID controller parameters
 Kp = 11.51;
 Ki = 2.18;
 Kd = 2.98;
 % Create PID controller
 C = pid(Kp, Ki, Kd);
 % Define transfer function of motor plant (replace with actual
 transfer function)
 J = 0.1;
 b = 0.1;
 K = 0.02;
 R = 0.5;
 L = 0.5;
 s = tf('s');
 P_motor = K/((J*s+b)*(L*s+R)+K^2);
 % Calculate gain and phase margins
 [Gm, Pm, Wcg, Wcp] = margin(C * P_motor);
 % Display gain and phase margins
 fprintf('Gain Margin: %.2f dB\n', 20*log10(Gm));
 fprintf('Phase Margin: %.2f degrees\n', Pm);
