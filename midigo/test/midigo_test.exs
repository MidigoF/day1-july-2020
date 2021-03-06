defmodule MidigoTest do
  use ExUnit.Case
  doctest Midigo

  describe "duplicates_count/1" do
    test "returns 0 if no characters repeat more than once" do
      assert Midigo.duplicates_count("abcde") == 0
    end

    test "only counts distinct characters that repeat" do
      assert Midigo.duplicates_count("aabbcde") == 2
      assert Midigo.duplicates_count("indivisibility") == 1
      assert Midigo.duplicates_count("Indivisibilities") == 2
    end

    test "the counts included are not case sensitive" do
      assert Midigo.duplicates_count("aabBcde") == 2
      assert Midigo.duplicates_count("ABBA") == 2
    end

    test "returns the correct duplicate count for numeric values" do
      assert Midigo.duplicates_count("aA11") == 2
    end
  end

  describe "capitalize/2" do
    test "capitalizes characters at the given indices of the given string" do
      assert Midigo.capitalize("abcdef", [1, 2, 5]) == "aBCdeF"
    end

    test "assumes if the index given doesn't exist" do
      assert Midigo.capitalize("abcdef", [1, 2, 5, 100]) == "aBCdeF"
    end
  end
end
