var gearmanode = require('gearmanode');
var client = gearmanode.client({
	host:"app",
	port: 4730
});

var job = client.submitJob('reverse', 'hello world!');
job.on('workData', function(data) {
    console.log('WORK_DATA >>> ' + data);
});
job.on('complete', function() {
    console.log('RESULT >>> ' + job.response);
    client.close();
});