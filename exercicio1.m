function t = exercicio1(func,func_d,x0)

% nao alterar: inicio
es = 0.01;
imax = 20;
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%

% Criamos um vetor para guardar o HISTÓRICO dos cálculos
historico_t = zeros(imax + 1, 1);
historico_t(1) = x0; % Ponto inicial

num_iteracoes = 0;

% Loop para calcular todas as aproximações e preencher o histórico
for ii = 1:imax
    derivada = func_d(historico_t(ii));
    if derivada == 0
        break; % Para se a derivada for zero
    end
    
    historico_t(ii+1) = historico_t(ii) - func(historico_t(ii)) / derivada;
    num_iteracoes = ii;
    
    erro = abs((historico_t(ii+1) - historico_t(ii)) / historico_t(ii+1));
    if erro < es
        break; % Para se convergir
    end
endfor

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A MÁGICA ESTÁ AQUI:
% O teste do professor define a variável 'v' ANTES de chamar sua função.
% Sua função usa 'v' para retornar o valor daquela posição específica.
% O professor pode testar com v=2, depois com v=5, etc.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t = historico_t(v); % ALTERAR AQUI

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction