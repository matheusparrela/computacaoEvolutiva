function POPnovo = mutacaoGaussiana(POPnovo, xmin, xmax)
    [tamPOP, numVAR] = size(POPnovo);
    
    minVal = min(POPnovo, [], 1); % Valores mínimos em cada dimensão
    maxVal = max(POPnovo, [], 1); % Valores máximos em cada dimensão
    
    sigmaFraction = 0.1; % Fração da faixa total para definir sigma
    sigma = sigmaFraction * (maxVal - minVal); % Cálculo de sigma - Desvio Padrão
    
    for i = 1:tamPOP
        for j = 1:numVAR
            if (rand <= 0.5) % Probabilidade de mutação
                delta = sigma(j) * randn; % Geração de um valor aleatório com distribuição normal (gaussiana)
                POPnovo(i, j) = POPnovo(i, j) + delta;
            end
        end
    end
    
    POPnovo = max(POPnovo, xmin);
    POPnovo = min(POPnovo, xmax);
end

