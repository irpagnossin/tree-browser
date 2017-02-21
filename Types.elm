module Types exposing (..)

import TreeBrowser exposing (..)


--type Context = Context String (List Context)
--              | Activity String


type alias Model =
    Tree Context


type Msg
    = None
    | NavigateTo Int
