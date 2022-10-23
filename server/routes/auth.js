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
    if (!existingUser) {
      return res
        .status(400)
        .json({ msg: "user email doesn't exist. Please signup" });
    } else {
      return res.status(200).json({ msg: "user email exists. Please login" });
    }
  } catch (e) {
    print(e);
  }
});
authRouter.post("/api/email/signup-details", async (req, res) => {
  try {
    const {
      email,
      firstName,
      middleName,
      lastName,
      phoneNumber,
      gender,
      birthDay,
    } = req.body;
    const updateUser = await User.updateOne(
      { email: email },
      {
        $set: {
          firstName: firstName,
          middleName: middleName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          gender: gender,
          birthDay: birthDay,
        },
        // { middleName: middleName },
        // { lastName: lastName },
        // { phoneNumber: phoneNumber },
      },
      function (err) {
        if (err) {
          console.log(err);
        } else {
          console.log("update susccesful");
        }
      }
    );
    updateUser.save();

    // res.json(user);
  } catch (e) {
    console.log(e);
  }
});

authRouter.post("/api/email/signin", async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email });
    if (!user) {
      return res
        .status(400)
        .json({ msg: "user with the email does not exist" });
    }
    const isMatch = await bcryptjs.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: "Incorrect Password" });
    }
    const token = jwt.sign({ id: user._id }, "passwordKey");
    res.json({ token, ...user._doc });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = authRouter;
