sys: require('sys')
http: require('http')
event: require('events')

class LastFmClient
  constructor: (apikey) ->
    @apikey: apikey
    @client: http.createClient(80, 'ws.audioscrobbler.com')

  encode: (key, value) ->
    encodeURIComponent(key) + '=' + encodeURIComponent(value)

  buildQueryString: (params) ->
    query: this.encode(key, value) for key, value of params
    query.join '&'

  get: (type, method, params) ->
    queryString: this.buildQueryString {
      method: "$type.$method",
      api_key: @apikey,
      format: 'json'
    }
    emitter: new event.EventEmitter()
    queryString: queryString + "&" + this.buildQueryString(params) if params
    request: @client.request 'GET', "/2.0?$queryString", {
      'Accept': "*/*",
      'Host': 'ws.audioscrobbler.com',
      'User-Agent': 'Rockon'
    }
    request.end()
    request.addListener 'response', (response) ->
      response.setEncoding 'utf8'
      data: ''
      response.addListener 'data', (chunk) ->
        data += chunk
      response.addListener 'end', ->
        emitter.emit 'complete', JSON.parse(data)
    emitter

exports.LastFmClient = LastFmClient
