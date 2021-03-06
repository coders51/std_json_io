defmodule StdJsonIo.Mixfile do
  use Mix.Project

  @version "0.1.0"
  @url "https://github.com/hassox/std_json_io"
  @maintainers ["Daniel Neighman"]

  def project do
    [app: :std_json_io,
     name: "StdJsonIo",
     version: @version,
     package: package(),
     elixir: "~> 1.1",
     source_url: @url,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     maintainers: @maintainers,
     description: "Application for managing and communicating with IO servers via JSON",
     homepage_url: @url,
     docs: docs(),
     deps: deps()]
  end

  def application do
    [
      applications: [:logger, :porcelain],
      mod: {StdJsonIo.Application, []}
    ]
  end

  def docs do
    [
      extras: ["README.md", "CHANGELOG.md"],
      source_ref: "v#{@version}",
      main: "extra-readme"
    ]
  end

  defp deps do
    [
      {:porcelain, "~> 2.0.3"},
      {:poolboy, "~> 1.5.1"},
      {:poison, "~> 2.0 or ~> 3.1.0"}
    ]
  end

  defp package do
    [
      maintainers: @maintainers,
      licenses: ["MIT"],
      links: %{github: @url},
      files: ~w(lib) ++ ~w(CHANGELOG.md LICENSE mix.exs README.md)
    ]
  end
end
