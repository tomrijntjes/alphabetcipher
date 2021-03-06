defmodule AlphabetUtils do
  @moduledoc """
  Documentation for Alphabetcipher.
  Get an index for a character.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Alphabet.index
      :world

  """
  @alphabet "abcdefghijklmnopqrstuvwxyz"

  def find(needle, haystack \\ @alphabet) do
    case String.split(haystack, needle, parts: 2) do
      [left, _] -> String.length(left)
    end
  end

  def wrap(index) do
    @alphabet
    {first,last} = String.split_at(@alphabet,index)
    last <> first
  end

  def at(index) do
    @alphabet
    String.at(@alphabet, index)
  end

end
