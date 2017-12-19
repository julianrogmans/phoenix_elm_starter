module Authentication.Login exposing (..)

import List
import Tuple
import RemoteData exposing (isLoading)
import Element as Page exposing (Element)
import Element.Input as Input
import Element.Attributes as Add exposing (fill, px)
import Element.Events as Event
import Forms
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
import Authentication.Form exposing (loginFormFields, submitButton, errorFor, hasError)
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
            [ Add.width fill ]
            [ Page.h1 Style.LargeHeader [ Add.center, Add.padding 10 ] <| Page.text "Login"
            , loginForm login
            , submitButton "Login" (SubmitLoginForm data) (isLoading session)
            ]


loginForm : FormState -> Element Class variation Action
loginForm { form, errors } =
    let
        fieldError =
            flip errorFor errors

        fields =
            List.map Tuple.first loginFormFields
                |> List.map
                    (\fieldName ->
                        Input.text
                            (Style.Input { error = hasError <| fieldError fieldName })
                            [ Add.width fill
                            , Add.padding 5
                            , Event.onBlur <| UpdateLoginErrors fieldName
                            ]
                            { onChange = UpdateLoginForm fieldName
                            , value = Forms.formValue form fieldName
                            , label =
                                Input.placeholder
                                    { label = Input.labelAbove <| Page.empty
                                    , text = labelize fieldName
                                    }
                            , options = fieldError fieldName
                            }
                    )
    in
        Page.column Style.None [ Add.width fill, Add.spacing 15 ] fields
