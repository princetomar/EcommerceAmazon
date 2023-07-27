const express = require("express");
const mongoose = require("mongoose");
const app = express();
const DB =
  "mongodb+srv://prince:prince443@cluster0.xforsd3.mongodb.net/?retryWrites=true&w=majority";
const PORT = 3001;
const authRouter = require("./routes/auth");

// middleware
// client -> MIDDLEWARE -> server -> client | STOPS
app.use(authRouter);

// Mongoose Connection
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connected to MongoDB");
  })
  .catch((e) => {
    console.log(e);
  });

// Create an API

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Connected at Port ${PORT}`);
});
