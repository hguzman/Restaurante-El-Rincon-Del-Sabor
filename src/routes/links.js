const express = require('express');
const router  = express.Router();
const pool = require('../database');

router.get('/signup', (req, res) =>{
  res.render('links/signup');
});

router.post('/signup', (req, res) =>{
  res.render('links/signup');
});

// router.get('/login', (req, res)=>{
//   res.render('links/login');
// });

router.post('/login', (req, res)=>{
  console.log(req.body);
  res.send('recivido');
});

module.exports = router;
