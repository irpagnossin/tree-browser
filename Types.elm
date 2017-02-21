module Types exposing (..)

import TreeBrowser exposing (..)


--type Context = Context String (List Context)
--              | Activity String


type alias Model =
    { at : Int
    , referrer : Int
    , tree : Tree Context
    }


type Msg
    = None
    | NavigateTo Int
    | NavigateToFather Int
