module Options = struct
  type classifier = [
    `IAB | `IAB_content | `IPTC | `IPTC_media | `Custom of string
  ]
  type extractor = [`Entailments | `Entities | `Relations | `Topics | `Words]
  type t = {
    classifiers: classifier list;
    extractors: extractor list;
  }

  let extractor_to_string = function
  | `Entailments -> "entailments"
  | `Entities -> "entities"
  | `Relations -> "relations"
  | `Topics -> "topics"
  | `Words -> "words"

  let classifier_to_string = function
  | `IAB -> "textrazor_iab"
  | `IAB_content -> "textrazor_iab_content_taxonomy"
  | `IPTC -> "textrazor_newscodes"
  | `IPTC_media -> "textrazor_mediatopics"
  | `Custom s -> s

  let extractors_to_param {extractors; _} =
    ("extractors", List.map extractor_to_string extractors)

  let classifiers_to_param {classifiers; _} =
  ("classifiers", List.map classifier_to_string classifiers)

  let default =
    {
      extractors = [`Entailments; `Entities; `Relations; `Topics; `Words];
      classifiers = [];
    }
  
  let to_params t =
    List.filter
      (fun (_,v) -> v != [])
      [extractors_to_param t; classifiers_to_param t]
end

type t = {
  categories: Category.t list [@default []];
  coarse_topics: Topic.t list [@key "coarseTopics"][@default []];
  entailments: Entailment.t list [@default []];
  entities: Entity.t list [@default []];
  language: string;
  relations: Relation.t list [@default []];
  sentences: Sentence.t list [@default []];
  topics: Topic.t list [@default []];
} [@@deriving of_yojson {strict = false}]