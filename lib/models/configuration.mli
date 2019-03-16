type t = {
  secure: bool;
  use_eu_endpoint: bool
}

val create : ?secure:bool -> ?use_eu_endpoint:bool -> unit -> t

val url: t -> ?path:string -> ?query:(string * string list) list -> unit -> Uri.t