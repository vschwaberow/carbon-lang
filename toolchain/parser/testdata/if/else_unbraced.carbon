// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{carbon} dump parse-tree %s | %{FileCheck-strict} %s
// AUTOUPDATE: %{carbon} dump parse-tree %s
// CHECK:STDOUT: [
// CHECK:STDOUT: {node_index: 52, kind: 'FunctionDeclaration', text: 'fn', subtree_size: 53, children: [
// CHECK:STDOUT:   {node_index: 0, kind: 'DeclaredName', text: 'F'},
// CHECK:STDOUT:   {node_index: 2, kind: 'ParameterList', text: '(', subtree_size: 2, children: [
// CHECK:STDOUT:     {node_index: 1, kind: 'ParameterListEnd', text: ')'}]},
// CHECK:STDOUT:   {node_index: 51, kind: 'CodeBlock', text: '{', subtree_size: 49, children: [
// CHECK:STDOUT:     {node_index: 18, kind: 'IfStatement', text: 'if', subtree_size: 16, children: [
// CHECK:STDOUT:       {node_index: 5, kind: 'Condition', text: '(', subtree_size: 3, children: [
// CHECK:STDOUT:         {node_index: 3, kind: 'NameReference', text: 'a'},
// CHECK:STDOUT:         {node_index: 4, kind: 'ConditionEnd', text: ')'}]},
// CHECK:STDOUT:       {node_index: 14, kind: 'IfStatement', text: 'if', subtree_size: 9, children: [
// CHECK:STDOUT:         {node_index: 8, kind: 'Condition', text: '(', subtree_size: 3, children: [
// CHECK:STDOUT:           {node_index: 6, kind: 'NameReference', text: 'b'},
// CHECK:STDOUT:           {node_index: 7, kind: 'ConditionEnd', text: ')'}]},
// CHECK:STDOUT:         {node_index: 10, kind: 'ExpressionStatement', text: ';', subtree_size: 2, children: [
// CHECK:STDOUT:           {node_index: 9, kind: 'NameReference', text: 'c'}]},
// CHECK:STDOUT:         {node_index: 11, kind: 'IfStatementElse', text: 'else'},
// CHECK:STDOUT:         {node_index: 13, kind: 'ExpressionStatement', text: ';', subtree_size: 2, children: [
// CHECK:STDOUT:           {node_index: 12, kind: 'NameReference', text: 'd'}]}]},
// CHECK:STDOUT:       {node_index: 15, kind: 'IfStatementElse', text: 'else'},
// CHECK:STDOUT:       {node_index: 17, kind: 'ExpressionStatement', text: ';', subtree_size: 2, children: [
// CHECK:STDOUT:         {node_index: 16, kind: 'NameReference', text: 'e'}]}]},
// CHECK:STDOUT:     {node_index: 49, kind: 'IfStatement', text: 'if', subtree_size: 31, children: [
// CHECK:STDOUT:       {node_index: 21, kind: 'Condition', text: '(', subtree_size: 3, children: [
// CHECK:STDOUT:         {node_index: 19, kind: 'NameReference', text: 'x'},
// CHECK:STDOUT:         {node_index: 20, kind: 'ConditionEnd', text: ')'}]},
// CHECK:STDOUT:       {node_index: 28, kind: 'CodeBlock', text: '{', subtree_size: 7, children: [
// CHECK:STDOUT:         {node_index: 26, kind: 'ExpressionStatement', text: ';', subtree_size: 5, children: [
// CHECK:STDOUT:           {node_index: 25, kind: 'CallExpression', text: '(', subtree_size: 4, children: [
// CHECK:STDOUT:             {node_index: 22, kind: 'NameReference', text: 'G'},
// CHECK:STDOUT:             {node_index: 23, kind: 'Literal', text: '1'},
// CHECK:STDOUT:             {node_index: 24, kind: 'CallExpressionEnd', text: ')'}]}]},
// CHECK:STDOUT:         {node_index: 27, kind: 'CodeBlockEnd', text: '}'}]},
// CHECK:STDOUT:       {node_index: 29, kind: 'IfStatementElse', text: 'else'},
// CHECK:STDOUT:       {node_index: 48, kind: 'IfStatement', text: 'if', subtree_size: 19, children: [
// CHECK:STDOUT:         {node_index: 32, kind: 'Condition', text: '(', subtree_size: 3, children: [
// CHECK:STDOUT:           {node_index: 30, kind: 'NameReference', text: 'x'},
// CHECK:STDOUT:           {node_index: 31, kind: 'ConditionEnd', text: ')'}]},
// CHECK:STDOUT:         {node_index: 39, kind: 'CodeBlock', text: '{', subtree_size: 7, children: [
// CHECK:STDOUT:           {node_index: 37, kind: 'ExpressionStatement', text: ';', subtree_size: 5, children: [
// CHECK:STDOUT:             {node_index: 36, kind: 'CallExpression', text: '(', subtree_size: 4, children: [
// CHECK:STDOUT:               {node_index: 33, kind: 'NameReference', text: 'G'},
// CHECK:STDOUT:               {node_index: 34, kind: 'Literal', text: '2'},
// CHECK:STDOUT:               {node_index: 35, kind: 'CallExpressionEnd', text: ')'}]}]},
// CHECK:STDOUT:           {node_index: 38, kind: 'CodeBlockEnd', text: '}'}]},
// CHECK:STDOUT:         {node_index: 40, kind: 'IfStatementElse', text: 'else'},
// CHECK:STDOUT:         {node_index: 47, kind: 'CodeBlock', text: '{', subtree_size: 7, children: [
// CHECK:STDOUT:           {node_index: 45, kind: 'ExpressionStatement', text: ';', subtree_size: 5, children: [
// CHECK:STDOUT:             {node_index: 44, kind: 'CallExpression', text: '(', subtree_size: 4, children: [
// CHECK:STDOUT:               {node_index: 41, kind: 'NameReference', text: 'G'},
// CHECK:STDOUT:               {node_index: 42, kind: 'Literal', text: '3'},
// CHECK:STDOUT:               {node_index: 43, kind: 'CallExpressionEnd', text: ')'}]}]},
// CHECK:STDOUT:           {node_index: 46, kind: 'CodeBlockEnd', text: '}'}]}]}]},
// CHECK:STDOUT:     {node_index: 50, kind: 'CodeBlockEnd', text: '}'}]}]},
// CHECK:STDOUT: {node_index: 53, kind: 'FileEnd', text: ''},
// CHECK:STDOUT: ]

fn F() {
  if (a)
    // CHECK:STDERR: {{.*}}/toolchain/parser/testdata/if/else_unbraced.carbon:[[@LINE+1]]:5: Expected braced code block.
    if (b)
      // CHECK:STDERR: {{.*}}/toolchain/parser/testdata/if/else_unbraced.carbon:[[@LINE+1]]:7: Expected braced code block.
      c;
    else
      // CHECK:STDERR: {{.*}}/toolchain/parser/testdata/if/else_unbraced.carbon:[[@LINE+1]]:7: Expected braced code block.
      d;
  else
    // CHECK:STDERR: {{.*}}/toolchain/parser/testdata/if/else_unbraced.carbon:[[@LINE+1]]:5: Expected braced code block.
    e;
  if (x) { G(1); }
  else if (x) { G(2); }
  else { G(3); }
}
