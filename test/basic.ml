open OUnit
open Prettier

let tst_text =
	let s1 = "foo" in
	let s2 = "bar" in
	assert_equal (layout (text s1 <|> text s2)) (layout (text (s1 ^ s2)));
	assert_equal (layout (text "")) ""

let tst_nest =
	let s1 = "foo" in
	let d1 = line <|> text "bar" in
	let d2 = line <|> text "baz" in
	let i = 4 in
	let j = 5 in
	assert_equal (layout (nest 0 d1)) (layout d1);
	assert_equal (layout (nest i nil)) (layout nil);
	assert_equal (layout (nest i (text s1))) (layout (text s1));
	assert_equal (layout (nest (i + j) d1)) (layout (nest i (nest j d1)));
	assert_equal (layout (nest i (d1 <|> d2))) (layout ((nest i d1) <|> (nest i d2)))

let tst_layout =
	let s1 = "foo" in
	let d1 = line <|> text "bar" in
	let d2 = line <|> text "baz" in
	let i = 4 in
	assert_equal (layout nil) "";
	assert_equal (layout (text s1)) s1;
	assert_equal (layout (nest i line)) ("\n" ^ String.make i ' ');
	assert_equal (layout (d1 <|> d2)) ((layout d1) ^ (layout d2))

let test_fixture = "Basic tests" >:::
	[ "text" >:: (fun () -> tst_text )
	; "nest" >:: (fun () -> tst_nest )
	; "layout" >:: (fun () -> tst_layout)
	]

let _ = run_test_tt ~verbose:true test_fixture
