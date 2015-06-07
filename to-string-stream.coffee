# ToStringStream = require 'to-string-stream'
# s = new ToStringStream
# getReadableStreamSomehow().pipe(s).on 'finish', ->
#   console.log s.dump()

Writable = require('stream').Writable

module.exports =
class ToStringStream extends Writable
  constructor: (opts) ->
    if not opts
      opts = {}
    if not @ instanceof ToStringStream
      return new ToStringStream opts
    else
      Writable.call @, opts

    @string = ""

  _write: (chunk, enc, cb) ->
    @string += chunk.toString()
    cb?()

  dump: ->
    @string
