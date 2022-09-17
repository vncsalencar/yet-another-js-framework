defmodule YajsfBackendWeb.Schemas do
  defmodule ContentWeLiked do
    require OpenApiSpex
    alias OpenApiSpex.{Schema}

    OpenApiSpex.schema(%{
      type: :object,
      required: [:contentType, :title, :link],
      properties: %{
        contentType: %Schema{
          type: :string,
          enum: ["Article", "Video", "Project"]
        },
        title: %Schema{type: :string},
        author: %Schema{type: :string},
        date: %Schema{type: :string},
        tags: %Schema{type: :string},
        thumbnailUrl: %Schema{type: :string},
        thumbnailAlt: %Schema{type: :string},
        link: %Schema{type: :string}
      }
    })
  end

  defmodule HelpfulMaterialItem do
    require OpenApiSpex
    alias OpenApiSpex.{Reference, Schema}

    OpenApiSpex.schema(%{
      type: :object,
      required: [:title, :link],
      properties: %{
        title: %Schema{type: :string},
        link: %Schema{type: :string}
      }
    })
  end

  defmodule HelpfulMaterial do
    require OpenApiSpex
    alias OpenApiSpex.{Schema}

    OpenApiSpex.schema(%{
      type: :object,
      required: [:title],
      properties: %{
        title: %Schema{type: :string},
        materials: %Schema{
          type: :array,
          items: HelpfulMaterialItem
        }
      }
    })
  end
end
