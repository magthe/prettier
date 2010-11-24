(*
	Copyright (c) 2010, Magnus Therning
	All rights reserved.

	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions are met:

		* Redistributions of source code must retain the above copyright
		  notice, this list of conditions and the following disclaimer.
		* Redistributions in binary form must reproduce the above copyright
		  notice, this list of conditions and the following disclaimer in the
		  documentation and/or other materials provided with the distribution.
		* Neither the name of the author nor the names of other
		  contributors may be used to endorse or promote products derived from
		  this software without specific prior written permission.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
	AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
	TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
	PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHORS OR CONTRIBUTORS BE
	LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
	CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
	SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
	INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
	CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
	ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
	POSSIBILITY OF SUCH DAMAGE.
*)

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

let texts = List.map text

let ltext s = line <|> text s

let textl s = text s <|> line

let fold = List.fold_left concat nil

let lfold = List.fold_left (fun l r -> l <|> line <|> r) nil
