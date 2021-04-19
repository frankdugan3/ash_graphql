defmodule AshGraphql.Resource.Mutation do
  @moduledoc "Represents a configured mutation on a resource"
  defstruct [:name, :action, :type, :identity, :read_action, :upsert?]

  @create_schema [
    name: [
      type: :atom,
      doc: "The name to use for the mutation.",
      default: :get
    ],
    action: [
      type: :atom,
      doc: "The action to use for the mutation.",
      required: true
    ],
    upsert?: [
      type: :boolean,
      default: false,
      doc: "Whether or not to use the `upsert?: true` option when calling `YourApi.create/2`."
    ]
  ]

  @update_schema [
    name: [
      type: :atom,
      doc: "The name to use for the mutation.",
      default: :get
    ],
    action: [
      type: :atom,
      doc: "The action to use for the mutation.",
      required: true
    ],
    identity: [
      type: :atom,
      doc: """
      The identity to use to fetch the record to be updated.

      If no identity is required (e.g for a read action that already knows how to fetch the item to be updated), use `false`.
      """
    ],
    read_action: [
      type: :atom,
      doc:
        "The read action to use to fetch the record to be updated. Defaults to the primary read action."
    ]
  ]

  @destroy_schema [
    name: [
      type: :atom,
      doc: "The name to use for the mutation.",
      default: :get
    ],
    action: [
      type: :atom,
      doc: "The action to use for the mutation.",
      required: true
    ],
    read_action: [
      type: :atom,
      doc:
        "The read action to use to fetch the record to be destroyed. Defaults to the primary read action."
    ],
    identity: [
      type: :atom,
      doc: """
      The identity to use to fetch the record to be destroyed.
      If no identity is required (e.g for a read action that already knows how to fetch the item to be updated), use `false`.
      """
    ]
  ]

  def create_schema, do: @create_schema
  def update_schema, do: @update_schema
  def destroy_schema, do: @destroy_schema
end
