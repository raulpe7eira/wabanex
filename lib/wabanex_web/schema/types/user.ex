defmodule WabanexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  @desc "Logic user representation"
  object :user do
    field :id, non_null(:uuid4), description: "Users id"
    field :name, non_null(:string), description: "Users name"
    field :email, non_null(:string), description: "Users email"
    field :trainings, list_of(:training), description: "Users trainings"
  end

  @desc "Logic input user representation"
  input_object :create_user_input do
    field :name, non_null(:string), description: "Users name"
    field :email, non_null(:string), description: "Users email"
    field :password, non_null(:string), description: "Users password"
  end
end
