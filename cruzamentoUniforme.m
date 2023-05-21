function POPnovo = cruzamentoUniforme(POP, xmin, xmax)
    [tamPOP, numVAR] = size(POP);
    POPnovo = zeros(tamPOP, numVAR);
    
    for i = 1:2:tamPOP-1
        pai1 = POP(i, :);
        pai2 = POP(i+1, :);
        
        % Realiza o cruzamento uniforme
        mascara = randi([0, 1], 1, numVAR); % Gera uma máscara binária aleatória
        filho1 = pai1 .* mascara + pai2 .* (1 - mascara);
        filho2 = pai2 .* mascara + pai1 .* (1 - mascara);
        
        % Armazena os filhos na nova população
        POPnovo(i, :) = filho1;
        POPnovo(i+1, :) = filho2;
    end
    
    % Verifica os limites dos genes e faz a correção se necessário
    POPnovo = max(POPnovo, xmin);
    POPnovo = min(POPnovo, xmax);
end
