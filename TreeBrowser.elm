module TreeBrowser exposing (..)

import List
import Tree exposing (..)


type alias ContextInfo =
    { id : Int
    , name : String
    }


type alias ActivityInfo =
    { id : Int
    , name : String
    }


type Context
    = Context ContextInfo


type Activity
    = Activity ActivityInfo


myseek : Int -> Tree Context Activity -> Maybe (Tree Context Activity)
myseek seekId node =
    case node of
        TreeNode (Context info) subcontexts ->
            if (info.id == seekId) then
                Just node
            else
                List.foldl concatContext Nothing (List.map (myseek seekId) subcontexts)

        LeafNode (Activity info) ->
            if info.id == seekId then
                Just node
            else
                Nothing


seekFather : Int -> Tree Context Activity -> Maybe (Tree Context Activity)
seekFather sonId tree =
    case tree of
        TreeNode _ [] ->
            Nothing

        TreeNode _ subcontexts ->
            if List.any (\s -> (getContextId s) == sonId) subcontexts then
                Just tree
            else
                List.foldl concatContext Nothing (List.map (seekFather sonId) subcontexts)

        LeafNode _ ->
            Nothing


getContextId : Tree Context Activity -> Int
getContextId node =
    case node of
        TreeNode (Context info) _ ->
            info.id

        LeafNode (Activity info) ->
            {- TODO: can I use 'TreeNode (_ info) -'? -}
            info.id


concatContext : Maybe (Tree Context Activity) -> Maybe (Tree Context Activity) -> Maybe (Tree Context Activity)
concatContext ctx1 ctx2 =
    if ctx1 == Nothing then
        ctx2
    else
        ctx1



{- TODO: remove this -}


unwrap : Maybe (Tree Context Activity) -> Tree Context Activity
unwrap tree =
    case tree of
        Nothing ->
            TreeNode (Context { id = -1, name = "XX" }) []

        Just node ->
            node
