type param = {
  relation: string;
  word_positions: int list;
} [@@deriving of_yojson]

type t = {
  id: int;
  params: param list;
  word_positions: int list;
} [@@deriving of_yojson]
