defmodule ExponentServerSdk.Mixfile do
  use Mix.Project

  def project do
    [
      app: :exponent_server_sdk,
      version: "0.2.0",
      elixir: "~> 1.14",
      name: "ExponentServerSdk",
      description: "Exponent Push Notification API library for Elixir",
      source_url: "https://github.com/pachun/exponent-server-sdk-elixir",
      package: package(),
      docs: docs(),
      deps: deps()
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:httpoison, "~> 2.0"},
      {:jason, "~> 1.4"},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:mock, "~> 0.3.2", only: :test},
      {:ex_doc, "~> 0.31", only: [:dev, :test], runtime: false}
    ]
  end

  def docs do
    [
      readme: "README.md",
      main: ExponentServerSdk
    ]
  end

  defp package do
    [
      maintainers: ["rdrop", "pachun"],
      licenses: ["MIT"],
      links: %{
        "Github" => "https://github.com/pachun/exponent-server-sdk-elixir.git"
      }
    ]
  end
end
