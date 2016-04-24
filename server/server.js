
var express = require("express");
var mysql = require("mysql");
var bodyParser = require('body-parser');
var db = require("../db/config.js");
var _ = require("lodash");

var app = express();


var con = mysql.createConnection({
  host: 'localhost',
  user: 'monica',
  password: 'monica123',
  database: 'uberer'
});

con.connect(function(err){
  if(err){
    console.log('Error connecting to Db');
    return;
  }
  console.log('Connection established');
});

con.end(function(err) {
  // The connection is terminated gracefully
  // Ensures all previously enqueued queries are still
  // before sending a COM_QUIT packet to the MySQL server.
});

app.use(express.static(__dirname + "/../client/"));
app.use(bodyParser.json());


module.exports = app;