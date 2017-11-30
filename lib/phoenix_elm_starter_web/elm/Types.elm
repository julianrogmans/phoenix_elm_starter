module Types exposing (..)

import Http exposing (Error)
import Json.Decode as Decode
import Navigation
import RemoteData exposing (WebData, RemoteData(Failure))
import GraphQElm exposing (Query)
import Authentication.Types exposing (LoginState, RegisterState)
import Routing exposing (Route)


type alias State =
    { route : Maybe Route
    , session : GraphqlData Session
    , authenticated : Bool
    , loading : Bool
    , error : Maybe Error
    , login : LoginState
    , register : RegisterState
    }


type alias GraphqlData model =
    { data : WebData model
    , decoder : Query -> Decode.Decoder model
    }


type alias Member =
    { id : String
    , firstName : String
    , lastName : String
    , email : String
    , lastSignIn : Maybe String
    }


type alias Session =
    { member : Member
    , token : String
    }


type Actions subMsg
    = NoOp
    | NavigateTo String
    | UrlChange Navigation.Location
    | Authentication subMsg
    | Authenticate (Result Error Session)
    | Logout
