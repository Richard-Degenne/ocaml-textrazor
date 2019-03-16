module Options = struct
  type extractor = [`Entities]
  type t = {
    extractors: extractor list;
  }

  let extractor_to_string = function
  | `Entities -> "entities"

  let extractors_to_param {extractors; _} =
    ("extractors", List.map extractor_to_string extractors)

  let default =
    {extractors = [`Entities]}
  
  let to_params t =
    [extractors_to_param t]
end

type t = {
  entities: Entity.t list [@default []];
  language: string;
} [@@deriving of_yojson {strict = false}]