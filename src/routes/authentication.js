const express = require('express');
const router  = express.Router();
const pool = require('../database');


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

router.post('/signup', (req, res) =>{
  res.render('auth/signup');
});


module.exports = router;
