# DumpStream = require 'dump-stream'
# s = new DumpStream
# getReadableStreamSomehow().pipe(s).on 'finish', ->
#   console.log s.dump()

Writable = require('stream').Writable

module.exports =
class DumpStream extends Writable
  constructor: (opts = {}) ->
    opts.objectMode = opts.outputType is 'Array'
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

    switch opts.outputType
      when 'Array'
        @chunk = []
        @concatFun = (chk, obj) -> chk.concat obj
      else
        @chunk = ""
        @concatFun = (chk, obj) -> chk += obj.toString()

  _write: (chunk, enc, cb) ->
    @chunk = @concatFun @chunk, chunk
    cb?()

  dump: -> @chunk
