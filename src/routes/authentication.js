const express = require('express');
const router  = express.Router();
// const pool = require('../database');
const passport = require('passport');


router.get('/', (req, res) => {
  res.render('auth/login');
});

router.post('/', (req, res)=>{
  console.log(req.body);
  res.send('recivido');
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
  res.send('profile');
});

module.exports = router;
