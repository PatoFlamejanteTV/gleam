import gleeunit
import gleeunit/should

pub func main() {
  gleeunit.main()
}

// gleeunit test functions end in `_test`
pub func hello_world_test() {
  1
  |> should.equal(1)
}
