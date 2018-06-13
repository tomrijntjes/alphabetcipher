defmodule Alphabetcipher do
  def main(input,keyword) do
    trimmed = String.trim(input)
    String.length(trimmed)
    |> wrap_keyword(keyword)
    |> encode(trimmed)
  end

  def wrap_keyword(goal_length,keyword) do
    cond do
      String.length(keyword)===goal_length -> keyword
      String.length(keyword)>goal_length -> String.slice(keyword,0,goal_length)
      String.length(keyword)<goal_length -> wrap_keyword(goal_length,keyword<>keyword)
    end
  end

  def encode(keyword,message) do
    Enum.zip(String.graphemes(keyword),String.graphemes(message))
    |> Enum.map(&encode_pair/1)
  end

  def encode_pair({char_1,char_2}) do
    index = AlphabetUtils.find(char_2)
    AlphabetUtils.find(char_1)
    |> AlphabetUtils.wrap
    |> String.at(index)
  end

end
