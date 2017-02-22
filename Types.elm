module Types exposing (..)

import Tree exposing (..)
import TreeBrowser exposing (..)


--type Context = Context String (List Context)
--              | Activity String


type alias Model =
    { at : Int
    , referrer : Int
    , tree : Tree Context Activity
    }


type Msg
    = None
    | NavigateTo Int
    | NavigateToFather Int



{- TODO: ther is no need for this -}
