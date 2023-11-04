function [linkFn,linkFnGrad] = AMM_link_functions_updated()

linkFn = @(annot, theta) exp(theta(1)) + exp(theta(2)) .* (annot(:,2:end) * exp(theta(3:end))) ;

linkFnGrad = @(annot, theta) [ones(size(annot,1),1).*exp(theta(1)), ...
    exp(theta(2)) .* (annot(:,2:end) * exp(theta(3:end))),...
    exp(theta(2)) .* (exp(theta(3:end))' .* annot(:,2:end)) ];