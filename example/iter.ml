open Prettier

let _ =
	let start = text "Example of combinating docs by iterating" in
	let ss = [ "foo"; "bar"; "baz" ] in
	let ds = List.map (fun s -> text s) ss in
	let d = List.fold_right (fun d r -> line <|> d <|> r) ds nil in
	print_endline (layout (start <|> d))
