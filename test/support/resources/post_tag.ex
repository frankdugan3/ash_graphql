defmodule AshGraphql.Test.PostTag do
  @moduledoc false

  use Ash.Resource,
    data_layer: Ash.DataLayer.Ets

  actions do
    defaults([:create, :update, :destroy, :read])
  end

  relationships do
    belongs_to :post, AshGraphql.Test.Post do
      primary_key?(true)
      required?(true)
    end

    belongs_to :tag, AshGraphql.Test.Tag do
      primary_key?(true)
      required?(true)
    end
  end
end
