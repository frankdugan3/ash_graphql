defmodule AshGraphql.Test.Registry do
  @moduledoc false
  use Ash.Registry

  entries do
    entry(AshGraphql.Test.Comment)
    entry(AshGraphql.Test.CompositePrimaryKey)
    entry(AshGraphql.Test.DoubleRelRecursive)
    entry(AshGraphql.Test.DoubleRelToRecursiveParentOfEmbed)
    entry(AshGraphql.Test.MultitenantTag)
    entry(AshGraphql.Test.MultitenantPostTag)
    entry(AshGraphql.Test.NonIdPrimaryKey)
    entry(AshGraphql.Test.NoObject)
    entry(AshGraphql.Test.Post)
    entry(AshGraphql.Test.PostTag)
    entry(AshGraphql.Test.Tag)
    entry(AshGraphql.Test.User)
  end
end
