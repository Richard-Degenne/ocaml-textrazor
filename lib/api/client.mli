type t = {
  api_key: string;
  configuration: Configuration.t
}

val create : ?configuration:Configuration.t -> string -> t

val account : t -> (Account.t, string) result
val analyze : text:string -> ?options:Analysis.Options.t -> t -> (Analysis.t, string) result