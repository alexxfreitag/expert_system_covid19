% facts
paciente(alex).
idade(alex, 20).
temperatura(alex, 37).
freq_card(alex, 100).

% rules

%%temperatura
temperatura_sem_risco(X) :-
    temperatura(X, Y), Y >= 35, Y =< 37.

temperatura_sem_risco(X) :-
    temperatura(X, Y), Y >= 35, Y =< 37.

temperatura_sem_risco(X) :-
    temperatura(X, Y), Y >= 35, Y =< 37.

% verifica se paciente não tem risco
paciente_risco(X) :-
    paciente_sem_risco_verde(X),
    write(X),
    write(' não tem risco').



paciente_sem_risco_verde(X) :-
    temperatura_sem_risco(X).
    


% verifica se paciente tem baixo risco
%paciente_risco(X) :-
%    paciente_com_baixo_risco_amarelo(X),
%    write(X),
%    write(' tem baixo risco').

 
paciente_com_baixo_risco_amarelo(X) :-
    temperatura(X, 38).


%paciente_com_alto_risco_laranja(X) :-   
%paciente_com_altissimo_risco_vermelho(X) :-    
    
    
    