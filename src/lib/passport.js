const passport = require("passport");
const LocalStrategy = require("passport-local").Strategy;
const pool = require("../database");
const helpers = require("../lib/helpers");

passport.use(
  "local.login",
  new LocalStrategy(
    {
      usernameField: "username",
      passwordField: "password",
      passReqToCallback: true
    },
    async (req, username, password, done) => {
      console.log(req.body);
      const rows = await pool.query("SELECT * FROM user WHERE username = ?", [
        username
      ]);
      if (rows.length > 0) {
        const user = rows[0];
        const validPassword = await helpers.matchPassword(
          password,
          user.password
        );
        if (validPassword) {
          done(null, user, req.flash("success", " Bienvenido " + username));
        } else {
          done(null, false, req.flash("danger", " Contraseña incorrecta"));
        }
      } else {
        return done(null, false, req.flash("danger", " El username no existe"));
      }
    }
  )
);

passport.use(
  "local",
  new LocalStrategy(
    {
      usernameField: "username",
      passwordField: "password",
      passReqToCallback: true
    },
    async (req, username, password, done) => {
      const { name, fullname, email, mobile, cedula, sexo, tyc } = req.body;
      console.log(req.body);
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
      newUser.password = await helpers.encryptPassword(password);
      const result = await pool.query("INSERT INTO user SET ?", [newUser]);
      newUser.id = result.insertId;
      return done(null, newUser);
    }
  )
);
passport.serializeUser((user, done) => {
  done(null, user.id);
});
passport.deserializeUser(async (id, done) => {
  const rows = await pool.query("SELECT * FROM user Where id = ?", [id]);
  done(null, rows[0]);
});
