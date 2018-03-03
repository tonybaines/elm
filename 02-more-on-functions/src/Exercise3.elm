module Exercise3 exposing (..)

import Html
import Regex exposing (HowMany(All), regex)


wordCount : String -> Int
wordCount =
    Regex.split All (regex "\\s+")
        >> List.filter (\i -> (String.isEmpty i) == False)
        >> List.length


main : Html.Html msg
main =
    "Hello World"
        |> Html.text
