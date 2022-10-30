const mongoose = require("mongoose");
const userSchema = mongoose.Schema({
  firstName: {
    // required: true,
    type: String,
    trim: true,
  },
  middleName: {
    // required: true,
    type: String,
    trim: true,
  },
  lastName: {
    // required: true,
    type: String,
    trim: true,
  },

  email: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
      },
      message: "please enter a valid email address",
    },
  },
  password: {
    required: true,
    type: String,
    validate: {
      validator: (value) => {
        return value.length > 6;
      },
      message: "password with minimum of 6 characters required",
    },
  },
  gender: {
    // required: true,
    type: String,
    trim: true,
  },
  phoneNumber: {
    // required: true,
    type: String,
    trim: true,
  },
  birthDay: {
    // required: true,

    type: Date,

   

    validate: {
      validator: (value) => {
        const re = /^\d\d\d\d-(0[1-9]|1[0-2])-(0[1-9]|[1-2]\d|3[0-1])$/;
        return value.match(re);
      },
      message: "please enter a valid date of birth",
    },
    type: String,
  },
  pin: {
    type: String,
    // required: true,
  },
  address: {
    type: String,
    default: "",
  },
  type: {
    type: String,
    default: "user",
  },
});

const User = mongoose.model("User", userSchema);
module.exports = User;
