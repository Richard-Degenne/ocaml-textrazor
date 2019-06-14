type t = {
  id: string;
  language: string;
  match_type: string;
  case_insensitive: bool;
} [@@deriving of_yojson]

val list : Client.t -> (t list, string) result
