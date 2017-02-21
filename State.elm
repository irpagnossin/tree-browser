module State exposing (..)

import TreeBrowser exposing (..)
import Types exposing (..)


root : Model
root =
    TreeNode (Context { id = 0, name = "Eletromagnetismo" })
        [ TreeNode (Context { id = 1, name = "Aula 1" }) []
        , TreeNode (Context { id = 2, name = "Aula 2" })
            [ TreeNode (Context { id = 3, name = "Sub-aula" }) []
            ]
        , TreeNode (Context { id = 4, name = "Aula 3" }) []
        ]


tree : Model
tree =
    TreeNode (Context { id = 0, name = "Eletromagnetismo" })
        [ TreeNode (Context { id = 1, name = "Aula 1" }) []
        , TreeNode (Context { id = 2, name = "Aula 2" })
            [ TreeNode (Context { id = 3, name = "Sub-aula" }) []
            ]
        , TreeNode (Context { id = 4, name = "Aula 3" }) []
        ]



--Context "Eletromagnetismo"
--    [Context "Aula 1" [Activity "Apresentação"], Context "Aula 2" []]


init : ( Model, Cmd Msg )
init =
    ( tree, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        None ->
            ( model, Cmd.none )

        NavigateTo ->
            ( unwrap (myseek 2 root), Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
