// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{not} %{carbon} dump parse-tree %s | %{FileCheck-strict} %s
// AUTOUPDATE: %{carbon} dump parse-tree %s
// CHECK:STDOUT: [
// CHECK:STDOUT: {node_index: 2, kind: 'FunctionDeclaration', text: 'fn', has_error: yes, subtree_size: 3, children: [
// CHECK:STDOUT:   {node_index: 0, kind: 'DeclaredName', text: 'foo'},
// CHECK:STDOUT:   {node_index: 1, kind: 'DeclarationEnd', text: ';'}]},
// CHECK:STDOUT: {node_index: 3, kind: 'FileEnd', text: ''},
// CHECK:STDOUT: ]

// CHECK:STDERR: {{.*}}/toolchain/parser/testdata/function/declaration/identifier_instead_of_sig.carbon:[[@LINE+1]]:8: Expected `(` after function name.
fn foo bar;
