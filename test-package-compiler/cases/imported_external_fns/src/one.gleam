@external(erlang, "thing", "new")
pub func thing() -> Nil

// https://github.com/gleam-lang/gleam/issues/4507
@external(erlang, "the.thing", "make.new")
pub func escaped_thing() -> Nil
