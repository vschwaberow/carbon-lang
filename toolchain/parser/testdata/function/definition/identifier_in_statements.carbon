// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{not} %{carbon} dump parse-tree %s | %{FileCheck-strict} %s
// AUTOUPDATE: %{carbon} dump parse-tree %s
// CHECK:STDOUT: [
// CHECK:STDOUT: {node_index: 6, kind: 'FunctionDeclaration', text: 'fn', subtree_size: 7, children: [
// CHECK:STDOUT:   {node_index: 0, kind: 'DeclaredName', text: 'F'},
// CHECK:STDOUT:   {node_index: 2, kind: 'ParameterList', text: '(', subtree_size: 2, children: [
// CHECK:STDOUT:     {node_index: 1, kind: 'ParameterListEnd', text: ')'}]},
// CHECK:STDOUT:   {node_index: 5, kind: 'CodeBlock', text: '{', has_error: yes, subtree_size: 3, children: [
// CHECK:STDOUT:     {node_index: 3, kind: 'NameReference', text: 'bar'},
// CHECK:STDOUT:     {node_index: 4, kind: 'CodeBlockEnd', text: '}'}]}]},
// CHECK:STDOUT: {node_index: 7, kind: 'FileEnd', text: ''},
// CHECK:STDOUT: ]

fn F() {
  // Note: this might become valid depending on the expression syntax. This test
  // shouldn't be taken as a sign it should remain invalid.
  bar
// CHECK:STDERR: {{.*}}/toolchain/parser/testdata/function/definition/identifier_in_statements.carbon:[[@LINE+1]]:1: Expected `;` after expression.
}
