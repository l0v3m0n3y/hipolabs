import asyncdispatch, httpclient, json, strutils
const api = "http://universities.hipolabs.com"
var headers = newHttpHeaders({
    "Connection": "keep-alive",
    "user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36",
    "Host": "universities.hipolabs.com",
    "accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7"
})

proc search_universities*(country:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers 
  try:
    let response = await client.get(api & "/search?country=" & country)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()
