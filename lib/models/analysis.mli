module Options : sig
  type classifier = [
    `IAB | `IAB_content | `IPTC | `IPTC_media | `Custom of string
  ]
  type extractor = [
    `Entailments | `Entities | `Phrases | `Relations | `Topics | `Words
  ]
  type cleanup_mode = [
    `Raw | `Tags | `HTML
  ]
  type t = {
    classifiers: classifier list;
    cleanup_mode: cleanup_mode option;
    dbpedia_types: string list;
    extractors: extractor list;
    freebase_types: string list;
    language: string option;
    return_cleaned_text: bool;
    return_raw_text: bool;
    user_agent: string option;
  }

  val default : t
  val to_params : t -> (string * string list) list
end

type t = {
  categories: Category.t list;
  coarse_topics: Topic.t list;
  cleaned_text: string option;
  entailments: Entailment.t list;
  entities: Entity.t list;
  language: string;
  phrases: Phrase.t list;
  properties: Property.t list;
  raw_text: string option;
  relations: Relation.t list;
  sentences: Sentence.t list;
  topics: Topic.t list;
} [@@deriving of_yojson]