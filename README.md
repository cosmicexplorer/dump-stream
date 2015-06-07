to-string-stream
================

Takes a stream and turns it into a string. Voila.

# USAGE

```javascript
ToStringStream = require('to-string-stream');
var stream = new ToStringStream();
getReadableStreamSomehow().pipe(stream).on('finish', function(){
  console.log(s.dump());
});
```
