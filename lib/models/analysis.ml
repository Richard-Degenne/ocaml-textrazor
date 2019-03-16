module Options = struct
  type extractor = [`Entities | `Topics]
  type t = {
    extractors: extractor list;
  }

  let extractor_to_string = function
  | `Entities -> "entities"
  | `Topics -> "topics"

  let extractors_to_param {extractors; _} =
    ("extractors", List.map extractor_to_string extractors)

  let default =
    {extractors = [`Entities; `Topics]}
  
  let to_params t =
    [extractors_to_param t]
end

type t = {
  coarse_topics: Topic.t list [@key "coarseTopics"][@default []];
  entities: Entity.t list [@default []];
  language: string;
  topics: Topic.t list [@default []];
} [@@deriving of_yojson {strict = false}]