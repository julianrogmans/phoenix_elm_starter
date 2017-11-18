module Types exposing (..)

import Navigation
import RemoteData exposing (WebData)
import Http exposing (Error)
import Login.View as Login
import Routing exposing (Route)


type alias Model =
    { route : Maybe Route
    , currentUser : WebData User
    , loading : Bool
    , error : Maybe String
    , login : Login.Model
    }


type alias User =
    { id : Int
    , name : String
    , email : String
    }


type Msg a
    = NoOp
    | NavigateTo String
    | UrlChange Navigation.Location
    | Login Login.Msg
    | GraphqlResponse (Result Error a)
