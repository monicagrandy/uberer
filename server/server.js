
var express = require("express");
var mysql = require("mysql");
var bodyParser = require('body-parser');
var db = require("../db/db.js");
var _ = require("lodash");

var app = express();


app.use(express.static(__dirname + "/../client/"));
app.use(bodyParser.json());


module.exports = app;