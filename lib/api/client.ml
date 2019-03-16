type t = {
  api_key: string;
  configuration: Configuration.t
}

let create ?(configuration=Configuration.create ()) api_key =
  {configuration; api_key}
