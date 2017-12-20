module Authentication.Login exposing (..)

import Dict exposing (get)
import List
import Tuple
import RemoteData exposing (isLoading)
import Element as Page exposing (Element)
import Element.Input as Input
import Element.Attributes as Add exposing (fill, px)
import Element.Events as Event
import Forms
import Form
import Types
    exposing
        ( State
        , LoginForm
        , FormState
        , Action
            ( UpdateLoginErrors
            , SubmitLoginForm
            , UpdateLoginForm
            )
        )
import Utils exposing (labelize)
import Authentication.Form
    exposing
        ( loginFormFields
        , submitButton
        , renderErrors
        )
import View.Style as Style exposing (Class)


layout : State -> Element Class variation Action
layout { login, session } =
    let
        data : LoginForm
        data =
            { email = Forms.formValue login.form "email"
            , password = Forms.formValue login.form "password"
            }
    in
        Page.column Style.None
            [ Add.width fill, Add.spacing 15 ]
            [ Page.h1 Style.LargeHeader [ Add.center, Add.padding 10 ] <| Page.text "Login"
            , loginForm login
            , submitButton "Login" (SubmitLoginForm data) (isLoading session)
            ]


loginForm : FormState -> Element Class variation Action
loginForm { form, errors } =
    let
        fields =
            List.map Tuple.first loginFormFields
                |> List.map
                    (\field ->
                        Input.text
                            (Style.Input { error = Form.hasError <| get field errors })
                            [ Add.width fill
                            , Add.padding 5
                            , Event.onBlur <| UpdateLoginErrors field
                            ]
                            { onChange = UpdateLoginForm field
                            , value = Forms.formValue form field
                            , label =
                                Input.placeholder
                                    { label = Input.labelAbove <| Page.empty
                                    , text = labelize field
                                    }
                            , options = renderErrors <| get field errors
                            }
                    )
    in
        Page.column Style.None [ Add.width fill, Add.spacing 15 ] fields
