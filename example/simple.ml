(* a simple example *)

open Prettier

let _ =
	print_endline "A simple little example:";
	let i1 = text "Item 1" <|> (nest 2 (line <|> text "Item 1.1")) in
	let i2 = line <|> text "Item 2" in
	let i3_2 = line <|> text "Item 3.2" <|> (nest 2 (line <|> text "Item 3.2.1")) in
	let i3 = line <|> text "Item 3" <|> (nest 2 (line <|> text "Item 3.1" <|> i3_2)) in
	let i4 = line <|> text "Item 4" <|> line in
	let i = i1 <|> i2 <|> i3 <|> i4 in
	print_string (layout i)
