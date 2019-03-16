type t = {
  confidence_score: float;
  ending_pos: int;
  entity_id: string;
  freebase_id: string option;
  freebase_types: string list;
  id: int;
  matched_text: string;
  matching_tokens: int list;
  relevance_score: float;
  starting_pos: int;
  types: string list;
  wiki_link: string option;
  wikidata_id: string option;
} [@@deriving of_yojson]

val wikidata_uri : t -> Uri.t option
val freebase_uri : t -> Uri.t option
val wikipedia_url : t -> Uri.t option