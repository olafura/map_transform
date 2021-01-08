defmodule MapTransform.MixProject do
  use Mix.Project

  def project do
    [
      app: :map_transform,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "A library to transform between two map structures",
      package: package()
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
      {:ex_doc, "~> 0.14", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["Olafur Arason"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/olafura/map_transform"},
      files: ~w(lib LICENSE mix.exs README.md)
    ]
  end
end
