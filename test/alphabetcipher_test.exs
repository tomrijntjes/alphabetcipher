defmodule AlphabetcipherTest do
  use ExUnit.Case
  doctest Alphabetcipher

  test "Cipher core" do
    assert Alphabetcipher.encode_chars({"v","m"}) == "h"
    assert Alphabetcipher.encode_chars({"m","v"}) == "h"
    assert Alphabetcipher.encode_chars({"i","n"}) == "v"
    assert Alphabetcipher.encode_chars({"g","n"}) == "t"
  end

  test "Cipher core decoding" do
    assert Alphabetcipher.decode_chars({"v","h"}) == "m"
    assert Alphabetcipher.decode_chars({"i","v"}) == "n"
    assert Alphabetcipher.decode_chars({"g","t"}) == "n"
  end

  test "wrap keyword" do
    assert Alphabetcipher.wrap_keyword(6,"down") == "downdo"
    assert Alphabetcipher.wrap_keyword(2,"down") == "do"
    assert Alphabetcipher.wrap_keyword(10,"yes") == "yesyesyesy"
  end

  test "integration" do
    assert Alphabetcipher.encode("vigilance","meetmeontuesdayeveningatseven") == "hmkbxebpxpmyllyrxiiqtoltfgzzv"
    assert Alphabetcipher.decode("vigilance","hmkbxebpxpmyllyrxiiqtoltfgzzv") == "meetmeontuesdayeveningatseven"

    assert Alphabetcipher.encode("unbreakable","Learning Elixir with Lewis Carroll") == "frbirixgfwmrvsnmtrlfhmmpbivovl"
    assert Alphabetcipher.decode("unbreakable","frbirixgfwmrvsnmtrlfhmmpbivovl") == "learningelixirwithlewiscarroll"
  end

  test "encoding" do
    assert assert Alphabetcipher.encode_strings("vigilancevigilancevigilancevi","meetmeontuesdayeveningatseven") == "hmkbxebpxpmyllyrxiiqtoltfgzzv"
  end
end
