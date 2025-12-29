pub func submodule_main() {
  parent_println(message())
  parent_println(elixir_message())
}

@external(erlang, "project_ffi", "log")
@external(javascript, "../project_ffi.mjs", "log")
func parent_println(a: String) -> Nil

@external(erlang, "submodule_ffi", "main")
@external(javascript, "./submodule_ffi.mjs", "main")
func message() -> String

@external(erlang, "Elixir.ElixirFile", "main")
@external(javascript, "./submodule_ffi.mjs", "main")
func elixir_message() -> String
