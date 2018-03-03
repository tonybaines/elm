module Exercise1Test exposing (..)

import Exercise1 exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)


suite : Test
suite =
    describe "matching the first letter of two strings"
        [ test "first letters match" <|
            \_ ->
                ("abba" ~= "anna")
                    |> Expect.equal True
        , test "first letters do no match" <|
            \_ ->
                ("abba" ~= "baab")
                    |> Expect.equal False
        , test "First string is empty" <|
            \_ ->
                ("" ~= "baab")
                    |> Expect.equal False
        , test "Second string is empty" <|
            \_ ->
                ("abba" ~= "")
                    |> Expect.equal False
        , test "Both strings are empty" <|
            \_ ->
                ("" ~= "")
                    |> Expect.equal True
        ]
