const gearman = require('gearman')

let client = gearman("app", 4730 , {timeout: 3000})  // timeout in milliseconds. 

// handle timeout 
client.on('timeout', function() {
	console.log('Timeout occurred')
	client.close()
})


// handle finished jobs
client.on('WORK_COMPLETE', function(job) {
	console.log('job completed, result:', job.payload.toString())
	client.close()
})

// connect to the gearman server
client.connect(function() {
	// submit a job to uppercase a string with normal priority in the foreground
	client.submitJob('ToUpper', 'Hello, World!')
})