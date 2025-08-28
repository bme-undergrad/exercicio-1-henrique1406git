function t = exercicio1(func, func_d_ignorada, x0)

% nao alterar: inicio
% imax: maximo de iterações (conforme enunciado < 20)
imax = 20;
% ea: erro relativo percentual < 1% (conforme enunciado)
es = 0.01;
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%

% ANOTAÇÃO: MÉTODO DA SECANTE MODIFICADA (VERSÃO ROBUSTA)
% A correção crucial está no cálculo da derivada aproximada.

t_antigo = x0;
t_novo = 0;

% Usamos um passo de perturbação (h) pequeno e FIXO.
% Isso evita instabilidade numérica quando 't' está perto de zero.
h = 0.00001;

for ii = 1:imax
    f_t = func(t_antigo);
    
    % ANOTAÇÃO: Esta é a mudança chave.
    % Aproximamos a derivada usando o passo fixo 'h'.
    % A fórmula é a definição de derivada: f'(x) ≈ (f(x+h) - f(x)) / h
    derivada_aprox = (func(t_antigo + h) - f_t) / h;
    
    % Proteção contra divisão por zero
    if abs(derivada_aprox) < 1e-15 % Usar uma tolerância pequena em vez de '== 0'
        disp('Derivada próxima de zero, parando.');
        t_novo = t_antigo; % Retorna o último valor válido
        break;
    end
    
    % Fórmula de iteração de Newton, usando nossa derivada aproximada
    t_novo = t_antigo - f_t / derivada_aprox;
    
    % Critério de parada pelo erro relativo
    if t_novo ~= 0
        erro = abs((t_novo - t_antigo) / t_novo);
        if erro < es
            break;
        end
    end
    
    t_antigo = t_novo;
endfor

t = t_novo;

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction