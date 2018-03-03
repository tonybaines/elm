module Exercise3Test exposing (..)

import Exercise3 exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)


suite : Test
suite =
    describe "counting words in a sentance"
        [ test "a sentance of no words" <|
            \_ ->
                wordCount " "
                    |> Expect.equal 0
        , test "a sentance of one word" <|
            \_ ->
                wordCount "the"
                    |> Expect.equal 1
        , test "a sentance of two words" <|
            \_ ->
                wordCount "the quick"
                    |> Expect.equal 2
        , test "a sentance of three words" <|
            \_ ->
                wordCount "the quick brown"
                    |> Expect.equal 3
        , test "a sentance with extra spaces" <|
            \_ ->
                wordCount " the quick   brown   "
                    |> Expect.equal 3
        ]
