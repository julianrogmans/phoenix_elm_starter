module Authentication.Types exposing (..)


type alias LoginState =
    { email : String
    , password : String
    }


type alias RegisterState =
    { firstName : String
    , lastName : String
    , email : String
    , password : String
    , passwordConfirmation : String
    }


type Actions
    = LoginEmail String
    | LoginPassword String
    | RegisterFirstName String
    | RegisterLastName String
    | RegisterEmail String
    | RegisterPassword String
    | RegisterPasswordConfirmation String
    | SignIn
    | Register
