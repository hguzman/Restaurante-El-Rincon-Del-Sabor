const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const pool = require('../database');


passport.use('local', new LocalStrategy({
    usernameField: 'username',
    passwordField: 'password',
    passReqToCallback: true
  }, async(req, username, password, done) => {
      const {name, fullname, email, mobile, cedula, sexo, tyc} = req.body
    const newUser = {
      name,
      fullname,
      username,
      email,
      password,
      mobile,
      cedula,
      sexo,
      tyc
    };
    await pool.query('INSERT INTO user SET ?', [newUser]);
}));
