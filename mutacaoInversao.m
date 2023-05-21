function POPnovo = mutacaoInversao(POPnovo)
    [tamPOP, numVAR] = size(POPnovo);
    
    for i = 1:tamPOP
        if (rand <= 0.5) % Probabilidade de mutação
            % Seleciona dois pontos aleatórios para a inversão
            ponto1 = randi([1, numVAR]);
            ponto2 = randi([1, numVAR]);
            
            % Garante que ponto1 seja menor que ponto2
            if ponto1 > ponto2
                temp = ponto1;
                ponto1 = ponto2;
                ponto2 = temp;
            end
            
            % Inverte a subsequência entre ponto1 e ponto2
            POPnovo(i, ponto1:ponto2) = fliplr(POPnovo(i, ponto1:ponto2));
        end
    end
end
