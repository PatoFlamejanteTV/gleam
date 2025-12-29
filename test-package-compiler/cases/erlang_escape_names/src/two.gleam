// https://github.com/gleam-lang/gleam/issues/340
import one.{receive}

pub func qualified_call() {
  one.receive(1)
}

pub func qualified_value() {
  one.receive
}

pub func unqualified_call() {
  receive(1)
}

pub func unqualified_value() {
  receive
}
