// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{not} %{explorer} %s | %{FileCheck-strict} %s
// RUN: %{not} %{explorer-trace} %s | %{FileCheck-allow-unmatched} %s
// AUTOUPDATE: %{explorer} %s

package ExplorerTest api;

fn A(n: i32) -> i32 {
  match (n) {
    case 1 => { return 1; }
    // CHECK:STDERR: COMPILATION ERROR: {{.*}}/explorer/testdata/match/fail_redundant_int.carbon:[[@LINE+1]]: unreachable case: all values matched by this case are matched by earlier cases
    case 1 => { return 2; }
    case (_: i32) => { return 3; }
  }
}

fn Main() -> i32 {
  return A(1);
}
