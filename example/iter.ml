open Prettier

let iter1 () =
	let start = text "Combining docs by iterating" in
	let ss = [ "foo"; "bar"; "baz" ] in
	let ds = List.map (fun s -> text s) ss in
	let d = List.fold_right (fun d r -> line <|> d <|> r) ds nil in
	print_endline (layout (start <|> d))

let iter2 () =
	let start = text "Combining docs using convenience funcs" in
	let ss = [ "foo"; "bar"; "baz" ] in
	let d = lfold (texts ss) in
	print_endline (layout (start <|> d))

let _ = iter1 (); iter2 ()
