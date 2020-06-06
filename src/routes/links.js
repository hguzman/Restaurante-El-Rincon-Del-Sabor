const express = require('express');
const router  = express.Router();
const pool = require('../database');

router.get('/signup', (req, res) =>{
  res.render('links/signup');
});
module.exports = router;
