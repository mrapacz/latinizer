defmodule Latinizer.Mixfile do
  use Mix.Project

  def project do
    [
      app: :latinizer,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      name: "Latinizer",
      description: description(),
      source_url: "https://github.com/mrapacz/latinizer"
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    []
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Maciej Rapacz"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/mrapacz/latinizer"}
    ]
  end

  defp description do
    "A string-translating module responsible for getting rid of diacritic signs in strings."
  end
end
