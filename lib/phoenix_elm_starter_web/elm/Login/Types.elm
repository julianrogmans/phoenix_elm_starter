module Login.Types exposing (..)


type alias Model =
    { email : String
    , password : String
    }


type Message
    = EmailInputChange String
    | PasswordInputChange String
    | SignIn
