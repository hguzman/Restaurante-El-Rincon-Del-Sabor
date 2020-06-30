const express = require('express');
const router  = express.Router();
const passport = require('passport');


router.get('/', (req, res) => {
  res.render('auth/login');
});


router.post('/', (req, res) =>{
  passport.authenticate('local.login',{
    successRedirect: '/profile',
    failureRedirect: '/',
    failureFlash: true
  })(req, res);
});


router.get('/signup', (req, res) =>{
  res.render('auth/signup');
});

router.post('/signup', passport.authenticate('local',{
  successRedirect: '/profile',
  failureRedirect: '/signup',
  failureFlash: true
}))


router.get('/profile', (req, res) =>{
  res.render('profile');
});

module.exports = router;
