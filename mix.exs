defmodule Latinizer.Mixfile do
  use Mix.Project

  def project do
    [
      app: :latinizer,
      version: "0.4.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      # docs
      name: "Latinizer",
      source_url: "https://github.com/mrapacz/latinizer",
      description: description(),
      docs: [
        main: "Latinizer",
        extras: ["README.md"]
      ],
      # test coverage
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.16", only: :dev, runtime: false},
      {:excoveralls, "~> 0.7", only: :test}
    ]
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
