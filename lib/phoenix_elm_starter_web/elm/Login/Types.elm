module Login.Types exposing (..)


type alias Model =
    { email : String
    , password : String
    , submitting : Bool
    }


type Message
    = EmailInputChange String
    | PasswordInputChange String
    | SignInMember
