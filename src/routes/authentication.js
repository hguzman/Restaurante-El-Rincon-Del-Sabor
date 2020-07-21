const express = require("express");
const router = express.Router();
const passport = require("passport");
const { isLoggedIn, isNotLoggedIn } = require("../lib/auth");

router.get("/", isNotLoggedIn, (req, res) => {
  res.render("auth/login");
});

router.post("/", isNotLoggedIn, (req, res) => {
  passport.authenticate("local.login", {
    successRedirect: "/home",
    failureRedirect: "/",
    failureFlash: true
  })(req, res);
});

router.get("/signup", isNotLoggedIn, (req, res) => {
  res.render("auth/signup");
});

router.post(
  "/signup",
  isNotLoggedIn,
  passport.authenticate("local", {
    successRedirect: "/home",
    failureRedirect: "/signup",
    failureFlash: true
  })
);

router.get("/home", isLoggedIn, (req, res) => {
  res.render("home");
});

router.get("/profile", isLoggedIn, (req, res) => {
  res.render("profile");
});

router.get("/logout", (req, res) => {
  req.logout();
  res.redirect("/");
});

module.exports = router;
