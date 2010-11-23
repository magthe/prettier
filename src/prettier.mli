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
(** Implementation of Wadler's prettier printer.
	This implementation is basically a translation to OCaml based on the code
	found in Philip Wadler's paper "A prettier printer" (see below).  It only
	implements the simple pretty printer found in section 1 of the paper.

	@author Magnus Therning
	@see <http://homepages.inf.ed.ac.uk/wadler/papers/prettier/prettier.pdf> A prettier printer, P. Wadler
 *)

(** {2 Types} *)
(** The type of a document. *)
type pdoc

(** {2 Basic constructors} *)
(** The empty document *)
val nil : pdoc

(** Construct a document containing a string *)
val text : string -> pdoc

(** A document containing a line break *)
val line : pdoc

(** Combine two documents *)
val concat : pdoc -> pdoc -> pdoc

(** Short for {!concat} *)
val ( <|> ) : pdoc -> pdoc -> pdoc

(** Nest a document with indentation
	@param indent The level of indentation
	@param doc The document
	@return An indented document
 *)
val nest : int -> pdoc -> pdoc

(** Convert a document to a string *)
val layout : pdoc -> string
