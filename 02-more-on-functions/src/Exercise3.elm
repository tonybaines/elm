module Exercise3 exposing (..)

import Html
import Regex exposing (HowMany(All), regex)


wordCount : String -> Int
wordCount =
    String.words
        >> List.filter (not << String.isEmpty)
        >> List.length


main : Html.Html msg
main =
    "Hello World"
        |> Html.text
