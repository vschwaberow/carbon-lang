// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{explorer} %s | %{FileCheck-strict} %s
// RUN: %{explorer-trace} %s | %{FileCheck-allow-unmatched} %s
// AUTOUPDATE: %{explorer} %s
// CHECK:STDOUT: result: 3

package ExplorerTest api;

// Test access to block-scoped variables upon resuming a continuation.

fn Main() -> i32 {
  var y: i32 = 0;
  __continuation k {
    var x: i32 = 0;
    x = x + 1;
    __await;
    x = x + 2;
    y = x;
  }
  __run k;
  __run k;
  return y;
}
