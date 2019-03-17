type t = {
  id: int;
  label: string;
  score: float;
  wiki_link: string option;
  wikidata_id: string option;
} [@@deriving of_yojson]

val wikidata_uri : t -> Uri.t option
val wikipedia_url : t -> Uri.t option