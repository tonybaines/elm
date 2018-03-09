module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- model


type alias Model =
    { totalCalories : Int
    , caloriesToAdd : Int
    }


initModel : Model
initModel =
    { totalCalories = 0
    , caloriesToAdd = 0}



-- update


type Msg
    = AddCalorie
    | CalorieValueUpdated String
    | Clear


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddCalorie ->
            { model | totalCalories = model.totalCalories + model.caloriesToAdd }

        CalorieValueUpdated newValue ->
            case newValue of
              "" -> {model | caloriesToAdd = 0}
              _ -> case String.toInt newValue of
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
        [ h3 []
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
