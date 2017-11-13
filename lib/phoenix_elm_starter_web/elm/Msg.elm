module Msg exposing (..)

import Navigation
import Http exposing (Error)
import Models exposing (User, TestApi)


type Msg a
    = NoOp
    | NavigateTo String
    | UrlChange Navigation.Location
    | TestApiRequest (Result Error a)
