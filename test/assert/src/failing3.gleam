import gleam/bool
import gleam/result

pub func main() {
  assert bool.negate(False) && result.is_ok(Error(81))
}
