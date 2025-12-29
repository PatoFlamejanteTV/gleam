import one
import one/nested

pub func main() {
  one.hello()
  |> nested.id
}
