// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{explorer} %s | %{FileCheck-strict} %s
// RUN: %{explorer-trace} %s | %{FileCheck-allow-unmatched} %s
// AUTOUPDATE: %{explorer} %s
// CHECK:STDOUT: Interface: 2
// CHECK:STDOUT: Op: 2
// CHECK:STDOUT: result: 0

package ExplorerTest api;

fn Main() -> i32 {
  var lhs: i32 = 8;
  var rhs: i32 = 3;
  // Make sure that both the interface and operator work with i32. These rely on
  // builtin arithmetic more directly.
  Print("Interface: {0}", lhs.(DivWith(i32).Op)(rhs));
  Print("Op: {0}", lhs / rhs);
  return 0;
}
