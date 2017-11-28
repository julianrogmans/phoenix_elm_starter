module Login.Types exposing (..)


type alias State =
    { email : String
    , password : String
    }


type Actions
    = EmailInputChange String
    | PasswordInputChange String
    | SignIn
