module View exposing (..)

import Html exposing (Html, Attribute, div, input, text, ul, li, header, button)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import List
import TreeBrowser exposing (..)
import Types exposing (..)


view : Model -> Html Msg
view model =
    viewContext model


viewContext : Model -> Html Msg
viewContext context =
    case context of
        TreeNode (Context info) content ->
            header []
                [ text info.name
                , ul [] (List.map itemize content)
                , button [ onClick NavigateTo ] [ text "Navigate" ]
                ]



--Activity info ->
--  header [] [ text info ]


itemize : Model -> Html Msg
itemize model =
    case model of
        TreeNode (Context info) _ ->
            li [] [ text ("ctx: " ++ info.name) ]



--Activity info ->
--  li [] [text ("act: " ++ info)]
