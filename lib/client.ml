open Cohttp
open Lwt.Infix
open Yojson.Safe

type t = {
  api_key: string;
  secure: bool;
  use_eu_endpoint: bool
}
type response = (json, string) result

let create ?(secure=true) ?(use_eu_endpoint=false) api_key =
  {api_key; secure; use_eu_endpoint}

let headers t =
  Header.of_list [("X-Textrazor-Key", t.api_key); ("Accept-Enconding", "gzip")]

let parse_response (response, body) =
    let%lwt contents = Cohttp_lwt.Body.to_string body in
    let json = from_string contents in
    let result = if Response.status response |> Code.code_of_status |> Code.is_success
      then Ok json
      else Error (Util.member "error" json |> Util.to_string)
    in Lwt.return result

let scheme t =
  if t.secure then "https" else "http"

let host t =
  if t.use_eu_endpoint then "api-eu.textrazor.com" else "api.textrazor.com"

let url path t =
  Uri.make ~scheme:(scheme t) ~host:(host t) ~path
    ?userinfo:None ?port:None ?fragment:None ()


let get path t =
  Lwt_main.run (
    Cohttp_lwt_unix.Client.get (url path t) ~headers:(headers t) >>=
    parse_response
  )

let post_form path ?(params = []) t =
  Lwt_main.run (
    Cohttp_lwt_unix.Client.post_form (url path t) ~headers:(headers t) ~params >>=
    parse_response
  )

let put path ~body t =
  let body = Cohttp_lwt.Body.of_string body in
  Lwt_main.run(
    Cohttp_lwt_unix.Client.put (url path t) ~headers:(headers t) ~body
      ~chunked:false >>=
    parse_response
  )
