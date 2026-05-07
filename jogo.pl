% =====================================================
%                   JOGO INTELIGENTE  
% =====================================================

:- dynamic(animal/2).
:- dynamic(comida/2).
:- dynamic(desporto/2).
:- dynamic(historia/2).

% =====================================================
% MENU PRINCIPAL
% =====================================================

menu :-
    nl,
    write('===================================='), nl,
    write('     SISTEMA INTELIGENTE PROLOG'), nl,
    write('===================================='), nl,
    write('1 - Animais'), nl,
    write('2 - Comidas'), nl,
    write('3 - Desporto'), nl,
    write('4 - Historia'), nl,
    write('5 - Ver Base de Conhecimento'), nl,
    write('6 - Sair'), nl,
    write('Escolha uma opcao: '),
    read(Opcao),
    executar(Opcao).

% =====================================================
% EXECUÇÃO DAS OPÇÕES
% =====================================================

executar(1) :-
    jogo_animais,
    menu.

executar(2) :-
    jogo_comidas,
    menu.

executar(3) :-
    jogo_desporto,
    menu.

executar(4) :-
    jogo_historia,
    menu.

executar(5) :-
    listar_base,
    menu.

executar(6) :-
    write('Encerrando sistema...'), nl.

executar(_) :-
    write('Opcao invalida!'), nl,
    menu.

% =====================================================
% BASE DE CONHECIMENTO - ANIMAIS
% =====================================================

animal(cachorro, [mamifero, late]).
animal(gato, [mamifero, mia]).
animal(aguia, [voa, carnivoro]).
animal(tubarao, [agua, carnivoro]).
animal(elefante, [grande, mamifero]).
animal(morcego, [voa, mamifero]).
animal(leao, [mamifero, carnivoro]).
animal(baleia, [agua, mamifero]).

% =====================================================
% BASE DE CONHECIMENTO - COMIDAS
% =====================================================

comida(pizza, [massa, queijo]).
comida(hamburguer, [carne, pao]).
comida(sorvete, [doce, gelado]).
comida(salada, [vegetais, saudavel]).
comida(lasanha, [massa, queijo, carne]).
comida(sushi, [peixe, arroz]).
comida(churrasco, [carne]).
comida(bolo, [doce]).

% =====================================================
% BASE DE CONHECIMENTO - DESPORTO
% =====================================================

desporto(futebol, [bola, coletivo]).

desporto(tenis, [raquete]).
desporto(natacao, [agua]).
desporto(boxe, [luta]).
desporto(formula1, [corrida, carros]).
desporto(volei, [rede, coletivo]).
desporto(ciclismo, [bicicleta]).

% =====================================================
% BASE DE CONHECIMENTO - HISTÓRIA
% =====================================================

historia(segunda_guerra, [guerra, seculo20]).
historia(independencia_brasil, [brasil, imperio]).
historia(revolucao_francesa, [franca, revolucao]).
historia(guerra_fria, [eua, urss]).
historia(descobrimento_brasil, [brasil, navegacao]).
historia(revolucao_industrial, [industria, inglaterra]).
historia(queda_muro_berlim, [alemanha, guerra_fria]).

% =====================================================
% JOGO DOS ANIMAIS
% =====================================================

jogo_animais :-
    nl,
    write('===== MODULO: ANIMAIS ====='), nl,

    write('Digite uma lista de caracteristicas.'), nl,
    write('Exemplo: [mamifero, late]'), nl,
    write('Caracteristicas: '),

    read(Caracts),

    identificar_animal(Caracts).

identificar_animal(Caracts) :-
    animal(Nome, Lista),
    subset(Caracts, Lista),

    nl,
    write('Voce pensou em: '),
    write(Nome),
    write('!'), nl, !.

identificar_animal(Caracts) :-
    nl,
    write('Nao consegui identificar o animal.'), nl,

    write('Qual era o animal? '),
    read(NovoAnimal),

    assert(animal(NovoAnimal, Caracts)),

    write('Aprendi um novo animal!'), nl.

% =====================================================
% JOGO DAS COMIDAS
% =====================================================

jogo_comidas :-
    nl,
    write('===== MODULO: COMIDAS ====='), nl,

    write('Digite uma lista de caracteristicas.'), nl,
    write('Exemplo: [massa, queijo]'), nl,
    write('Caracteristicas: '),

    read(Caracts),

    identificar_comida(Caracts).

identificar_comida(Caracts) :-
    comida(Nome, Lista),
    subset(Caracts, Lista),

    nl,
    write('Voce pensou em: '),
    write(Nome),
    write('!'), nl, !.

identificar_comida(Caracts) :-
    nl,
    write('Nao consegui identificar a comida.'), nl,

    write('Qual era a comida? '),
    read(NovaComida),

    assert(comida(NovaComida, Caracts)),

    write('Aprendi uma nova comida!'), nl.

% =====================================================
% JOGO DOS DESPORTOS
% =====================================================

jogo_desporto :-
    nl,
    write('===== MODULO: DESPORTO ====='), nl,

    write('Digite uma lista de caracteristicas.'), nl,
    write('Exemplo: [bola, coletivo]'), nl,
    write('Caracteristicas: '),

    read(Caracts),

    identificar_desporto(Caracts).

identificar_desporto(Caracts) :-
    desporto(Nome, Lista),
    subset(Caracts, Lista),

    nl,
    write('Voce pensou em: '),
    write(Nome),
    write('!'), nl, !.

identificar_desporto(Caracts) :-
    nl,
    write('Nao consegui identificar o desporto.'), nl,

    write('Qual era o desporto? '),
    read(NovoDesporto),

    assert(desporto(NovoDesporto, Caracts)),

    write('Aprendi um novo desporto!'), nl.

% =====================================================
% JOGO DA HISTÓRIA
% =====================================================

jogo_historia :-
    nl,
    write('===== MODULO: HISTORIA ====='), nl,

    write('Digite uma lista de caracteristicas.'), nl,
    write('Exemplo: [guerra, seculo20]'), nl,
    write('Caracteristicas: '),

    read(Caracts),

    identificar_historia(Caracts).

identificar_historia(Caracts) :-
    historia(Nome, Lista),
    subset(Caracts, Lista),

    nl,
    write('Voce pensou em: '),
    write(Nome),
    write('!'), nl, !.

identificar_historia(Caracts) :-
    nl,
    write('Nao consegui identificar o evento historico.'), nl,

    write('Qual era o evento historico? '),
    read(NovoEvento),

    assert(historia(NovoEvento, Caracts)),

    write('Aprendi um novo evento historico!'), nl.

% =====================================================
% LISTAR BASE COMPLETA
% =====================================================

listar_base :-
    nl,
    write('========= BASE DE CONHECIMENTO ========='), nl,

    nl,
    write('--- ANIMAIS ---'), nl,
    animal(A,C),
    write(A), write(' -> '), write(C), nl,
    fail.

listar_base :-
    nl,
    write('--- COMIDAS ---'), nl,
    comida(A,C),
    write(A), write(' -> '), write(C), nl,
    fail.

listar_base :-
    nl,
    write('--- DESPORTOS ---'), nl,
    desporto(A,C),
    write(A), write(' -> '), write(C), nl,
    fail.

listar_base :-
    nl,
    write('--- HISTORIA ---'), nl,
    historia(A,C),
    write(A), write(' -> '), write(C), nl,
    fail.

listar_base.