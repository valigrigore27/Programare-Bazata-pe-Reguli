vocale(L) :- member(L, [a, e, i, o, u]).
consoane(L) :- member(L, [b, c, d, f, g, h, j, k, l, m, n, p, q, r, s, t, v, w, x, y, z]).

% ----------------------------------------------------------------------------------

% Regula 1
regula1([H, X, Y | T], [H, '-' | Result]) :-
    vocale(H), consoane(X), vocale(Y),
    regula1([X, Y | T], Result).
regula1([H, 'c', 'h', X | T], [H, '-', 'c', 'h' | Result]) :-
    vocale(H), vocale(X),
    regula1([X | T], Result).
regula1([H | T], [H | Result]) :-
    regula1(T, Result).
regula1([], []).

% ----------------------------------------------------------------------------------

% Regula 2
regula2([H, X, Y, Z | T], [H, '-' | Result]) :-
    vocale(H), member(X, [b, c, d, f, g, h, p, t, v]),
    member(Y, [l, r]), vocale(Z),
    regula2([X, Y, Z | T], Result).
regula2([H, X, Y, Z | T], [H, X, '-' | Result]) :-
    vocale(H), consoane(X), consoane(Y), vocale(Z),
    regula2([Y, Z | T], Result).
regula2([H | T], [H | Result]) :-
    regula2(T, Result).
regula2([], []).

% ----------------------------------------------------------------------------------

% Regula 3
regula3([H, X, Y, Z | T], [H, X, Y, '-' | Result]) :-
    vocale(H), member(X, [l, m, n, r, s]),
    member(Y, [p, t, c, d]), member(Z, [s, t, m, v, f]),
    regula3([Z | T], Result).
regula3([H, X, Y, Z | T], [H, X, '-' | Result]) :-
    vocale(H), consoane(X), consoane(Y), consoane(Z),
    regula3([Y, Z | T], Result).
regula3([H | T], [H | Result]) :-
    regula3(T, Result).
regula3([], []).

% ----------------------------------------------------------------------------------

% Regula 4
regula4([H, X, Y, Z | T], [H, '-', X, Y, Z | Result]) :-
    vocale(H), vocale(X), vocale(Y), vocale(Z),
    regula4(T, Result).
regula4([H, X, Y | T], [H, '-', X, Y | Result]) :-
    vocale(H), vocale(X), vocale(Y),
    regula4(T, Result).
regula4([H, X | T], [H, '-' | Result]) :-
    vocale(H), vocale(X),
    regula4([X | T], Result).
regula4([H | T], [H | Result]) :-
    regula4(T, Result).
regula4([], []).

% ----------------------------------------------------------------------------------

despartire(Cuvant, Rezultat) :-
    atom_chars(Cuvant, Litere),
    regula1(Litere, Rezultat1),
    regula2(Rezultat1, Rezultat2),
    regula3(Rezultat2, Rezultat3),
    regula4(Rezultat3, RezultatChars),
    atomic_list_concat(RezultatChars, Rezultat).
