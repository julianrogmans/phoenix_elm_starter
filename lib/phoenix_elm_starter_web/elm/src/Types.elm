module Types exposing (..)

import Navigation
import Form exposing (Form)
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
    , hasClass : Bool
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


type Action subAction success
    = NoOp
    | NavigateTo String
    | UrlChange Navigation.Location
    | HomeAction subAction
    | AuthAction subAction
    | NotFoundAction subAction
    | Graphql GraphqlType (Result Error success)
    | Logout
