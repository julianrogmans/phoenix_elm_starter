module Msg exposing (..)

import Navigation
import Http exposing (Error)
import Models exposing (UserModel, TestApiModel)


type Msg
    = NoOp
    | NavigateTo String
    | UrlChange Navigation.Location
    | GraphqlRequest GraphqlResult


type GraphqlResult
    = TestApi (Result Error TestApiModel)
    | User (Result Error UserModel)
