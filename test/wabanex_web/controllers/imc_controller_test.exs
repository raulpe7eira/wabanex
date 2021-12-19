defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params area valid, returns the imc info", %{conn: conn} do
      params = %{"filename" => "students.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "Beltrano" => 21.34502923976608,
          "Fulana" => 18.285714285714285,
          "Fulano" => 26.48809523809524,
          "Sicrano" => 17.77777777777778
        }
      }

      assert response == expected_response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{"filename" => "non_exists.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

      expected_response = %{"data" => "Error while opening the file"}

      assert response == expected_response
    end
  end
end
