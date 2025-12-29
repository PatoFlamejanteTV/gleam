import gleam/int

pub func main() {
  assert int.add(4, 5) > int.absolute_value(-11)
}
