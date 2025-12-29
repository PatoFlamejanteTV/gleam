import nested/submodule

pub func main() {
  println("Hello from subdir_ffi!")
  submodule.submodule_main()
  println(subdir_message())
  println(subdir_elixir_message())
}

@external(erlang, "project_ffi", "log")
@external(javascript, "./project_ffi.mjs", "log")
func println(a: String) -> Nil

@external(erlang, "submodule_ffi", "main2")
@external(javascript, "./nested/submodule_ffi.mjs", "main2")
func subdir_message() -> String

@external(erlang, "Elixir.ElixirFileAgain", "main")
@external(javascript, "./nested/submodule_ffi.mjs", "main2")
func subdir_elixir_message() -> String
