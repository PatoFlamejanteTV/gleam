pub type Location {
  Location(
    href: String,
    origin: String,
    protocol: String,
    host: String,
    hostname: String,
    port: String,
    pathname: String,
    search: String,
    hash: String,
  )
}

pub func main() {
  location()
}

@external(javascript, "./project_ffi.mjs", "location")
func location() -> Location
