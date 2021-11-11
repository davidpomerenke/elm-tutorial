module Main exposing (..)

import Browser
import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick)



---- BASICS ----
-- A type declaration:


type alias Coordinate =
    { x : Int
    , y : Int
    , z : Int
    }



-- A value of that type:


myCoordinate : Coordinate
myCoordinate =
    { x = 3
    , y = 4
    , v = 0
    }



-- A function with two arguments of this type:


distance : Coordinate -> Coordinate -> Float
distance a b =
    sqrt (toFloat ((a.x - b.x) ^ 2 + (a.y - b.y) ^ 2 + (a.z - b.z) ^ 2))



-- ... the same function, using the pipe symbol |> :


distance_2 : Coordinate -> Coordinate -> Float
distance_2 a b =
    ((a.x - b.x) ^ 2 + (a.y - b.y) ^ 2 + (a.z - b.z) ^ 2)
        |> toFloat
        |> sqrt
        |> String.fromFloat



-- ... or the other way round:


distance_3 : Coordinate -> Coordinate -> Float
distance_3 a b =
    sqrt <|
        toFloat <|
            ((a.x - b.x) ^ 2 + (a.y - b.y) ^ 2 + (a.z - b.z) ^ 2)



-- ... or using some intermediate variables:


distance_4 : Coordinate -> Coordinate -> Float
distance_4 a b =
    let
        dx =
            a.x - b.x

        dy =
            a.y - b.y

        dz =
            a.z - b.z

        -- All variables are immutable, so this won't work:
        dz =
            dz + 1
    in
    (dx ^ 2 + dy ^ 2 + dz ^ 2)
        |> toFloat
        |> sqrt


origin : Coordinate
origin =
    { x = 0, y = 0, z = 0 }



-- Partially applying a function:


distanceToOrigin : Coordinate -> Float
distanceToOrigin =
    distance origin



-- ... and then completely applying it:


myDistance : Float
myDistance =
    distanceToOrigin myCoordinate



---- LISTS AND LAMBDAS ----
-- Map:


hundreds : List Int
hundreds =
    -- [100, 200, 300, 400, 500, 600, 700, 800, 900]
    List.map (\a -> a * 100) [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]



-- Fold left:


sum : List Int -> Int
sum =
    List.foldl
        (\a b -> a + b)


mySum : Int
mySum =
    -- 15
    sum [ 1, 2, 3, 4, 5 ]



-- Filter:


onlyPositive : List Int -> List Int
onlyPositive =
    List.filter (\a -> a > 0)


onlyPositiveUntilFive : List Int
onlyPositiveUntilFive =
    onlyPositive [ -3, -2, -1, 0, 1, 2, 3, 4, 5 ]



---- TYPES ----
-- Or type:


type Status
    = Pending
    | Resolved


myStatus : Status
myStatus =
    "Pending"


statusText : Status -> String
statusText status =
    case status of
        Pending ->
            "Loading ..."



-- Maybe type for string:


type MaybeString
    = Nothing__
    | Just__ String


myMaybeString_1 : MaybeString
myMaybeString_1 =
    Just "Trees are green."



-- Type with a variable:


type Maybe_ a
    = Nothing_
    | Just_ a


myMaybeString_2 : Maybe String
myMaybeString_2 =
    "Trees are blue."


repeat : Maybe String -> Maybe String
repeat s =
    case s of
        Just a ->
            Just (a ++ a)

        Nothing ->
            Nothing


repeat_2 : Maybe String -> Maybe String
repeat_2 s =
    Maybe.map (\a -> a ++ a) s



---- AN ACTUAL APPLICATION ----
---- MODEL ----


type alias Model =
    String


init : Model
init =
    "I am the state."



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    model



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ img [ src "/logo.svg" ] []
        , h1 [] [ text "Your Elm App is working!" ]
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.sandbox
        { view = view
        , init = init
        , update = update
        }
