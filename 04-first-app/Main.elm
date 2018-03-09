module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- model


type alias Model =
    { totalCalories : Int
    , caloriesToAdd : Int
    , calorieColour : String
    }


initModel : Model
initModel =
    { totalCalories = 0
    , caloriesToAdd = 0
    , calorieColour = "black"
    }



-- update


type Msg
    = AddCalorie
    | CalorieValueUpdated String
    | Clear


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddCalorie ->
            let
                newTotal =
                    model.totalCalories + model.caloriesToAdd

                colour =
                    if newTotal == 0 then
                        "black"
                    else if newTotal <= 1000 then
                        "green"
                    else if newTotal <= 1500 then
                        "gold"
                    else if newTotal <= 2000 then
                        "orange"
                    else if newTotal <= 2500 then
                        "coral"
                    else
                        "red"
            in
                { model
                    | totalCalories = newTotal
                    , calorieColour = colour
                }

        CalorieValueUpdated newValue ->
            case newValue of
                "" ->
                    { model | caloriesToAdd = 0 }

                _ ->
                    case String.toInt newValue of
                        Err msg ->
                            model

                        Ok val ->
                            { model | caloriesToAdd = val }

        Clear ->
            initModel



-- view


view : Model -> Html Msg
view model =
    div []
        [ h3
            [ style [ ( "color", model.calorieColour ) ]
            ]
            [ text ("Total Calories: " ++ (toString model.totalCalories)) ]
        , input
            [ type_ "text"
            , value (toString model.caloriesToAdd)
            , onInput CalorieValueUpdated
            ]
            []
        , button
            [ type_ "button"
            , onClick AddCalorie
            ]
            [ text "Add" ]
        , button
            [ type_ "button"
            , onClick Clear
            ]
            [ text "Clear" ]
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initModel
        , update = update
        , view = view
        }
