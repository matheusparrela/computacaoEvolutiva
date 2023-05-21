function POPnovo = cruzamentoPontoUnico(POP, xmin, xmax)
    [tamPOP, numVAR] = size(POP);
    POPnovo = zeros(tamPOP, numVAR);
    
    for i = 1:2:tamPOP-1
        pai1 = POP(i, :);
        pai2 = POP(i+1, :);
        
        % Seleciona um ponto de corte aleatório
        pontoCorte = randi([1, numVAR-1]);
        
        % Realiza o cruzamento de ponto único
        filho1 = [pai1(1:pontoCorte), pai2(pontoCorte+1:end)];
        filho2 = [pai2(1:pontoCorte), pai1(pontoCorte+1:end)];
        
        % Armazena os filhos na nova população
        POPnovo(i, :) = filho1;
        POPnovo(i+1, :) = filho2;
    end
    
    % Verifica os limites dos genes e faz a correção se necessário
    POPnovo = max(POPnovo, xmin);
    POPnovo = min(POPnovo, xmax);
end
