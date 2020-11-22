const mySQL = require('mysql') 

const db = mySQL.createConnection({
	// Setting DB
	host: 'localhost',
	user: 'root',
	password: '',
	database: 'blanja-api',
})

db.connect((err) => {
	if (err) throw err
	console.log('Database Connect')
})

module.exports = db