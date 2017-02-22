module View exposing (..)

import Html exposing (Html, Attribute, div, h1, input, text, ul, li, header, button)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import List
import Tree exposing (..)
import TreeBrowser exposing (..)
import Types exposing (..)


view : Model -> Html Msg
view model =
    viewContext model


viewContext : Model -> Html Msg
viewContext model =
    case unwrap (myseek model.at model.tree) of
        TreeNode (Context info) content ->
            header []
                [ h1 [] [ text info.name ]
                , ul [] (List.map itemize content)
                , button [ onClick (NavigateTo model.referrer) ] [ text "Return" ]
                , button [ onClick (NavigateToFather info.id) ] [ text "Up" ]
                ]

        LeafNode (Activity info) ->
            h1 [] [ text info.name ]


itemize : Tree Context Activity -> Html Msg
itemize tree =
    case tree of
        TreeNode (Context info) _ ->
            li [ onClick (NavigateTo info.id) ] [ text ("ctx: " ++ info.name) ]

        LeafNode (Activity info) ->
            li [ onClick (NavigateTo info.id) ] [ text ("act: " ++ info.name) ]
