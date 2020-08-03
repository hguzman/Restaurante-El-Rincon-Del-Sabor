const express = require("express");
const router = express.Router();
const User = require("../models/User");
const passport = require('passport');
const {isLoggedIn, isNotLoggedIn} = require('../helpers/auth');

/* GET users listing. */
router.get("/signup", isNotLoggedIn,(req, res, next) => {
  res.render("auth/signup");
});
router.post("/signup", isNotLoggedIn, async(req, res, next) => {
  const {nombre,apellido,correo,contraseña,validar,celular,cedula,sexo,tyc} = req.body;
  if (contraseña != validar) {
    res.render("auth/signup", {nombre,apellido,correo,celular,cedula});
  } else {
    const emailUser = await User.findOne({correo:correo});
    if (emailUser) {
      req.flash("danger", "este correo ya esta en uso");
      res.redirect("/signup");
    }else{
      const newUser = new User({nombre,apellido,correo,contraseña,validar,celular,cedula,sexo,tyc});
      newUser.contraseña = await newUser.encryptPassword(contraseña);
      await newUser.save();
      req.flash("success", "su registro fue exitoso ", nombre);
      res.redirect("/");
      }
    }
});

router.get("/", isNotLoggedIn,(req, res, next) => {
  res.render("auth/signin");
});

router.post("/",isNotLoggedIn, passport.authenticate("local",{
  successRedirect: "/home",
  failureRedirect: "/",
  failureFlash: true
}));

router.get("/logout", isLoggedIn,(req, res, next) => {
  req.logout();
  res.redirect("/");
})
router.get("/home", isLoggedIn,(req, res, next) => {
  res.render("index");
})



module.exports = router;
