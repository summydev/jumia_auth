//IMPORT FROM PACKAGES
console.log("hello world");
const express = require("express");
const mongoose = require("mongoose");

// import 'package: expresss/express.dart'

//INIT
const PORT = 4000;
const app = express();
const DB =
  "mongodb+srv://jumiaclone:jumiaclone2022@cluster0.shlxjmn.mongodb.net/?retryWrites=true&w=majority";

//IMPORT FROM OTHER FILES
const authRouter = require("./routes/auth.js");
//midleware
// CLIENT -> middleware -> SERVER -> CLIENT
app.use(express.json());
app.use(authRouter);
mongoose
  .connect(DB)
  .then(() => {
    console.log("connection successful");
  })
  .catch((e) => {
    console.log(e);
  });
//CREATING AN API
//http://<yourapiaddress>/hello-world
app.get("/", (req, res) => {
  res.json({ name: "Jumia Auth" });
});
//GET, PUT, POST, DELETE, UPDATE -> CRUD

app.listen(PORT, "0.0.0.0", () => {
  console.log("connected at port  " + PORT);
});
//localhost
