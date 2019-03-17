type t = {
  api_key: string;
  configuration: Configuration.t
}

val create : ?configuration:Configuration.t -> string -> t

val account : t -> (Account.t, string) result
val analyze : [`Text of string | `Uri of Uri.t] -> ?options:Analysis.Options.t -> t
  -> (Analysis.t, string) result