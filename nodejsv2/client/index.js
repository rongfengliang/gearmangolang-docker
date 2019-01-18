var Gearman = require('abraxas');
var client = Gearman.Client.connect({ servers: ['demo:4730'], defaultEncoding:'utf8' });

// When submitting jobs you can use traditional Node style callbacks
client.submitJob('dalongupper', 'test string', function(error, result) {
    if (error) console.error(error);
    console.log("Upper:", result);
});