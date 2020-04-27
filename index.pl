% facts
paciente(alex).
idade(alex, 20).
temperatura(alex, 36).
freq_card(alex, 99).
freq_resp(alex, 17).
pa_sis(alex, 100).
sa02(alex, 96).
dispneia(alex, 'N').
comorbidades(alex, 2).

% rules

%%temperatura
temperatura_sem_risco(X) :-
    temperatura(X, Y), Y >= 35, Y =< 37.

temperatura_baixo_risco(X) :-
    temperatura(X, Y), Y < 35; temperatura(X, Y), Y > 37, Y =< 39.

temperatura_alto_risco(X) :-
    temperatura(X, Y), Y > 39.

%%frequencia cardiaca
freq_card_sem_risco(X) :-
    freq_card(X, Y), Y < 100.

freq_card_baixo_risco(X) :-
    freq_card(X, Y), Y >= 100.

%%frequencia respiratoria
freq_resp_sem_risco(X) :- 
   freq_resp(X, Y), Y =< 18.

freq_resp_baixo_risco(X) :- 
   freq_resp(X, Y), Y >= 19, Y =< 30.

freq_resp_altissimo_risco(X) :- 
   freq_resp(X, Y), Y > 30.

%%pa sistolica
pa_sis_sem_risco(X) :-
	pa_sis(X,Y), Y > 100. 

pa_sis_alto_risco(X) :-
	pa_sis(X,Y), Y >= 90, Y =< 100.

pa_sis_altissimo_risco(X) :-
	pa_sis(X,Y), Y < 90.

%%sa02
sa02_sem_risco(X) :-
    sa02(X, Y), Y >= 95.

sa02_altissimo_risco(X) :-
    sa02(X, Y), Y < 95.

%%dispneia
dispneia_sem_risco(X) :-
    dispneia(X, Y), Y == 'N'.

dispneia_altissimo_risco(X) :-
    dispneia(X, Y), Y == 'S'.

%%idade
idade_sem_risco(X) :-
    idade(X, Y), Y < 60.

idade_baixo_risco(X) :-
    idade(X, Y), Y >= 60, Y =< 79.

idade_alto_risco(X) :-
    idade(X, Y), Y > 79.

%%comorbidades
comorbidades_sem_risco(X) :-
    comorbidades(X, Y), Y = 0.

comorbidades_baixo_risco(X) :-
    comorbidades(X, Y), Y = 1.

comorbidades_alto_risco(X) :-
    comorbidades(X, Y), Y >= 2.

% verifica risco do paciente
paciente_risco(X) :-
    paciente_sem_risco_verde(X);
    paciente_com_baixo_risco_amarelo(X);
    paciente_com_alto_risco_laranja(X);
    paciente_com_altissimo_risco_vermelho(X).
    
paciente_sem_risco_verde(X) :-
    temperatura_sem_risco(X),
    freq_card_sem_risco(X),
    freq_resp_sem_risco(X),
    pa_sis_sem_risco(X),
    sa02_sem_risco(X),
    dispneia_sem_risco(X),
    idade_sem_risco(X),
    comorbidades_sem_risco(X),
    write(X),
    write(' não tem risco').

paciente_com_baixo_risco_amarelo(X) :-
    (
    	temperatura_baixo_risco(X);
    	freq_card_baixo_risco(X);
    	freq_resp_baixo_risco(X);
    	idade_baixo_risco(X);
    	comorbidades_baixo_risco(X)
    ),
    write(X),
    write(' deve ficar em casa, em observação por 14 dias. (baixo)').

paciente_com_alto_risco_laranja(X) :-
    (   
    	temperatura_alto_risco(X);
    	pa_sis_alto_risco(X);
    	idade_alto_risco(X);
    	comorbidades_alto_risco(X)
    ),
    write(X),
    write(' deve ficar em casa, em observação por 14 dias. (alto)').

paciente_com_altissimo_risco_vermelho(X) :-
    (   
    	freq_resp_altissimo_risco(X);
        pa_sis_altissimo_risco(X);
    	sa02_altissimo_risco(X);
    	dispneia_altissimo_risco(X)
    ),
    write(X),
    write(' deve ser encaminhado para o hospital').
    