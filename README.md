dump-stream
================

Takes a stream and dumps it to a string. Voila.

# USAGE

```javascript
DumpStream = require('dump-stream');
var stream = new DumpStream();
getReadableStreamSomehow().pipe(stream).on('finish', function(){
  console.log(stream.dump());
});
```
