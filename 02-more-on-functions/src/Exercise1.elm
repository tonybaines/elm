module Exercise1 exposing (..)

import Html


(~=) : String -> String -> Bool
(~=) first second =
    case ( first, second ) of
        ( "", "" ) ->
            True

        ( "", _ ) ->
            False

        ( _, "" ) ->
            False

        _ ->
            String.startsWith (String.left 1 first) second


main : Html.Html msg
main =
    ("foo" ~= "foobar")
        |> toString
        |> Html.text
