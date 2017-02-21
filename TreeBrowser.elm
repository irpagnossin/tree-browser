module TreeBrowser exposing (..)

import List


type Tree a
    = TreeNode a (List (Tree a))


type alias ContextInfo =
    { id : Int
    , name : String
    }


type Context
    = Context ContextInfo


myseek : Int -> Tree Context -> Maybe (Tree Context)
myseek seekId node =
    case node of
        TreeNode (Context info) subcontexts ->
            if (info.id == seekId) then
                Just node
            else
                List.foldl concatContext Nothing (List.map (myseek seekId) subcontexts)


concatContext : Maybe (Tree Context) -> Maybe (Tree Context) -> Maybe (Tree Context)
concatContext ctx1 ctx2 =
    if ctx1 == Nothing then
        ctx2
    else
        ctx1


unwrap : Maybe (Tree Context) -> Tree Context
unwrap tree =
    case tree of
        Nothing ->
            TreeNode (Context { id = -1, name = "XX" }) []

        Just node ->
            node
