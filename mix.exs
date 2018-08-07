defmodule PrometheusProcessCollector.Mixfile do
  use Mix.Project

  def project do
    [
      app: :prometheus_process_collector,
      version: "1.3.1",
      compilers: [:elixir_make] ++ Mix.compilers(),
      make_cwd: "c_src",
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  defp description do
    """
    Prometheus.io process collector.
    Collector exports the current state of process metrics including cpu, memory,
    file descriptor usage and native threads count as well as the process start and up times.
    """
  end

  defp package do
    [
      build_tools: ["rebar3"],
      maintainers: ["Ilya Khaprov"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/deadtrickster/prometheus_process_collector.erl",
        "Prometheus.io Client" => "https://github.com/deadtrickster/prometheus.erl",
        "Inets HTTPD Exporter" => "https://hex.pm/packages/prometheus_httpd",
        "Prometheus.ex" => "https://hex.pm/packages/prometheus_ex",
        "Ecto Instrumenter" => "https://hex.pm/packages/prometheus_ecto",
        "Phoenix Instrumenter" => "https://hex.pm/packages/prometheus_phoenix",
        "Plugs Instrumenter/Exporter" => "https://hex.pm/packages/prometheus_plugs"
      },
      files: [
        "c_src/*.h",
        "c_src/*.c",
        "c_src/Makefile",
        "src",
        "README.md",
        "LICENSE",
        "rebar.config"
      ]
    ]
  end

  defp deps do
    [
      {:elixir_make, "~> 0.4"},
      {:prometheus, "~> 4.0"}
    ]
  end
end
