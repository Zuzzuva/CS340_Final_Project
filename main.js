/*
** Using some lecture code from CS 340 at Oregon State University
** Original code can be found at: https://github.com/knightsamar/cs340_sample_nodejs_app/blob/master/main.js
*/

var express = require('express');
var mysql = require('./dbcon.js');
var bodyParser = require('body-parser');

var app = express();
var handlebars = require('express-handlebars').create({
  defaultLayout:'main',
});

app.engine('handlebars', handlebars.engine);
app.use(bodyParser.urlencoded({extended:true}));
app.use('/static', express.static('public'));
app.set('view engine', 'handlebars');
app.set('port', process.argv[2]);
app.set('mysql', mysql);
app.use('/', express.static('public'));

/*
** I think this is how we render the pages? I dont understand the difference between app.use and app.get yet.
*/

app.get('/addthings', function(req,res, next){
  res.status(200).render('addThings');
});

app.get('/cart', function(req,res, next){
  res.status(200).render('cart');
});

app.get('/customers', function(req,res, next){
  res.status(200).render('customers');
});

app.get('/orderlist', function(req,res, next){
  res.status(200).render('orderList');
});

app.get('/order', function(req,res, next){
  res.status(200).render('order');
});

app.get('/', function(req,res, next){
  res.status(200).render('index');
});

app.use(function(req,res){
  res.status(404);
  res.render('404');
});

app.listen(app.get('port'), function(){
  console.log('Express started on http://localhost:' + app.get('port') + '; press Ctrl-C to terminate.');
});
