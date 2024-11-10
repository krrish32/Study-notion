const swaggerAutogen = require('swagger-autogen')();
const path = require('path');

// Set up the Swagger configuration
const doc = {
  info: {
    title: 'Your API', // API title
    description: 'API Documentation for Your Application', // API description
  },
  host: 'localhost:4000/api/v1', // Change the host if different
  schemes: ['http'], // Use 'https' for production
  securityDefinitions: {
    bearerAuth: {
      type: 'apiKey',
      in: 'header',
      name: 'Authorization',
      description: 'Enter your Bearer token',
    },
  },
  security: [
    {
      bearerAuth: [] // Apply bearerAuth globally to all endpoints
    }
  ]
};

// Path to generate the Swagger output file
const outputFile = path.join(__dirname, './swagger-output.json');

// Array of your route files
const endpointsFiles = [
    './routes/routes.js', // Now pointing to the consolidated router.js file

];

// Generate the Swagger output
swaggerAutogen(outputFile, endpointsFiles, doc).then(() => {
  console.log('Swagger documentation generated successfully');
});
