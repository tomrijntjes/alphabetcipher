defmodule AlphabetcipherTest do
  use ExUnit.Case
  doctest Alphabetcipher

  test "Cipher core" do
    assert Alphabetcipher.encode_pair({"v","m"}) == "h"
    assert Alphabetcipher.encode_pair({"m","v"}) == "h"
    assert Alphabetcipher.encode_pair({"i","n"}) == "v"
    assert Alphabetcipher.encode_pair({"g","n"}) == "t"
  end

  test "wrap keyword" do
    assert Alphabetcipher.wrap_keyword(6,"down") == "downdo"
    assert Alphabetcipher.wrap_keyword(2,"down") == "do"
    assert Alphabetcipher.wrap_keyword(10,"yes") == "yesyesyesy"
  end
end
