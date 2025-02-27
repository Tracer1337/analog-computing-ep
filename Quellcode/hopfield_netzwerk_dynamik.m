function dsdt = dynamics(s, u, d, W, b, beta)
rho       = @(x) 1./(1 + exp(-x));
rho_prime = @(x) rho(x) .* (1 - rho(x));
W_eff = W - diag(diag(W));
energy_term = rho_prime(s) .* (W_eff * rho(u) + b);
cost_term = beta * (d - rho(u));
dsdt = energy_term - s + cost_term;
end
