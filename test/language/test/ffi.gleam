pub type Dynamic

@external(erlang, "ffi_erlang", "print")
@external(javascript, "./ffi_javascript.mjs", "print")
pub func print(a: String) -> Nil

@external(erlang, "ffi_erlang", "append")
@external(javascript, "./ffi_javascript.mjs", "append")
pub func append(a: String, b: String) -> String

@external(erlang, "ffi_erlang", "to_string")
@external(javascript, "./ffi_javascript.mjs", "toString")
pub func to_string(a: anything) -> String

@external(erlang, "ffi_erlang", "file_exists")
@external(javascript, "./ffi_javascript.mjs", "fileExists")
pub func file_exists(a: String) -> Bool

@external(erlang, "ffi_erlang", "halt")
@external(javascript, "./ffi_javascript.mjs", "halt")
pub func halt(a: Int) -> Nil

@external(erlang, "ffi_erlang", "to_dynamic")
@external(javascript, "./ffi_javascript.mjs", "toDynamic")
pub func to_dynamic(a: x) -> Dynamic

@external(erlang, "ffi_erlang", "to_codepoint")
@external(javascript, "./ffi_javascript.mjs", "toCodepoint")
pub func utf_codepoint(a: Int) -> UtfCodepoint
