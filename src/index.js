const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const path = require('path');

//inicializaciones

const app = express();

//setting
app.set('port', process.env.PORT || 4000);
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
app.use(morgan('dev'));
app.use(express.urlencoded({extended: false}));
app.use(express.json());

// variables globales
app.use((req, res, next) =>{
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
  console.log('Servidor iniciado en el puerto', app.get('port'))
});
