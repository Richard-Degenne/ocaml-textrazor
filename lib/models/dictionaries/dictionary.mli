type t = {
  id: string;
  language: string;
  match_type: string;
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
