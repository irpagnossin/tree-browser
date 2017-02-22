module State exposing (..)

import Tree exposing (..)
import TreeBrowser exposing (..)
import Types exposing (..)


tree : Tree Context Activity
tree =
    TreeNode (Context { id = 0, name = "Eletromagnetismo" })
        [ TreeNode (Context { id = 1, name = "Aula 1" }) []
        , TreeNode (Context { id = 2, name = "Aula 2" })
            [ TreeNode (Context { id = 3, name = "Sub-aula" })
                [ LeafNode (Activity { id = 5, name = "Senta que lá vem a história" }) ]
            ]
        , TreeNode (Context { id = 4, name = "Aula 3" }) []
        ]



--Context "Eletromagnetismo"
--    [Context "Aula 1" [Activity "Apresentação"], Context "Aula 2" []]


init : ( Model, Cmd Msg )
init =
    let
        id =
            getContextId tree
    in
        { at = id
        , referrer = id
        , tree = tree
        }
            ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        None ->
            model ! []

        NavigateTo id ->
            { model | at = id, referrer = model.at } ! []

        NavigateToFather id ->
            case seekFather id model.tree of
                Just target ->
                    { model | at = getContextId target, referrer = id } ! []

                Nothing ->
                    model ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
