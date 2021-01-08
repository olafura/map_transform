defmodule MapTransformTest do
  use ExUnit.Case
  doctest MapTransform

  test "transform" do
    expected = %{
      age: 32,
      gender: :female,
      multiplier: 28.71,
      smoker?: :smoker,
      term: 75
    }

    source = %{
      "age" => 32,
      "gender" => "female",
      "multiplier" => "28.71",
      "smoker" => "smoker",
      "term" => "75.0"
    }

    mapping = [
      {["age"], [:age]},
      {["gender"], [:gender], &String.to_atom/1},
      {["multiplier"], [:multiplier], &String.to_float/1},
      {["smoker"], [:smoker?], &String.to_atom/1},
      {["term"], [:term], &String.to_float/1}
    ]

    actual = MapTransform.transform(source, mapping)
    assert actual == expected
  end
end
