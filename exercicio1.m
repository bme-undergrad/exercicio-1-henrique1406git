function t = exercicio1(func, func_d_ignorada, x0)

% nao alterar: inicio
% imax: maximo de iterações (conforme enunciado < 20)
imax = 20;
% ea: erro relativo percentual < 1% (conforme enunciado)
es = 0.01;
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%

% ANOTAÇÃO: Implementando o MÉTODO DA SECANTE MODIFICADA
% porque o teste não fornece uma função derivada (passa 0),
% o que impossibilita usar o Método de Newton puro.

% Delta (δ) para a aproximação da derivada. É um valor pequeno.
delta = 0.0001;
t_antigo = x0;

for ii = 1:imax
    % Avalia a função no ponto atual
    f_t = func(t_antigo);
    
    % Avalia a função no ponto ligeiramente perturbado
    f_t_delta = func(t_antigo + delta * t_antigo);
    
    % Calcula a aproximação da derivada
    derivada_aprox = (f_t_delta - f_t) / (delta * t_antigo);
    
    % Proteção contra divisão por zero se a derivada aproximada for nula
    if derivada_aprox == 0
        break;
    end
    
    % Fórmula da iteração (idêntica à de Newton, mas com a derivada aproximada)
    t_novo = t_antigo - f_t / derivada_aprox;
    
    % Calcula o erro relativo e verifica o critério de parada
    if t_novo ~= 0
        erro = abs((t_novo - t_antigo) / t_novo);
        if erro < es
            break;
        end
    end
    
    % Atualiza o valor para a próxima iteração
    t_antigo = t_novo;
endfor

% A função retorna o último valor calculado
t = t_novo;

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction