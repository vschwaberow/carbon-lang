// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{carbon} dump parse-tree %s | %{FileCheck-strict} %s
// AUTOUPDATE: %{carbon} dump parse-tree %s
// CHECK:STDOUT: [
// CHECK:STDOUT: {node_index: 25, kind: 'FunctionDeclaration', text: 'fn', subtree_size: 26, children: [
// CHECK:STDOUT:   {node_index: 0, kind: 'DeclaredName', text: 'F'},
// CHECK:STDOUT:   {node_index: 2, kind: 'ParameterList', text: '(', subtree_size: 2, children: [
// CHECK:STDOUT:     {node_index: 1, kind: 'ParameterListEnd', text: ')'}]},
// CHECK:STDOUT:   {node_index: 24, kind: 'CodeBlock', text: '{', subtree_size: 22, children: [
// CHECK:STDOUT:     {node_index: 22, kind: 'IfStatement', text: 'if', subtree_size: 20, children: [
// CHECK:STDOUT:       {node_index: 5, kind: 'Condition', text: '(', subtree_size: 3, children: [
// CHECK:STDOUT:         {node_index: 3, kind: 'NameReference', text: 'a'},
// CHECK:STDOUT:         {node_index: 4, kind: 'ConditionEnd', text: ')'}]},
// CHECK:STDOUT:       {node_index: 21, kind: 'CodeBlock', text: '{', subtree_size: 16, children: [
// CHECK:STDOUT:         {node_index: 19, kind: 'IfStatement', text: 'if', subtree_size: 14, children: [
// CHECK:STDOUT:           {node_index: 8, kind: 'Condition', text: '(', subtree_size: 3, children: [
// CHECK:STDOUT:             {node_index: 6, kind: 'NameReference', text: 'b'},
// CHECK:STDOUT:             {node_index: 7, kind: 'ConditionEnd', text: ')'}]},
// CHECK:STDOUT:           {node_index: 18, kind: 'CodeBlock', text: '{', subtree_size: 10, children: [
// CHECK:STDOUT:             {node_index: 16, kind: 'IfStatement', text: 'if', subtree_size: 8, children: [
// CHECK:STDOUT:               {node_index: 11, kind: 'Condition', text: '(', subtree_size: 3, children: [
// CHECK:STDOUT:                 {node_index: 9, kind: 'NameReference', text: 'c'},
// CHECK:STDOUT:                 {node_index: 10, kind: 'ConditionEnd', text: ')'}]},
// CHECK:STDOUT:               {node_index: 15, kind: 'CodeBlock', text: '{', subtree_size: 4, children: [
// CHECK:STDOUT:                 {node_index: 13, kind: 'ExpressionStatement', text: ';', subtree_size: 2, children: [
// CHECK:STDOUT:                   {node_index: 12, kind: 'NameReference', text: 'd'}]},
// CHECK:STDOUT:                 {node_index: 14, kind: 'CodeBlockEnd', text: '}'}]}]},
// CHECK:STDOUT:             {node_index: 17, kind: 'CodeBlockEnd', text: '}'}]}]},
// CHECK:STDOUT:         {node_index: 20, kind: 'CodeBlockEnd', text: '}'}]}]},
// CHECK:STDOUT:     {node_index: 23, kind: 'CodeBlockEnd', text: '}'}]}]},
// CHECK:STDOUT: {node_index: 26, kind: 'FileEnd', text: ''},
// CHECK:STDOUT: ]

fn F() {
  if (a) {
    if (b) {
      if (c) {
        d;
      }
    }
  }
}
