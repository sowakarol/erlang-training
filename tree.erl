-module(tree).
-compile([export_all]).


empty() ->
    {node, 'null'}.



insert(Key, Value, {node,'null'}) -> 
    {node, {Key, Value, empty(), empty()}};

insert(Key, Value, 
    {node, {BaseTreeKey, BaseTreeValue,BaseTreeLeft,BaseTreeRight}}) ->
        if  Key =< BaseTreeKey -> 
                {node, {BaseTreeKey,BaseTreeValue,insert(Key, Value, BaseTreeLeft), BaseTreeRight}};
            Key > BaseTreeKey ->
                {node, {BaseTreeKey,BaseTreeValue,BaseTreeLeft, insert(Key, Value, BaseTreeRight)}}
        end.
