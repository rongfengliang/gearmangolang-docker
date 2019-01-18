var Gearman = require('abraxas');
var client = Gearman.Client.connect({ servers: ['demo:4730'], defaultEncoding:'utf8' });

client.registerWorker("dalongupper", function(task) {
    return task.payload.toUpperCase();
});