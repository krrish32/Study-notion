const mongoose = require("mongoose");
require("dotenv").config();

const MONGO_URI = process.env.MONGO_URI || 'mongodb://127.0.0.1:27017/Edtech'; // Fallback if env variable is missing

exports.connect = () => {
	mongoose
		.connect(MONGO_URI, {
			useNewUrlparser: true,
			useUnifiedTopology: true,
		})
		.then(console.log(`DB Connection Success`))
		.catch((err) => {
			console.log(`DB Connection Failed`);
			console.log(err);
			process.exit(1);
		});
};
