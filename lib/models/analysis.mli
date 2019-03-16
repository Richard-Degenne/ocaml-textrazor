module Options : sig
  type extractor = [`Entities | `Topics]
  type t = {
    extractors: extractor list;
  }

  val default : t
  val to_params : t -> (string * string list) list
end

type t = {
  coarse_topics: Topic.t list;
  entities: Entity.t list;
  language: string;
  topics: Topic.t list;
} [@@deriving of_yojson]