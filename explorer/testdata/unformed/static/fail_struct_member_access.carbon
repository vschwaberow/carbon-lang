// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{not} %{explorer} %s | %{FileCheck-strict} %s
// RUN: %{not} %{explorer-trace} %s | %{FileCheck-allow-unmatched} %s
// AUTOUPDATE: %{explorer} %s

package ExplorerTest api;

fn Main() -> i32 {
  var p: {.x: i32, .y: i32};
  // CHECK:STDERR: COMPILATION ERROR: {{.*}}/explorer/testdata/unformed/static/fail_struct_member_access.carbon:[[@LINE+1]]: use of uninitialized variable p
  p.x = p.y;
  return 0;
}
