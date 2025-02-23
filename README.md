# StudyNotion

StudyNotion is an EdTech platform designed to help students learn new technologies through various courses. Users can enroll in both free and paid courses, track their learning progress, and access high-quality educational content.

## Features

- **User Authentication**: Secure login and registration using Firebase Authentication.
- **Course Management**: Users can browse, enroll in, and track progress in courses.
- **Payment Integration**: Secure payments handled via Razorpay.
- **Cloud Storage**: Course materials are stored and managed using Cloudinary.
- **API Documentation**: Swagger is used to generate API documentation for seamless integration.
- **Real-time Updates**: Firebase functions enable real-time data updates.

## Tech Stack

- **Frontend**: Flutter (for mobile application)
- **Backend**: Node.js, Express.js
- **Database**: MongoDB (via Mongoose Atlas)
- **Authentication**: Firebase Authentication
- **Cloud Storage**: Cloudinary
- **Payment Gateway**: Razorpay
- **API Documentation**: Swagger

## Installation

### Prerequisites

- Node.js installed
- MongoDB database set up
- Firebase project configured
- Cloudinary account for media storage
- Razorpay account for payment processing

### Steps to Run Locally

1. Clone the repository:

   ```sh
   git clone https://github.com/yourusername/studynotion.git
   cd studynotion
   ```

2. Install backend dependencies:

   ```sh
   cd backend
   npm install
   ```

3. Set up environment variables (`.env` file in the backend folder):

   ```env
   MONGO_URI=your_mongodb_uri
   FIREBASE_CONFIG=your_firebase_config
   CLOUDINARY_API_KEY=your_cloudinary_api_key
   RAZORPAY_KEY=your_razorpay_key
   ```

4. Start the backend server:

   ```sh
   npm start
   ```

5. Install Flutter dependencies for the mobile app:

   ```sh
   cd ../frontend
   flutter pub get
   ```

6. Run the Flutter app:

   ```sh
   flutter run
   ```

## API Documentation

Swagger documentation is available at `http://localhost:5000/api-docs` when the backend server is running.

