module Msg exposing (..)

import Http exposing (Error)
import Models exposing (User, TestApi)


type Msg a
    = NoOp
    | GraphqlMsg (Result Error TestApi)
