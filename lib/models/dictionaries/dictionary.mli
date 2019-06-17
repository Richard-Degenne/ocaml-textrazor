type match_type = [`Token | `Stem]
type t = {
  id: string;
  language: string;
  match_type: match_type;
  case_insensitive: bool;
} [@@deriving of_yojson]

(** Lists dictionaries from your TextRazor account.

    @param client
*)
val list : Client.t -> (t list, string) result

(** Gets a dictionary from your TextRazor account.

    @param id Identifier of the dictionary
    @param client
*)
val get : string -> Client.t -> (t, string) result

(** Creates a dictionary on your TextRazor account.

    @param t
    @param client
*)
val create : t -> Client.t -> (bool, string) result

(** Deletes a dictionary from your TextRazor account.

    @param id Identifier of the dictionary
    @param client
*)
val delete : string -> Client.t -> (bool, string) result
