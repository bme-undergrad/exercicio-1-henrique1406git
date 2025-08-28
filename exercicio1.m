function t = exercicio1(func,func_d,x0)

% nao alterar: inicio
es = 0.01;
imax = 20;
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%

% ANOTAÇÃO: Pre-alocamos espaço para o caso máximo.
% +1 para incluir o valor inicial x0.
t = zeros(imax + 1, 1);

% Ponto de partida é o x0 fornecido.
t(1) = x0;

% Inicializamos o contador de iterações realizadas.
num_iteracoes = 0;

% O loop vai de 1 até o máximo de iterações.
for ii = 1:imax
    % ANOTAÇÃO: Adicionamos uma verificação de segurança.
    % Se a derivada for zero, o método para. Evita divisão por zero.
    derivada = func_d(t(ii));
    if derivada == 0
        disp('Derivada igual a zero. O método não pode continuar.');
        break;
    end

    % Fórmula de Newton-Raphson
    t(ii+1) = t(ii) - func(t(ii)) / derivada;
    num_iteracoes = ii; % Atualiza o número de iterações concluídas.

    % Critério de parada pelo erro relativo.
    if t(ii+1) ~= 0
        erro = abs((t(ii+1) - t(ii)) / t(ii+1));
        if erro < es
            break; % Para o loop se a convergência for atingida.
        end
    end
endfor

% ANOTAÇÃO: ESTA É A MUDANÇA MAIS IMPORTANTE!
% Em vez de retornar um único número, vamos retornar o vetor t
% com todas as aproximações calculadas, sem os zeros extras.
% O vetor vai de t(1) até a última posição calculada, t(num_iteracoes + 1).
t = t(1:(num_iteracoes + 1));

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction