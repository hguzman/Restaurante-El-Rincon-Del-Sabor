const createError = require("http-errors");
const express = require("express");
const exphbs = require("express-handlebars");
const Handlebars = require("handlebars");
const {
  allowInsecurePrototypeAccess
} = require("@handlebars/allow-prototype-access");
const path = require("path");
const cookieParser = require("cookie-parser");
const logger = require("morgan");
const multer = require("multer");
const {v4 : uuidv4} = require ("uuid");
const methodOverride = require("method-override");
const session = require("express-session");
const flash = require("connect-flash");
const passport = require("passport");
require("./database");
require("./config/passport");
const app = express();

// view engine setup
app.set("views", path.join(__dirname, "views"));
app.engine(
  ".hbs",
  exphbs({
    handlebars: allowInsecurePrototypeAccess(Handlebars),
    defaultLayout: "layout",
    layoutsDir: path.join(app.get("views"), "layouts"),
    partialsDir: path.join(app.get("views"), "partials"),
    extname: ".hbs",
    helpers: require("./helpers/handlebars")
    // allowedProtoMethods: { trim: true }
  })
);
app.set("view engine", ".hbs");
const storage = multer.diskStorage({
  destination: path.join(__dirname, "public/img_perfil"),
  filename:(req, file, cb, filename) => {
    cb(null, uuidv4() + path.extname(file.originalname));
  }
});
app.use(multer({
  storage,
  limits:{fileSize:1000000},
  fileFilter:(req, file, cb) => {
    const filetypes = /jpeg|jpg|png/;
    const mimetype = filetypes.test(file.mimetype);
    const extname =filetypes.test(path.extname(file.originalname));
    if (mimetype &&  extname) {
      return cb(null, true);
    }
    cb("ERROR")
  }
}).single('image'));
app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(methodOverride("_method"));
app.use(
  session({
    secret: "mysecretapp",
    resave: true,
    saveUninitialized: true
  })
);
app.use(passport.initialize());
app.use(passport.session());
app.use(flash());
app.use(cookieParser());
app.use(express.static(path.join(__dirname, "public")));

//variables globales
app.use((req, res, next) => {
  res.locals.success = req.flash("success");
  res.locals.danger = req.flash("danger");
  res.locals.error = req.flash("error");
  res.locals.user = req.user || null;
  next();
});
app.use(require("./routes/platos"));
app.use(require("./routes/clientes"));
app.use(require("./routes/users"));
app.use(require("./routes/perfil"));
app.use(require("./routes/ventas"));

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render("error");
});

module.exports = app;
