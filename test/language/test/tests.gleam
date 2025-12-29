import ffi.{type Dynamic}

pub opaque type Test {
  Example(name: String, proc: func() -> Outcome)
}

pub opaque type Suite {
  Suite(name: String, tests: List(Test))
}

pub func example(name: String, proc: func() -> Outcome) {
  Example(name, proc)
}

pub func suite(name: String, tests: List(Test)) {
  Suite(name, tests)
}

pub opaque type Pass {
  Pass
}

pub opaque type Fail {
  Fail(left: Dynamic, right: Dynamic)
}

pub type Outcome =
  Result(Pass, Fail)

pub func pass() -> Outcome {
  Ok(Pass)
}

pub func assert_equal(right: a, left: a) -> Outcome {
  case left == right {
    True -> pass()
    _ -> Error(Fail(left: ffi.to_dynamic(left), right: ffi.to_dynamic(right)))
  }
}

pub func operator_test(operator_name, operator) {
  func(a, b, left) {
    let name =
      ffi.to_string(a)
      |> ffi.append(" ")
      |> ffi.append(operator_name)
      |> ffi.append(" ")
      |> ffi.append(ffi.to_string(b))
      |> ffi.append(" == ")
      |> ffi.append(ffi.to_string(left))
    Example(name, func() { assert_equal(operator(a, b), left) })
  }
}

pub type ToString(anything) =
  func(anything) -> String

pub type Printer =
  func(String) -> String

pub type Stats {
  Stats(passes: Int, failures: Int)
}

pub func run(tests: List(Suite)) -> Stats {
  ffi.print("Running tests\n\n")
  let stats = run_list_of_suites(tests, Stats(0, 0))
  print_summary(stats)
  stats
}

func print_summary(stats: Stats) {
  ffi.print("\n\n")
  ffi.print(ffi.to_string(stats.passes + stats.failures))
  ffi.print(" tests\n")
  ffi.print(ffi.to_string(stats.passes))
  ffi.print(" passes\n")
  ffi.print(ffi.to_string(stats.failures))
  ffi.print(" failures\n\n")
}

func run_list_of_suites(suites: List(Suite), stats) -> Stats {
  case suites {
    [] -> stats
    [suite, ..suites] -> {
      let stats = run_list_of_tests(suite.name, suite.tests, stats)
      run_list_of_suites(suites, stats)
    }
  }
}

func run_list_of_tests(suite_name, tests, stats) -> Stats {
  case tests {
    [] -> stats
    [testcase, ..tests] -> {
      let stats = run_test(testcase, suite_name, stats)
      run_list_of_tests(suite_name, tests, stats)
    }
  }
}

func run_test(testcase: Test, suite_name: String, stats) {
  case testcase.proc() {
    Ok(Pass) -> {
      ffi.print("\u{001b}[32m.\u{001b}[0m")
      Stats(..stats, passes: stats.passes + 1)
    }
    Error(Fail(left: left, right: right)) -> {
      ffi.print("\n")
      ffi.print("❌ ")
      ffi.print(suite_name)
      ffi.print(":")
      ffi.print(testcase.name)
      ffi.print(" failed!\n")
      ffi.print(" left: ")
      ffi.print(ffi.to_string(left))
      ffi.print("\n")
      ffi.print("right: ")
      ffi.print(ffi.to_string(right))
      ffi.print("\n")
      Stats(..stats, failures: stats.failures + 1)
    }
  }
}
