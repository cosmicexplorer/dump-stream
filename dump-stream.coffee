# DumpStream = require 'dump-stream'
# s = new DumpStream
# getReadableStreamSomehow().pipe(s).on 'finish', ->
#   console.log s.dump()

Writable = require('stream').Writable

module.exports =
class DumpStream extends Writable
  constructor: (opts = {}) ->
    if not opts
      opts = {}
    if not @ instanceof DumpStream
      return new DumpStream opts
    else
      Writable.call @, opts

    @src = null
    cbError = (err) =>
      @emit 'error', err
    @on 'pipe', (src) =>
      src.on 'error', cbError
      @src = src
    @on 'unpipe', (src) =>
      src.removeListener 'error', cbError
      @src = null

    @string = ""

  _write: (chunk, enc, cb) ->
    @string += chunk.toString()
    cb?()

  dump: ->
    @string
