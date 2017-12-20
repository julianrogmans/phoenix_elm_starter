module Authentication.Register exposing (..)

import Dict exposing (get)
import List
import RemoteData exposing (isLoading)
import Element as Page exposing (Element)
import Element.Input as Input
import Element.Attributes as Add exposing (fill, fillPortion, percent, px)
import Element.Events as Event
import Forms
import Form
import Types
    exposing
        ( State
        , FormState
        , RegisterForm
        , Action
            ( SubmitRegisterForm
            , UpdateRegisterForm
            , UpdateRegisterErrors
            )
        )
import Utils exposing (labelize)
import Authentication.Form
    exposing
        ( registerFormFields
        , submitButton
        , renderErrors
        )
import View.Style as Style exposing (Class)


layout : State -> Element Class variation Action
layout { register, session } =
    let
        data : RegisterForm
        data =
            { firstName = Forms.formValue register.form "firstName"
            , lastName = Forms.formValue register.form "lastName"
            , email = Forms.formValue register.form "email"
            , password = Forms.formValue register.form "password"
            , passwordConfirmation = Forms.formValue register.form "passwordConfirmation"
            }
    in
        Page.column Style.None
            [ Add.width fill, Add.spacing 15 ]
            [ Page.h1 Style.LargeHeader [ Add.center, Add.padding 10 ] <| Page.text "Sign Up"
            , registerForm register
            , submitButton "Register" (SubmitRegisterForm data) (isLoading session)
            ]


registerForm : FormState -> Element Class variation Action
registerForm { form, errors } =
    let
        fields =
            List.map Tuple.first registerFormFields
                |> List.map
                    (\field ->
                        Input.text
                            (Style.Input { error = Form.hasError <| get field errors })
                            [ Add.width fill
                            , Add.padding 5
                            , Event.onBlur <| UpdateRegisterErrors field
                            ]
                            { onChange = UpdateRegisterForm field
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
