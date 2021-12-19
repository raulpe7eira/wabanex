defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Fulano", email: "fulano@mail.com", password: "123456"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
               valid?: true,
               changes: %{name: "Fulano", email: "fulano@mail.com", password: "123456"},
               errors: []
             } = response
    end

    test "when there are invalid params, returns an error" do
      params = %{name: "F", email: "fulano@mail.com", password: "12345"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
               valid?: false,
               changes: %{name: "F", email: "fulano@mail.com", password: "12345"},
               errors: [
                 password:
                   {"should be at least %{count} character(s)",
                    [count: 6, validation: :length, kind: :min, type: :string]},
                 name:
                   {"should be at least %{count} character(s)",
                    [count: 2, validation: :length, kind: :min, type: :string]}
               ]
             } = response
    end
  end
end
