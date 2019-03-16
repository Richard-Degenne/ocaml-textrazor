type t = {
  api_key: string;
  configuration: Configuration.t
}

let create ?(configuration=Configuration.create ()) api_key =
  {configuration; api_key}

let url path t =
  Configuration.url t.configuration ~path 

let account t = 
  match Request.get (url "/account/" t ()) t.api_key with
  | Ok response -> Account.of_yojson response
  | Error error -> Error error

let analyze ~text ?(options = Analysis.Options.default) t =
  let params =
    ("text", [text]) :: Analysis.Options.to_params options
  in
  match Request.post_form (url "/" t ()) ~params t.api_key with
  | Ok response -> Analysis.of_yojson response
  | Error error -> Error error
