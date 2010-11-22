type pdoc = PNil | PText of string * pdoc | PLine of int * pdoc

let nil = PNil
let text s = PText (s, PNil)
let line = PLine (0, PNil)

let rec concat l r = match l with
	| PNil -> r
	| PText (s, d) -> PText (s, concat d r)
	| PLine (i, d) -> PLine (i, concat d r)

let (<|>) = concat

let rec nest i d = match d with
	| PNil -> PNil
	| PText (s, e) -> PText (s, nest i e)
	| PLine (j, e) -> PLine (i + j, nest i e)

let rec layout d = match d with
	| PNil -> ""
	| PText (s, e) -> s ^ layout e
	| PLine (i, e) -> "\n" ^ (String.make i ' ') ^ (layout e)
