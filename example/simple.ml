open Prettier

let basic () =
	print_endline "Using the basic constructors:";
	let i1 = text "Item 1" <|> (nest 2 (line <|> text "Item 1.1")) in
	let i2 = line <|> text "Item 2" in
	let i3_2 = line <|> text "Item 3.2" <|> (nest 2 (line <|> text "Item 3.2.1")) in
	let i3 = line <|> text "Item 3" <|> (nest 2 (line <|> text "Item 3.1" <|> i3_2)) in
	let i4 = line <|> text "Item 4" <|> line in
	let i = i1 <|> i2 <|> i3 <|> i4 in
	print_string (layout i)

let convenient () =
	let head = textl "Using the convenience functions" in
	let i1 = text "Item 1" <|> (nest 2 (ltext "Item 1.1")) in
	let i2 = ltext "Item 2" in
	let i3_2 = ltext "Item 3.2" <|> (nest 2 (ltext "Item 3.2.1")) in
	let i3 = ltext "Item 3" <|> (nest 2 (fold [ltext "Item 3.1"; i3_2])) in
	let i4 = ltext "Item 4" in
	let i = fold [head; i1; i2; i3; i4]  in
	print_endline (layout i)

let convenient2 () =
	let head = text "Using the convenience functions again" in
	let i1 = text "Item 1" <|> (nest 2 (ltext "Item 1.1")) in
	let i2 = text "Item 2" in
	let i3_2 = text "Item 3.2" <|> (nest 2 (ltext "Item 3.2.1")) in
	let i3 = text "Item 3" <|> (nest 2 (lfold [text "Item 3.1"; i3_2])) in
	let i4 = text "Item 4" in
	let i = lfold [head; i1; i2; i3; i4]  in
	print_endline (layout i)

let _ = basic (); convenient (); convenient2 ()
