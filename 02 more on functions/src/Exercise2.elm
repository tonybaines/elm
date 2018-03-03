module Exercise2 exposing (..)

import Exercise1 exposing (..)
import Html


main : Html.Html msg
main =
    (~=) "abba" "baab"
        |> toString
        |> Html.text
