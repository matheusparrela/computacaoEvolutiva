clear all; % Limpa todas as variáveis
close all; % Fecha todas figuras
clc; % Limpa a tela

xmin = -5.12; % Específico para a função rastrigin
xmax = 5.12;

%%%%%%%% tamPOP * numGER <= 10000
tamPOP = 100;
numGER = 10000 / tamPOP;
%%%%%%%%

numVAR = 1000000;

POP = xmin + rand(tamPOP,numVAR) .* (xmax - xmin);
FX = calculaFX(POP);

for g = 2:numGER
    POPnovo = cruzamentoUniforme(POP, xmin, xmax)
    POPnovo = mutacaoInversao(POPnovo)
    FXnovo = calculaFX(POPnovo);
    
    POP = [POP; POPnovo];
    FX = [FX; FXnovo];
    
    [POP, FX] = selecao(POP,FX,tamPOP);
    
    if (numVAR == 2)
        plot(POP(:,1),POP(:,2),'ro');
        axis([xmin xmax xmin xmax]);
        xlabel(num2str(g));
        grid on;
        drawnow;    
    else
        plot(POP);
        axis([1 numVAR xmin xmax]);
        xlabel(num2str(g));
        grid on;
        drawnow;
    end
end

min(FX)
