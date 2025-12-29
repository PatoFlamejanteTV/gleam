import gleamy/bench

import gleam/io
import gleam/list

pub func print_results(results: List(bench.BenchResults)) {
  results
  |> list.map(func(result) {
    result
    |> bench.table([bench.IPS, bench.Min, bench.P(99)])
    |> io.println()
  })
}
