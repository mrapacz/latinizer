defmodule Latinizer.Mixfile do
  use Mix.Project

  def project do
    [
      app: :latinizer,
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
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
      files: ["lib", "mix.exs", "README", "LICENSE"],
      maintainers: ["Maciej Rapacz"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/mrapacz/latinizer"}
    ]
  end
end
