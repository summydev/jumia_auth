const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcrypt");
const jwt = require("jsonwebtoken");
const e = require("express");

const authRouter = express.Router();
authRouter.post("/api/email/signup", async (req, res) => {
  try {
    const { email, password } = req.body;
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "Error! user eith same email already exists!!" });
    }

    const hashedPassword = await bcryptjs.hash(password, 8);
    let user = new User({
      email,
      password: hashedPassword,
    });
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
// authRouter.post("/api/email/signin", async(req, res)=>{

// });
authRouter.post("/api/authemail", async (req, res) => {
  try {
    const { email } = req.body;
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ msg: "email doesn't exist" });
    }
  } catch (e) {}
});

module.exports = authRouter;
