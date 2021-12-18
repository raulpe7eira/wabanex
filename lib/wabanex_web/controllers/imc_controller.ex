defmodule WabanexWeb.IMCController do
  use WabanexWeb, :controller

  alias Wabanex.IMC

  def index(conn, params) do
    params
    |> IMC.calculate()
    |> handle_response(conn)
  end

  defp handle_response({:ok, result}, conn), do: render_response(conn, :ok, result)
  defp handle_response({:error, reason}, conn), do: render_response(conn, :bad_request, reason)

  defp render_response(conn, status, data) do
    conn
    |> put_status(status)
    |> json(%{data: data})
  end
end
