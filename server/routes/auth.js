const express = require("express");
const authRouter = express.Router();

// Sign Up Api
authRouter.post("/api/signup", (req, res) => {
  // Get data from the client
  console.log(req.body);
  const { name, email, password } = req.body;
  // Post the data in database
  // Return that data to user
});

module.exports = authRouter;
