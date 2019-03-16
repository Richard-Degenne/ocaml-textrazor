val get : Uri.t -> string -> (Yojson.Safe.json, string) result
val post_form : Uri.t -> ?params:(string * string list) list ->  string -> (Yojson.Safe.json, string) result