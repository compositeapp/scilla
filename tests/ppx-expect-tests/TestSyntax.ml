open Base
open Syntax

let%expect_test _ =
  let actual = free_tvars (FunType ((TypeVar "'X"), (TypeVar "'Y"))) in
  [%sexp_of: string list] actual |> Sexp.to_string_hum |> Stdio.print_endline;
  [%expect {| ('Y 'X) |}]

let%expect_test _ =
   let actual = subst_types_in_type ["'X", TypeVar "'Y"; "'Y", TypeVar "'X"] (TypeVar "'X") in
   [%sexp_of: typ] actual |> Sexp.to_string_hum |> Stdio.print_endline;
   [%expect {| (TypeVar 'X) |}]

