module Authentication.Register exposing (..)

import List
import RemoteData exposing (isLoading)
import Element as Page exposing (Element)
import Element.Input as Input
import Element.Attributes as Add exposing (fill, fillPortion, percent, px)
import Element.Events as Event
import Forms
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
import Authentication.Form exposing (registerFormFields, submitButton, errorFor, hasError)
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
            [ Add.width fill ]
            [ Page.h1 Style.LargeHeader [ Add.center, Add.padding 10 ] <| Page.text "Sign Up"
            , registerForm register
            , submitButton "Register" (SubmitRegisterForm data) (isLoading session)
            ]


registerForm : FormState -> Element Class variation Action
registerForm { form, errors } =
    let
        fieldError =
            flip errorFor errors

        fields =
            List.map Tuple.first registerFormFields
                |> List.map
                    (\fieldName ->
                        Input.text
                            (Style.Input { error = hasError <| fieldError fieldName })
                            [ Add.width fill
                            , Add.padding 5
                            , Event.onBlur <| UpdateRegisterErrors fieldName
                            ]
                            { onChange = UpdateRegisterForm fieldName
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
