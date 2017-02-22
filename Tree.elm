module Tree exposing (..)


type Tree a b
    = TreeNode a (List (Tree a b))
    | LeafNode b



{- }
   seek : (a -> Bool) -> Tree a -> Maybe (Tree a)
   seek f node =
       case node of
           TreeNode info _ ->
               if f info then
                   Just node
               else
                   Nothing

           LeafNode info ->
               if f info then
                   Just node
               else
                   Nothing
-}
