open OUnit2
open Syntax

let unannotated_syntax_tests = "test suite for unannotated syntax" >::: [
    "free_tvars"  >::
    (fun _ -> assert_equal ["'Y"; "'X"]
                           (free_tvars (FunType ((TypeVar "'X"), (TypeVar "'Y")))));
    "subst_types_in_type"  >::
    (fun _ -> assert_equal (TypeVar "'X")
                            (subst_types_in_type ["'X", TypeVar "'Y"; "'Y", TypeVar "'X"] (TypeVar "'X")));
  ]

let syntax_tests = "syntax_tests" >::: [unannotated_syntax_tests]
