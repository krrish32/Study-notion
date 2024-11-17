const swaggerAutogen = require('swagger-autogen')();
const path = require('path');
const fs = require('fs');

// Set up the Swagger configuration
const doc = {
  info: {
    title: 'EdTech API', // API title
    description: 'API Documentation for EdTech Application', // API description
  },
  host: 'edtech-frano76ziq-uc.a.run.app', // Your host without the base path
  basePath: '/api/v1', // Base path for all routes
  schemes: ['https'], // Use 'https' for production
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
      bearerAuth: [], // Apply bearerAuth globally to all endpoints
    },
  ],
  definitions: {}, // Mongoose model definitions will be added here
};

// Mongoose schema to Swagger conversion function
const mongooseSchemaToSwagger = (model) => {
  const definition = {
    properties: {},
    required: [],
  };

  Object.keys(model.schema.paths).forEach((key) => {
    const path = model.schema.paths[key];
    const pathType = path.instance || 'string';

    // Define the properties of each schema
    definition.properties[key] = { type: pathType };

    // Add required fields to Swagger if they exist in Mongoose schema
    if (path.isRequired) {
      definition.required.push(key);
    }
  });

  return definition;
};

// Load all Mongoose models from the './models' directory
const modelsPath = path.join(__dirname, './models');
const modelFiles = fs.readdirSync(modelsPath).filter((file) => file.endsWith('.js'));

modelFiles.forEach((file) => {
  const model = require(path.join(modelsPath, file));
  const modelName = file.replace('.js', '');

  // Convert each Mongoose model to a Swagger definition and add it to doc.definitions
  doc.definitions[modelName] = mongooseSchemaToSwagger(model);
});

// Path to generate the Swagger output file
const outputFile = path.join(__dirname, './swagger-output.json');

// Array containing the path to your routes file
const endpointsFiles = [
  './routes/routes.js', // Pointing to your consolidated routes file
];

// Generate the Swagger output
swaggerAutogen(outputFile, endpointsFiles, doc).then(() => {
  console.log('Swagger documentation generated successfully');
});
