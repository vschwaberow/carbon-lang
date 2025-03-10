// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{explorer} %s | %{FileCheck-strict} %s
// RUN: %{explorer-trace} %s | %{FileCheck-allow-unmatched} %s
// AUTOUPDATE: %{explorer} %s
// CHECK:STDOUT: result: 12

package ExplorerTest api;

interface SwizzleWith(T:! Type) {
  fn Op[me: Self](x: T) -> i32;
}

// TODO: There should be some way to write this that includes
// `SwizzleWith(.Self)` in the list of lookup contexts.
alias Swizzle = Type where .Self is SwizzleWith(.Self);

impl i32 as SwizzleWith(i32) {
  fn Op[me: Self](x: Self) -> Self { return me * 10 + x; }
}

fn F[T:! Swizzle](v: T, w: T) -> i32 {
  return v.(SwizzleWith(T).Op)(w);
}

fn Main() -> i32 {
  var one: i32 = 1;
  var two: i32 = 2;
  return F(one, two);
}
