defmodule DakuonexTest do
  use ExUnit.Case
  doctest Dakuonex

  test "convert unvoiced to voiced/semi-voiced" do
    assert Dakuonex.attach("かきくけこさしすせそたちつてとはひふへほ") == "がぎぐげござじずぜぞだぢづでどばびぶべぼ"
    assert Dakuonex.attach("カキクケコサシスセソタチツテトハヒフヘホ") == "ガギグゲゴザジズゼゾダヂヅデドバビブベボ"
  end

  test "convert voiced/semi-voiced to unvoiced" do
    assert Dakuonex.remove("がぎぐげござじずぜぞだぢづでどばびぶべぼ") == "かきくけこさしすせそたちつてとはひふへほ"
    assert Dakuonex.remove("ガギグゲゴザジズゼゾダヂヅデドバビブベボ") == "カキクケコサシスセソタチツテトハヒフヘホ"
  end
end
