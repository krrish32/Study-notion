// Importing necessary modules and packages
const express = require("express");
const functions = require("firebase-functions"); // Firebase Functions
const database = require("./config/database");
const cookieParser = require("cookie-parser");
const cors = require("cors");
const { cloudinaryConnect } = require("./config/cloudinary");
const fileUpload = require("express-fileupload");
const dotenv = require("dotenv");
const swaggerUi = require('swagger-ui-express');
const swaggerFile = require('./swagger-output.json'); 
const router = require("./routes/routes");

// Loading environment variables from .env file
dotenv.config();

// Initialize express app
const app = express();

// Connecting to database
database.connect();

// Middlewares
app.use(express.json());
app.use(cookieParser());
app.use(
	cors({
		origin: "*",
		credentials: true,
	})
);
app.use(
	fileUpload({
		useTempFiles: true,
		tempFileDir: "/tmp/",
	})
);

// Connecting to cloudinary
cloudinaryConnect();

// Serve Swagger UI at /api-docs
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerFile));

// Setting up routes
app.use("/api/v1", router);

// Testing the server
app.get("/", (req, res) => {
	return res.json({
		success: true,
		message: "Your server is up and running ...",
	});
});

// Export the app as a Firebase Cloud Function
exports.edTech = functions.https.onRequest(app);
