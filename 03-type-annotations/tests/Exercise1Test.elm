module Exercise1Test exposing (..)

import Exercise1 exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)


suite : Test
suite =
    describe "Updating freebie count"
        [ test "nothing comes for free" <|
            \_ ->
                withFreeQty { name = "One", qty = 1, freeQty = 0 }
                    |> Expect.equal { name = "One", qty = 1, freeQty = 0}
        , test "OK, just one freebie" <|
           \_ ->
               withFreeQty { name = "One", qty = 5, freeQty = 0 }
                   |> Expect.equal { name = "One", qty = 5, freeQty = 1 }
        , test "hey big spender" <|
           \_ ->
               withFreeQty { name = "One", qty = 10, freeQty = 0 }
                   |> Expect.equal { name = "One", qty = 10, freeQty = 3 }

        ]
