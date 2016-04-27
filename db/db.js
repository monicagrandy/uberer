var mysql = require("mysql");
var fs = require('fs')
var config = require('./config.js')

var con = mysql.createConnection({
  host: config.host,
  user: config.user,
  password: config.password,
  database: config.database
});

con.connect(function(err){
  if(err){
    console.log('Error connecting to Db');
    return;
  }
  console.log('line 17: Connection established');
  var schema = fs.readFile(__dirname + '/schema.sql', 'utf-8', function(err, data){
    if(err){
      console.log(err)
    }
    data = data.toString()
    data = data.split(".")
    data.forEach(function(table){
      con.query(table);
      console.log("here is a table: ", table)
    })  
  })
})


module.exports = con





