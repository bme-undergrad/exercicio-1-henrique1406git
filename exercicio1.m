function t = exercicio1(func,func_d,x0)

% nao alterar: inicio
es = 0.01;
imax = 20;
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%

% ANOTAÇÃO: O tamanho do vetor 't' deve ser baseado em imax para evitar erros.
% Usamos imax+1 para ter espaço para o valor inicial (x0) e mais imax iterações.
t = zeros(imax + 1, 1);
erro = zeros(imax, 1);

% ANOTAÇÃO: Erro #2 corrigido.
% Usar o x0 fornecido como ponto de partida, em vez de um valor fixo.
t(1) = x0;;

% Inicializa uma variável para o número de iterações.
num_iteracoes = 0;

% ANOTAÇÃO: Erro #3 corrigido.
% O loop deve ir de 1 até o número máximo de iterações (imax).
for ii = 1:imax
    % Calcula o próximo valor de t usando a fórmula de Newton
    t(ii+1) = t(ii) - func(t(ii))/func_d(t(ii));
    num_iteracoes = ii; % Atualiza o contador de iterações

    % Calcula o erro relativo percentual
    % Evita divisão por zero se o novo valor for 0
    if t(ii+1) ~= 0
        erro(ii) = abs((t(ii+1) - t(ii)) / t(ii+1));
    else
        erro(ii) = abs(t(ii+1) - t(ii)); % Usa erro absoluto se t(ii+1) for 0
    end

    % Verifica o critério de parada (erro menor que o especificado)
    if erro(ii) < es
        break; % Se o erro for pequeno o suficiente, para o loop.
    end
endfor


% ANOTAÇÃO: Erro #1 corrigido.
% A função deve retornar o resultado calculado, e não um valor fixo.
t = resultado;

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction

%%%%%%%%%%%%%%%%%%%%%%%%%%
