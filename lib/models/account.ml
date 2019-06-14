type t = {
  concurrent_request_limit: int [@key "concurrentRequestLimit"];
  concurrent_requests_used: int [@key "concurrentRequestsUsed"];
  plan_daily_included_requests: int [@key "planDailyRequestsIncluded"];
  plan: string;
  requests_used_today: int [@key "requestsUsedToday"];
} [@@deriving of_yojson]

let get client =
  match Client.get "/account/" client with
  | Ok response -> of_yojson (Yojson.Safe.Util.member "response" response)
  | Error error -> Error error
