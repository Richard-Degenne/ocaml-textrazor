open Yojson.Safe

type t = {
  id: string;
  language: string;
  match_type: string [@key "matchType"];
  case_insensitive: bool [@key "caseInsensitive"];
} [@@deriving of_yojson {strict = false}]

(* TODO: This is tedious. Use `Core` instead. *)
let is_error = function
| Ok _ -> false
| Error _ -> true

let process_list l =
   match List.find_opt is_error l with
   | Some (Error e) -> Error e
   | None -> Ok (List.map (fun (Ok o) -> o) l)
   | _ -> assert false

let list client =
  match Client.get "/entities/" client with
  | Ok response ->
  let dictionaries = Util.(member "dictionaries" response |> convert_each of_yojson) in
  process_list dictionaries
  | Error error -> Error error
