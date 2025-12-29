pub func main() {
  println("Hello, from project_javascript!")
}

@external(erlang, "erlang", "display")
@external(javascript, "./project_ffi.mjs", "log")
func println(a: String) -> Nil
