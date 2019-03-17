type t = {
  id: int;
  word_positions: int list;
} [@@deriving of_yojson]
