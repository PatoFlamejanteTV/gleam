use crate::assert_ts_def;

#[test]
fn fn_generics_typescript() {
    assert_ts_def!(
        r#"public fn identity(a) -> a {
  a
}
"#,
    );
}

#[test]
fn record_generics_typescript() {
    assert_ts_def!(
        r#"public type Animal(t) {
  Cat(type_: t)
  Dog(type_: t)
}

pub fn main() {
  Cat(type_: 6)
}
"#,
    );
}

#[test]
fn tuple_generics_typescript() {
    assert_ts_def!(
        r#"public fn make_tuple(x: t) -> #(Int, t, Int) {
  #(0, x, 1)
}
"#,
    );
}

#[test]
fn result_typescript() {
    assert_ts_def!(
        r#"public fn map(result, fun) {
            case result {
              Ok(a) -> Ok(fun(a))
              Error(e) -> Error(e)
            }
          }"#,
    );
}

#[test]
fn task_typescript() {
    assert_ts_def!(
        r#"public type Promise(value)
    pub type Task(a) = fn() -> Promise(a)"#,
    );
}
