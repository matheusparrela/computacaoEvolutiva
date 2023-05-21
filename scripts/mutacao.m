% Mutação Uniforme
function POPnovo = mutacao(POPnovo,xmin,xmax)   
    [tamPOP, numVAR] = size(POPnovo);
    
    for i = 1:tamPOP
        if (rand <= 0.5) % Probabilidade de mutação
            POPnovo(i,:) = POPnovo(i,:) + 0.5 * (1 * rand(1,numVAR) - 0.5) .* (xmax - xmin);
        end
    end
    POPnovo = max(POPnovo,xmin);
    POPnovo = min(POPnovo,xmax);    
end



function POPnovo = mutacaoGaussiana(POPnovo, xmin, xmax)
    [tamPOP, numVAR] = size(POPnovo);
    
    [minVal, maxVal] = minmax(POPnovo); % Obtenção dos valores mínimos e máximos em cada dimensão
    sigmaFraction = 0.1; % Fração da faixa total para definir sigma
    sigma = sigmaFraction * (maxVal - minVal); % Cálculo de sigma - Desvio Padrão
    
    for i = 1:tamPOP
        for j = 1:numVAR
            if (rand <= 0.5) % Probabilidade de mutação
                delta = sigma * randn; % Geração de um valor aleatório com distribuição normal (gaussiana)
                POPnovo(i, j) = POPnovo(i, j) + delta;
            end
        end
    end
    
    POPnovo = max(POPnovo, xmin);
    POPnovo = min(POPnovo, xmax);
end
