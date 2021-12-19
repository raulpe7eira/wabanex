defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  alias Wabanex.IMC

  describe "calculate/1" do
    test "when the file exist, returns the data" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)

      expected_response =
        {:ok,
         %{
           "Beltrano" => 21.34502923976608,
           "Fulana" => 18.285714285714285,
           "Fulano" => 26.48809523809524,
           "Sicrano" => 17.77777777777778
         }}

      assert response == expected_response
    end

    test "when the wrong file name is given, returns an error" do
      params = %{"filename" => "non_exists.csv"}

      response = IMC.calculate(params)

      expected_response = {:error, "Error while opening the file"}

      assert response == expected_response
    end
  end
end
