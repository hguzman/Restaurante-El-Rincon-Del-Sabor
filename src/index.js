const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const path = require('path');
const flash = require('connect-flash');
const session = require('express-session');
const MySQLStore = require('express-mysql-session');
const passport = require('passport');

const {database} = require('./keys');
//inicializaciones

const app = express();
require('./lib/passport');
//setting
app.set('port', 4000);
app.set('views', path.join(__dirname, 'views'));
app.engine('.hbs', exphbs({
    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    extname: '.hbs',
    helpers: require('./lib/handlebars')
}));
app.set('view engine', '.hbs');
//middlewares
app.use(session({
  secret: 'sessionguardada',
  resave: false,
  saveUninitialized: false,
  store: new MySQLStore(database)
}));
app.use(flash());
app.use(morgan('dev'));
app.use(express.urlencoded({extended: true}));
app.use(express.json());
app.use(passport.initialize());
app.use(passport.session());

// variables globales
app.use((req, res, next) =>{
  app.locals.success = req.flash('success');
  app.locals.danger = req.flash('danger');
  next();
});


//routes
app.use(require('./routes/index'));
app.use(require('./routes/authentication'));
app.use(require('./routes/links'));

//public
app.use(express.static(path.join(__dirname, 'public')));

//servidor
app.listen(app.get('port'), () =>{
  console.log('Servidor iniciado en el puerto', app.get('port'));
});
