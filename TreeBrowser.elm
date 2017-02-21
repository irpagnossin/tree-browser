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


seekFather : Int -> Tree Context -> Maybe (Tree Context)
seekFather sonId tree =
    case tree of
        TreeNode _ [] ->
            Nothing

        TreeNode _ subcontexts ->
            if List.any (\s -> (getContextId s) == sonId) subcontexts then
                Just tree
            else
                List.foldl concatContext Nothing (List.map (seekFather sonId) subcontexts)


getContextId : Tree Context -> Int
getContextId tree =
    case tree of
        TreeNode (Context info) _ ->
            info.id


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
