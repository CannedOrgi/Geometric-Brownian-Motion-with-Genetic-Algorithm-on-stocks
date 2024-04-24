function f = objectiveFunction(weights, sharpes)
    % Calculate the weighted sum of sharpes squared
    weightedSharpes = sum(weights .* (sharpes));
    penalty = 0.015 * std(weights);  % A penalty for lack of diversification
    % Number of sharpes
    n = numel(sharpes);
    % Calculate the root mean square
    %f = -sqrt(weightedSharpesSquared / n);
    f = -(weightedSharpes/n - penalty);
end
