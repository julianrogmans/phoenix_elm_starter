module Authentication.Types exposing (..)

import Form exposing (Form)


type alias LoginFormState =
    { email : String
    , password : String
    }


type alias RegisterFormState =
    { firstName : String
    , lastName : String
    , email : String
    , password : String
    , passwordConfirmation : String
    }


type Action
    = RegisterForm Form.Msg
    | LoginForm Form.Msg
