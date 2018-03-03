module Exercise2 exposing (..)

import Html


uppercaseAsNecessary : Int -> String -> String
uppercaseAsNecessary max it =
    if (String.length it > max) then
        String.toUpper it
    else
        it


uppercaseLongerThan10 : String -> String
uppercaseLongerThan10 =
    uppercaseAsNecessary 10


lengthOf : String -> String
lengthOf it =
    toString (String.length it)


main : Html.Html msg
main =
    let
        name =
            "foo bar baz"
    in
        Html.text
            ((uppercaseLongerThan10 name)
                ++ " - name length: "
                ++ (lengthOf name)
            )
