use super::*;

#[test]
fn module_name_validation() {
    assert!(validate_module_name(&"dream".into()).is_ok());

    assert!(validate_module_name(&"gleam".into()).is_err());

    assert!(validate_module_name(&"gleam/ok".into()).is_ok());

    assert!(validate_module_name(&"ok/gleam".into()).is_ok());

    assert!(validate_module_name(&"type".into()).is_err());

    assert!(validate_module_name(&"public".into()).is_err());

    assert!(validate_module_name(&"ok/type".into()).is_err());

    assert!(validate_module_name(&"ok/public".into()).is_err());
}
