module Types exposing (..)

import Navigation
import RemoteData exposing (WebData)
import Http exposing (Error)
import Login.Types as Login
import Routing exposing (Route)


type alias Model =
    { route : Maybe Route
    , session : WebData Session
    , authenticated : Bool
    , error : Maybe String
    , login : Login.Model
    }


type alias Member =
    { id : Int
    , firstName : String
    , lastName : String
    , email : String
    , lastSignIn : Maybe String
    }


type alias Session =
    { currentResource : Member
    , token : String
    }


type Message subMsg
    = NoOp
    | NavigateTo String
    | UrlChange Navigation.Location
    | LoginMsg subMsg
    | SignInMemberResponse (WebData Session)
