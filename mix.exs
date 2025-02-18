defmodule AshGraphql.MixProject do
  use Mix.Project

  @description """
  An absinthe-backed graphql extension for Ash
  """

  @version "0.17.5-rc1"

  def project do
    [
      app: :ash_graphql,
      version: @version,
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      package: package(),
      aliases: aliases(),
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),
      dialyzer: [plt_add_apps: [:ash]],
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.github": :test
      ],
      docs: docs(),
      description: @description,
      source_url: "https://github.com/ash-project/ash_graphql",
      homepage_url: "https://github.com/ash-project/ash_graphql"
    ]
  end

  defp elixirc_paths(:test) do
    elixirc_paths(:dev) ++ ["test/support"]
  end

  defp elixirc_paths(_) do
    ["lib"]
  end

  defp docs do
    [
      main: "AshGraphql",
      source_ref: "v#{@version}",
      logo: "logos/small-logo.png",
      extra_section: "GUIDES",
      extras: [
        "documentation/introduction/getting_started.md",
        "documentation/multitenancy.md",
        "documentation/enums.md",
        "documentation/authorization.md",
        "documentation/json.md"
      ],
      groups_for_extras: [
        Introduction: Path.wildcard("documentation/introduction/*.md")
      ],
      groups_for_modules: [
        "Resource DSL": ~r/AshGraphql.Resource/,
        "Api DSL": ~r/AshGraphql.Api/
      ]
    ]
  end

  defp package do
    [
      name: :ash_graphql,
      licenses: ["MIT"],
      links: %{
        GitHub: "https://github.com/ash-project/ash_graphql"
      }
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ash, ash_version("~> 1.52.0-rc.9")},
      {:absinthe_plug, "~> 1.4"},
      {:absinthe, "~> 1.7"},
      {:dataloader, "~> 1.0"},
      {:jason, "~> 1.2"},
      {:ex_doc, "~> 0.22", only: :dev, runtime: false},
      {:ex_check, "~> 0.12.0", only: :dev},
      {:credo, ">= 0.0.0", only: :dev, runtime: false},
      {:dialyxir, ">= 0.0.0", only: :dev, runtime: false},
      {:sobelow, ">= 0.0.0", only: :dev, runtime: false},
      {:git_ops, "~> 2.4.3", only: :dev},
      {:excoveralls, "~> 0.13.0", only: [:dev, :test]}
    ]
  end

  defp ash_version(default_version) do
    case System.get_env("ASH_VERSION") do
      nil -> default_version
      "local" -> [path: "../ash"]
      "main" -> [git: "https://github.com/ash-project/ash.git"]
      version -> "~> #{version}"
    end
  end

  defp aliases do
    [
      sobelow: "sobelow --skip",
      credo: "credo --strict",
      "ash.formatter": "ash.formatter --extensions AshGraphql.Resource,AshGraphql.Api"
    ]
  end
end
