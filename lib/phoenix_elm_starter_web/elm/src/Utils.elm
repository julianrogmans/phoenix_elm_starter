module Utils exposing (..)

import String.Extra exposing (underscored, replace, toSentenceCase)


labelize : String -> String
labelize name =
    name
        |> underscored
        |> replace "_" " "
        |> toSentenceCase
