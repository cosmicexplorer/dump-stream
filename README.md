dump-stream
================

Takes a stream and dumps it to a string, or an array if you really need that, I guess.

# USAGE

```javascript
DumpStream = require('dump-stream');
// use new DumpStream({outputType: 'Array'}) to dump to array
var stream = new DumpStream();
getReadableStreamSomehow().pipe(stream).on('finish', function(){
  console.log(stream.dump());
});
```
