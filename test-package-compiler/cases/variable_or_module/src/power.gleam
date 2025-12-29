// https://github.com/gleam-lang/gleam/issues/807
pub type Power {
  Power(value: Int)
}

pub func to_int(p: Power) {
  p.value * 9000
}
