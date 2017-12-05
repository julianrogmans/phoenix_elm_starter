module View.StyleHelpers exposing (..)

import List exposing (map)
import List.Extra as List exposing (andThen)
import Style exposing (Style, Property)
import Style.Sheet as Sheet
import View.Style exposing (Class)


type alias ClassList variation =
    List (Rule variation)


type alias Rule variation =
    ( Class, List (Property Class variation) )


type alias Condition variation =
    ( Property Class variation, Bool )


type alias Properties variation =
    List (Property Class variation)


type Variations variation
    = Optional (List (Condition variation))
    | Default (List (Property Class variation))


class : Class -> List (Variations variation) -> Rule variation
class style variations =
    ( style, variations |> andThen mapVariations )


mapVariations : Variations variation -> List (Property Class variation)
mapVariations rules =
    case rules of
        Optional conditionalVariations ->
            conditionalVariations
                |> List.filterMap conditionalStyles

        Default styles ->
            styles


conditionalStyles : Condition variation -> Maybe (Property Class variation)
conditionalStyles ( property, condition ) =
    case condition of
        True ->
            Just property

        False ->
            Nothing


updateStyle : List (Property Class variation) -> Rule variation -> Rule variation
updateStyle pageVariations ( style, variations ) =
    ( style
    , (variations ++ pageVariations)
    )


maybeUpdateAt : Maybe Int -> (a -> a) -> List a -> Maybe (List a)
maybeUpdateAt index updater list =
    case index of
        Just index_ ->
            List.updateAt index_ updater list

        Nothing ->
            Nothing


override : ClassList variation -> Rule variation -> ClassList variation
override styles (( s, pageVariations ) as pageStyle) =
    let
        index =
            List.findIndex (indexOf pageStyle) styles

        stylesWereUpdated =
            maybeUpdateAt index (updateStyle pageVariations) styles
    in
        case (stylesWereUpdated) of
            Just updatedStyles ->
                updatedStyles

            Nothing ->
                List.append styles [ pageStyle ]


indexOf : Rule variation -> Rule variation -> Bool
indexOf ( pageStyle, pv ) ( style, v ) =
    pageStyle == style


toStyle : Rule variation -> Style Class variation
toStyle ( style, variations ) =
    Style.style style variations


composeWith : ClassList variation -> ClassList variation -> List (Style Class variation)
composeWith pageStyles initialStyles =
    pageStyles
        |> andThen (override initialStyles)
        |> map toStyle
