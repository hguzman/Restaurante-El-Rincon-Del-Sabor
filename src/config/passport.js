const passport = require("passport");
const LocalStrategy = require("passport-local").Strategy;
const User = require("../models/User");

passport.use(
  new LocalStrategy(
    {
      usernameField: "correo",
      passwordField: "contraseña",
    },
    async (correo, contraseña, done) => {
      const user = await User.findOne({ correo: correo });
      if (!user) {
        return done(null, false, { message: "el correo no exite." });
      } else {
        const match = await user.matchPassword(contraseña);
        if (match) {
          return done(null, user);
        } else {
          return done(null, false, { message: "contraseña incorrecta." });
        }
      }
    }
  )
);
passport.serializeUser((user, done) => {
  done(null, user.id);
});
passport.deserializeUser((id, done) => {
  User.findById(id, (err, user) => {
    done(err, user);
  });
});
