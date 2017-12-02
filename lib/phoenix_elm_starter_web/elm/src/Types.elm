module Types exposing (..)

import Json.Decode as Decode
import Navigation
import Form exposing (Form)
import Form.Validate as Validate
import GraphQL.Client.Http exposing (Error)
import RemoteData exposing (RemoteData(Failure))
import Graphql.Types exposing (GraphqlType)
import Authentication.Types exposing (LoginFormState, RegisterFormState)
import Routing exposing (Route)


type alias State =
    { login : Form () LoginFormState
    , members : GraphqlData (List Member)
    , session : GraphqlData Session
    , register : Form () RegisterFormState
    , route : Maybe Route
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


type alias GraphqlData success =
    RemoteData Error success


type Actions message success
    = NoOp
    | NavigateTo String
    | UrlChange Navigation.Location
    | HomeAction message
    | AuthAction message
    | NotFoundAction message
    | Graphql GraphqlType (Result Error success)
    | Logout
