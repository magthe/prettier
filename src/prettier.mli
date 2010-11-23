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
