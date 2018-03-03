module Exercise1 exposing (..)

import Html

type alias Record = { name : String, qty : Int, freeQty : Int }

cart: List Record
cart =
    [ { name = "Lemon", qty = 1, freeQty = 0 }
    , { name = "Apple", qty = 5, freeQty = 0 }
    , { name = "Pear", qty = 10, freeQty = 0 }
    ]

moreItemsThan: Int -> Record ->  Bool
moreItemsThan minimum {qty} =
    qty >= minimum

withFreeQty : Record -> Record
withFreeQty record =
    if moreItemsThan 10 record then
        { record | freeQty = 3 }
    else if moreItemsThan 5 record then
        { record | freeQty = 1 }
    else
        record


main : Html.Html msg
main =
    cart
        |> List.map withFreeQty
        |> List.map toString
        |> String.join ", "
        |> Html.text
