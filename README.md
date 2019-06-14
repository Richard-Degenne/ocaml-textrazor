# OCaml TextRazor &nbsp; [![](https://travis-ci.org/Richard-Degenne/ocaml-textrazor.svg?branch=master)](https://travis-ci.org/Richard-Degenne/ocaml-textrazor)

An OCaml wrapper for the TextRazor API.

# Installation

```sh
opam install textrazor
```

# Usage
## Configuration

```ocaml
open Textrazor

let client = Client.create "api_key"

(* Optional configuration *)
let client = Client.create ~use_eu_endpoint:false ~secure:true "api_key"
```

## Analysis

Send either a text or a publicly available URL to the analysis endpoint.

```ocaml
open Textrazor

(* Analyze a text *)
let analysis = Analysis.post (`Text "Text to analyze") client

(* Analyze a text by public URL *)
let analysis =
  Analysis.post (`Uri (Uri.of_string "https://www.example.com/sample.txt")) c
```

Use `Analysis.Options` to customize the analysis.

```ocaml
open Textrazor

let analysis =
  let options = Analysis.Options.{default with field = value} in
  Analysis.post (`Text "Text to analyze") ~options client
```

## Account

Get information about your Textrazor account.

```ocaml
open Textrazor

let account = Account.get client
```

# Contributing

- Fork the project;
- Create your feature branch (`git checkout -b my-new-feature`);
- Commit your changes (`git commit -am 'Add some feature'`);
- Push to the branch (`git push origin my-new-feature`);
- Create a [new pull request](https://github.com/Richard-Degenne/ocaml-textrazor/pulls).
