// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{explorer} %s | %{FileCheck-strict} %s
// RUN: %{explorer-trace} %s | %{FileCheck-allow-unmatched} %s
// AUTOUPDATE: %{explorer} %s
// CHECK:STDOUT: result: 0

package ExplorerTest api;

// Demonstrate the aliasing behavior of pointers.

fn Main() -> i32 {
  var p: i32* = heap.New(5);
  var q: i32* = p;
  *q = 0;
  return *p;
}
