// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{explorer} %s | %{FileCheck-strict} %s
// RUN: %{explorer-trace} %s | %{FileCheck-allow-unmatched} %s
// AUTOUPDATE: %{explorer} %s
// CHECK:STDOUT: result: 0

package ExplorerTest api;

interface X { fn F(); }
impl i32 as X { fn F() {} }

fn G[T:! X](v: T) -> Type {
  v.F();
  return i32;
}

fn Main() -> i32 {
  var v: G(0) = 0;
  return v;
}
