defmodule Dakuonex do
  @moduledoc """
    `Dakuonex` is a tool that converts Hiragana and Katakana into unvoiced and voiced/semi-voiced sounds.
  """

  @convert_list [
    {"か", "が"},
    {"き", "ぎ"},
    {"く", "ぐ"},
    {"け", "げ"},
    {"こ", "ご"},
    {"さ", "ざ"},
    {"し", "じ"},
    {"す", "ず"},
    {"せ", "ぜ"},
    {"そ", "ぞ"},
    {"た", "だ"},
    {"ち", "ぢ"},
    {"つ", "づ"},
    {"て", "で"},
    {"と", "ど"},
    {"は", "ば"},
    {"ひ", "び"},
    {"ふ", "ぶ"},
    {"へ", "べ"},
    {"ほ", "ぼ"},
    {"は", "ぱ"},
    {"ひ", "ぴ"},
    {"ふ", "ぷ"},
    {"へ", "ぺ"},
    {"ほ", "ぽ"},
    {"カ", "ガ"},
    {"キ", "ギ"},
    {"ク", "グ"},
    {"ケ", "ゲ"},
    {"コ", "ゴ"},
    {"サ", "ザ"},
    {"シ", "ジ"},
    {"ス", "ズ"},
    {"セ", "ゼ"},
    {"ソ", "ゾ"},
    {"タ", "ダ"},
    {"チ", "ヂ"},
    {"ツ", "ヅ"},
    {"テ", "デ"},
    {"ト", "ド"},
    {"ハ", "バ"},
    {"ヒ", "ビ"},
    {"フ", "ブ"},
    {"ヘ", "ベ"},
    {"ホ", "ボ"},
    {"ハ", "パ"},
    {"ヒ", "ピ"},
    {"フ", "プ"},
    {"ヘ", "ペ"},
    {"ホ", "ポ"},
  ]


  @doc """
    iex> Dakuonex.remove("がんがんバルバル")
    "かんかんハルハル"
  """
  def remove(str), do: letter_map(&convert_voiced_unvoiced/1, str)

  @doc """
    iex> Dakuonex.attach("しゃちほこ")
    "じゃぢぼご"
  """
  def attach(str), do: letter_map(&convert_unvoiced_to_voiced/1, str)

  @spec letter_map(fun(), binary) :: binary
  defp letter_map(map_fn, str) do
    to_charlist(str)
    |> Enum.map(&map_fn.(<<&1::utf8>>))
    |> to_string
  end

  @spec convert_unvoiced_to_voiced(binary) :: binary
  defp convert_unvoiced_to_voiced(code) do
    List.keyfind(@convert_list, code, 0, {nil, code}) |> elem(1)
  end

  @spec convert_voiced_unvoiced(binary) :: binary
  defp convert_voiced_unvoiced(code) do
    List.keyfind(@convert_list, code, 1, {code, nil}) |> elem(0)
  end
end
