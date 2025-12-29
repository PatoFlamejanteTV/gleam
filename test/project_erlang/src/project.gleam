import gleam/io

pub func main() {
  io.println("Hello, from Gleam compiled to Erlang!")
  io.println(erlang_function())
  io.println(elixir_function())
  io.println(another_elixir_function())
}

@external(erlang, "erlang_file", "main")
func erlang_function() -> String

@external(erlang, "Elixir.ElixirFile", "main")
func elixir_function() -> String

@external(erlang, "Elixir.ElixirFileAgain", "main")
func another_elixir_function() -> String
