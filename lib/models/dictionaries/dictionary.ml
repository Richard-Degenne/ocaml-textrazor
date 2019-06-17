open Yojson.Safe

type match_type = [`Token | `Stem]

let match_type_to_yojson = function
| `Token -> `String "TOKEN"
| `Stem -> `String "STEM"

let match_type_of_yojson = function
| `String s when String.uppercase_ascii s = "TOKEN" -> Ok `Token
| `String s when String.uppercase_ascii s = "STEM" -> Ok `Stem
| _ -> Error "Invalid match type"

type t = {
  id: string;
  language: string;
  match_type: match_type [@key "matchType"];
  case_insensitive: bool [@key "caseInsensitive"];
} [@@deriving yojson {strict = false}]

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
    let dictionaries =
      Util.(member "dictionaries" response |> convert_each of_yojson)
    in
    process_list dictionaries
  | Error error -> Error error

let get id client =
  match Client.get ("/entities/" ^ id) client with
  | Ok response -> of_yojson (Util.member "response" response)
  | Error error -> Error error

let create t client =
  let body = to_yojson t |> to_string in
  match Client.put ("/entities/" ^ t.id) ~body client with
  | Ok _ -> Ok true
  | Error error -> Error error
