type pdoc

val nil : pdoc
val text : string -> pdoc
val line : pdoc
val concat : pdoc -> pdoc -> pdoc
val nest : int -> pdoc -> pdoc
val layout : pdoc -> string
val ( <|> ) : pdoc -> pdoc -> pdoc
