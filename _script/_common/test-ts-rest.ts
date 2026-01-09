fetch('https://httpbingo.org/json')
	.then(res => res.json())
	.then(res => {
		console.log(res);
	}).catch(err => console.log(err));