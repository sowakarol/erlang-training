-module(quick_sort).
-export([quick_sort/1]).

quick_sort([]) -> [];
%quick_sort([H]) -> [H];

quick_sort([Pivot|Rest]) -> 
    {Smaller, Larger} = partition(Pivot,Rest,[],[]),
    quick_sort(Smaller) ++ [Pivot] ++ quick_sort(Larger).


partition(_,[],Smaller,Larger) -> {Smaller, Larger};
partition(Pivot,[H|T],Smaller,Larger) when H =< Pivot ->
    partition(Pivot, T, [H|Smaller], Larger);
partition(Pivot,[H|T],Smaller,Larger) when H > Pivot ->
    partition(Pivot, T, Smaller, [H|Larger]).

% partition(Pivot,[H|T],Smaller,Larger)->
%     if  H =< Pivot -> partition(Pivot, T, [H|Smaller], Larger);
%         H > Pivot -> partition(Pivot, T, Smaller, [H|Larger])
%     end.

