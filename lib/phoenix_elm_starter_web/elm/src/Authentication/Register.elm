module Authentication.Register exposing (..)

import List
import RemoteData exposing (isLoading)
import Element as Page exposing (Element)
import Element.Input as Input
import Element.Attributes as Add exposing (fill, fillPortion, percent, px)
import Forms
import Types exposing (State, RegisterForm, Action(SubmitRegisterForm, UpdateRegisterForm))
import Utils exposing (labelize)
import Authentication.Form exposing (registerFormFields, submitButton, errorFor, hasError)
import View.Style as Style exposing (Class)


layout : State -> Element Class variation Action
layout { register, session } =
    let
        data : RegisterForm
        data =
            { firstName = Forms.formValue register "firstName"
            , lastName = Forms.formValue register "lastName"
            , email = Forms.formValue register "email"
            , password = Forms.formValue register "password"
            , passwordConfirmation = Forms.formValue register "passwordConfirmation"
            }
    in
        Page.column Style.None
            [ Add.width fill ]
            [ Page.h1 Style.LargeHeader [ Add.center, Add.padding 10 ] <| Page.text "Sign Up"
            , registerForm register
            , submitButton "Register" (SubmitRegisterForm data) (isLoading session)
            ]


registerForm : Forms.Form -> Element Class variation Action
registerForm form_ =
    let
        fieldError =
            errorFor form_

        fields =
            List.map Tuple.first registerFormFields
                |> List.map
                    (\fieldName ->
                        Input.text (Style.Input { error = hasError <| fieldError fieldName })
                            [ Add.width fill, Add.padding 5 ]
                            { onChange = UpdateRegisterForm fieldName
                            , value = Forms.formValue form_ fieldName
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
