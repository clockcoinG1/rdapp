// create express server
const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

// set up express to use body-parser
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// set up express to use cors
const cors = require('cors');
app.use(cors());

// set up express to serve static files
app.use(express.static('public'));

// set up express to use handlebars
const exphbs = require('express-handlebars');
app.engine('handlebars', exphbs({ defaultLayout: 'main' }));
app.set('view engine', 'handlebars');

// set up express to use mongoose
const mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/mongoose_dashboard');

// set up express to use passport
const passport = require('passport');
app.use(passport.initialize());
app.use(passport.session());

// set up express to use flash
const flash = require('connect-flash');
app.use(flash());

// set up express to use morgan
const morgan = require('morgan');
app.use(morgan('dev'));

// set up express to use cookie-parser
const cookieParser = require('cookie-parser');
app.use(cookieParser());

// set up express to use express-session
const session = require('express-session');
app.use(session({
  secret: 'keyboard cat',
  resave: false,
  saveUninitialized: true,
  cookie: { maxAge: 60000 }
}));

// set up express to use passport
require('./config/passport')(passport);

// set up express to use routes
const routes = require('./routes/index');
app.use('/', routes);

// set up express to use error-handling//       