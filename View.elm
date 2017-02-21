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
viewContext { tree, at } =
    case at of
        TreeNode (Context info) content ->
            header []
                [ text info.name
                , ul [] (List.map itemize content) {- , button [ onClick NavigateTo ] [ text "Navigate" ] -}
                ]



--Activity info ->
--  header [] [ text info ]


itemize : Tree Context -> Html Msg
itemize tree =
    case tree of
        TreeNode (Context info) _ ->
            li [ onClick (NavigateTo info.id) ] [ text ("ctx: " ++ info.name) ]



--Activity info ->
--  li [] [text ("act: " ++ info)]
