defmodule WabanexWeb.Schema do
  use Absinthe.Schema

  import_types WabanexWeb.Schema.Types.Root

  mutation do
    import_fields :root_mutation
  end

  query do
    import_fields :root_query
  end
end
