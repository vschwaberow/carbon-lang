// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{carbon} dump parse-tree %s | %{FileCheck-strict} %s
// AUTOUPDATE: %{carbon} dump parse-tree %s
// CHECK:STDOUT: [
// CHECK:STDOUT: {node_index: 11, kind: 'FunctionDeclaration', text: 'fn', subtree_size: 12, children: [
// CHECK:STDOUT:   {node_index: 0, kind: 'DeclaredName', text: 'foo'},
// CHECK:STDOUT:   {node_index: 9, kind: 'ParameterList', text: '(', subtree_size: 9, children: [
// CHECK:STDOUT:     {node_index: 3, kind: 'PatternBinding', text: ':', subtree_size: 3, children: [
// CHECK:STDOUT:       {node_index: 1, kind: 'DeclaredName', text: 'bar'},
// CHECK:STDOUT:       {node_index: 2, kind: 'Literal', text: 'i32'}]},
// CHECK:STDOUT:     {node_index: 4, kind: 'ParameterListComma', text: ','},
// CHECK:STDOUT:     {node_index: 7, kind: 'PatternBinding', text: ':', subtree_size: 3, children: [
// CHECK:STDOUT:       {node_index: 5, kind: 'DeclaredName', text: 'baz'},
// CHECK:STDOUT:       {node_index: 6, kind: 'Literal', text: 'i32'}]},
// CHECK:STDOUT:     {node_index: 8, kind: 'ParameterListEnd', text: ')'}]},
// CHECK:STDOUT:   {node_index: 10, kind: 'DeclarationEnd', text: ';'}]},
// CHECK:STDOUT: {node_index: 12, kind: 'FileEnd', text: ''},
// CHECK:STDOUT: ]

fn foo(bar: i32, baz: i32);
