module Exercise2Test exposing (..)

import Exercise2 exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)


suite : Test
suite =
    describe "Uppercasing long strings"
        [ test "a short string with a low limit" <|
            \_ ->
                "aa"
                    |> uppercaseAsNecessary 1
                    |> Expect.equal "AA"
        , test "a really long string" <|
            \_ ->
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                    |> uppercaseLongerThan10
                    |> Expect.equal "AAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
        , test "a string that's just long enough" <|
            \_ ->
                "aaaaaaaaaaa"
                    |> uppercaseLongerThan10
                    |> Expect.equal "AAAAAAAAAAA"
        , test "a string that's not quite long enough" <|
            \_ ->
                "aaaaaaaaaa"
                    |> uppercaseLongerThan10
                    |> Expect.equal "aaaaaaaaaa"
        , fuzz string "with a fuzzed input" <|
            \fuzzedString ->
                fuzzedString
                    --                    |> Debug.log fuzzedString
                    |>
                        uppercaseLongerThan10
                    |> if (String.length fuzzedString <= 10) then
                        Expect.equal fuzzedString
                       else
                        Expect.notEqual fuzzedString
        ]
