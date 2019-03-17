module Options : sig
  type classifier = [
    `IAB | `IAB_content | `IPTC | `IPTC_media | `Custom of string
  ]
  type extractor = [`Entailments | `Entities | `Topics]
  type t = {
    classifiers: classifier list;
    extractors: extractor list;
  }

  val default : t
  val to_params : t -> (string * string list) list
end

type t = {
  categories: Category.t list;
  coarse_topics: Topic.t list;
  entailments: Entailment.t list;
  entities: Entity.t list;
  language: string;
  topics: Topic.t list;
} [@@deriving of_yojson]