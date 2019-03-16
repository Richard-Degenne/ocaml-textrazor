type t = {
  api_key: string;
  configuration: Configuration.t
}

val create : ?configuration:Configuration.t -> string -> t
