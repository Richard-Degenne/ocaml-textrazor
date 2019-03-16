module Options : sig
  type extractor = [`Entities]
  type t = {
    extractors: extractor list;
  }

  val default : t
  val to_params : t -> (string * string list) list
end

type t = {
  entities: Entity.t list;
  language: string;
} [@@deriving of_yojson]