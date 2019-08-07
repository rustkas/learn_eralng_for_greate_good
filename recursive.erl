-module(recursive).
-compile(export_all).
%-export([fac/1]).

fac(N) when N == 0 -> 1;
fac(N) when N > 0  -> N*fac(N-1).

len([]) -> 0;
% len([_]) -> 1.
len([_|T]) -> 1 + len(T).

tail_fac(N) -> tail_fac(N, 1).

tail_fac(0, Acc) when is_integer(Acc), Acc >= 1 -> Acc;
tail_fac(N, Acc) when is_integer(N), N > 0, is_integer(Acc), Acc >= 1 -> tail_fac(N-1, N*Acc).

tail_len(L) when is_list(L) -> tail_len(L, 0).

tail_len([], Acc) when is_integer(Acc) -> Acc;
tail_len([_|T], Acc) when is_integer(Acc) -> tail_len(T, Acc+1).

duplicate(0, _) ->
	[];
	
duplicate(N, Term) when N > 0 ->
    [Term | duplicate(N-1, Term)].	
	
tail_duplicate(N, Term) when is_integer(N) ->
    tail_duplicate(N, Term, []);
tail_duplicate(Term, N) when is_integer(N)  ->
    tail_duplicate(N, Term, []).


tail_duplicate(0, _, List) when is_list(List)->
    List;
	
tail_duplicate(N, Term, List) when is_integer(N), N > 0, is_list(List) ->
    tail_duplicate(N-1, Term, [Term|List]).	

reverse([]) -> [];
reverse([H|T]) -> reverse(T)++[H].

tail_reverse(L) -> tail_reverse(L,[]).

tail_reverse([], Acc) when is_integer(Acc)-> Acc;
tail_reverse([H|T], Acc) when is_integer(Acc) -> tail_reverse(T, [H|Acc]).

sublist(_, 0) -> [];
sublist([], _ ) -> [];
sublist([H|T], N) when is_integer(N), N > 0 -> [H|sublist(T, N-1)];
sublist(N, [H|T]) when is_integer(N), N > 0 -> [H|sublist(T, N-1)].

tail_sublist(N, L) when is_integer(N), is_list(L) -> tail_sublist(L, N, []);
tail_sublist(L, N) when is_integer(N), is_list(L) -> tail_sublist(L, N, []).

tail_sublist([], _, SubList) when is_list(SubList) -> SubList;
tail_sublist(_, [], SubList) when is_list(SubList) -> SubList;
tail_sublist(_, 0, SubList) when is_list(SubList) -> SubList;
tail_sublist(0, _, SubList) when is_list(SubList) -> SubList;
tail_sublist([H|T], N, SubList) when N > 0, is_list(SubList) ->
    tail_sublist(T, N-1, [H|SubList]);
tail_sublist(N, [H|T], SubList) when N > 0, is_list(SubList) ->
    tail_sublist(T, N-1, [H|SubList]).	
	
