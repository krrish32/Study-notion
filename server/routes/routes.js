const express = require('express');
const userRoutes = require('./user');   // Import the user route file
const profileRoutes = require('./profile'); // Import the profile route file
const courseRoutes = require('./Course');   // Import the course route file
const paymentRoutes = require('./Payments'); // Import the payment route file
const contactUsRoute = require('./Contact'); // Import the contact route file

// Initialize express router
const router = express.Router();

// Setup routes
router.use("/auth", userRoutes);         // Attach user routes to /api/v1/auth
router.use("/profile", profileRoutes);   // Attach profile routes to /api/v1/profile
router.use("/course", courseRoutes);     // Attach course routes to /api/v1/course
router.use("/payment", paymentRoutes);   // Attach payment routes to /api/v1/payment
router.use("/reach", contactUsRoute);    // Attach contact routes to /api/v1/reach

module.exports = router;
