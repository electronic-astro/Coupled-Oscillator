%function
function dXdt = coupled_osc(t, X, m1, m2, k1, k2, k12, c1, c2)  
    % State vector:
    % X = [x1; v1; x2; v2]

    x1 = X(1);
    v1 = X(2);
    x2 = X(3);
    v2 = X(4);

    % Coupling force
    f12 = k12 * (x1 - x2);  % force on mass 1 due to mass 2

    % Equations of motion
    dx1dt = v1;
    dv1dt = (-k1*x1 - c1*v1 - f12) / m1;

    dx2dt = v2;
    dv2dt = (-k2*x2 - c2*v2 + f12) / m2; % note the opposite sign of f12

    % Return derivatives
    dXdt = [dx1dt; dv1dt; dx2dt; dv2dt];
end
