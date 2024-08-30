% Define the transfer function of the plant
 numerator_plant = [2.18269]; % coefficients of the numerator of the
 plant transfer function
 denominator_plant = [0.05 0.1 0.0504]; % coefficients of the
 denominator of the plant transfer function
 plant_tf = tf(numerator_plant, denominator_plant);
 % Define PID controller parameters
 Kp = 11.5101; % Proportional gain
 Ki = 2.9837; % Integral gain
 Kd = 2.18269; % Derivative gain
 controller_tf = pid(Kp, Ki, Kd);
 % Combine plant and PID controller to get open-loop transfer function
 open_loop_tf = series(controller_tf, plant_tf);
 % Compute the closed-loop transfer function
 closed_loop_tf = feedback(open_loop_tf, 1);
 % Plot the root locus
 figure;
 rlocus(open_loop_tf);
 title('Root Locus Plot');
 % Check if the system is stable
 poles = pole(closed_loop_tf);
 if all(real(poles) < 0)
 disp('System is stable.');
 else
disp('System may be unstable.');
 end
