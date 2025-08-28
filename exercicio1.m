function t = exercicio1(func,x0)

% nao alterar: inicio
es = 1;
imax = 20;
% nao alterar: fim

%%%%%%%%%%%%%%%%%%%%%%%%%%

t = x0;   % começa no chute inicial

  for i = 1:imax
    fval  = func(t);
    dval  = func_d(t);

    if abs(dval) < 1e-12
      warning('Derivada muito pequena, método parou.');
      return;
    end

    t_new = t - fval/dval;

    % critério de parada (erro relativo percentual)
    if abs((t_new - t)/max(1,abs(t_new))) < es
      t = t_new;
      return;
    end

    t = t_new
  endfor

%%%%%%%%%%%%%%%%%%%%%%%%%%

endfunction