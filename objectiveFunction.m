function f = objectiveFunction(weights, sharpes)
    % Calculate the weighted sum of sharpes
    weightedSharpes = sum(weights .* (sharpes));
    penalty = 0.015 * std(weights);  % A penalty for lack of diversification of the portfolio
    % Number of sharpes
    n = numel(sharpes);
  
    f = -(weightedSharpes/n - penalty);
end
