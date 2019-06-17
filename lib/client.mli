(** Data structure for clients. *)
type t = {
  api_key: string;
  secure: bool;
  use_eu_endpoint: bool
}
type response = (Yojson.Safe.json, string) result

(** Creates a new client.

    @param secure Whether to use HTTPS. Defaults to [true].
    @param use_eu_endpoint Whether to use TextRazor's Europe API endpoint. Defaults to [false].
    @param api_key API key to use for requests
*)
val create : ?secure:bool -> ?use_eu_endpoint:bool -> string -> t

(** Performs a GET request against the given path.

    @param path
    @param t
*)
val get : string -> t -> response

(** Performs a POST request against the given path.

    @param path
    @param params
    @param t
*)
val post_form : string -> ?params:(string * string list) list -> t -> response

(** Performs a PUT request against the given path.

    @param path
    @param body
    @param t
 *)
 val put : string -> body: string -> t -> response

(** Performs a DELETE request against the given path.

    @param path
    @param t
*)
val delete : string -> t -> response
