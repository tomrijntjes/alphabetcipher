defmodule Alphabetcipher do
  def encode(keyword,message) do
    trimmed = String.downcase(message)
    |> String.replace(" ","")
    String.length(trimmed)
    |> wrap_keyword(keyword)
    |> encode_strings(trimmed)

  end

  def decode(keyword,cipher) do
    trimmed = String.downcase(cipher)
    |> String.replace(" ","")
    String.length(trimmed)
    |> wrap_keyword(keyword)
    |> decode_strings(trimmed)
  end

  def wrap_keyword(goal_length,keyword) do
    cond do
      String.length(keyword)===goal_length -> keyword
      String.length(keyword)>goal_length -> String.slice(keyword,0,goal_length)
      String.length(keyword)<goal_length -> wrap_keyword(goal_length,keyword<>keyword)
    end
  end

  def encode_strings(keyword,message) do
    Enum.zip(String.graphemes(keyword),String.graphemes(message))
    |> Enum.map(&encode_chars/1)
    |> Enum.join
  end

  def decode_strings(keyword,message) do
    Enum.zip(String.graphemes(keyword),String.graphemes(message))
    |> Enum.map(&decode_chars/1)
    |> Enum.join
  end

  def encode_chars({char_1,char_2}) do
    index = AlphabetUtils.find(char_2)
    AlphabetUtils.find(char_1)
    |> AlphabetUtils.wrap
    |> String.at(index)
  end

  def decode_chars({char_1,char_2}) do
    wrapped_alpha = AlphabetUtils.find(char_1)
    |> AlphabetUtils.wrap
    AlphabetUtils.find(char_2,wrapped_alpha)
    |> AlphabetUtils.at
  end


end
