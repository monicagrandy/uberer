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
//   fs.readFile(__dirname + '/schema.sql', 'utf-8', function(err, data){
//   console.log("line 19")  
//   var commands = data.split(";");
//   commands.pop();
//   commands.forEach(function(command){
//     con.query(command, function(err, results){
//       if (err){
//         console.error(err);
//       }
//       //console.log("line 27", results) 
//     })
//   })
// })

// con.query('INSERT INTO CLIENT CONTACT (name, email, rating) VALUES (?, ?, ?)', ['Monica', 'monica.grandy@gmail.com', '5'], function(err, result) {
//       if (err){
//         throw err
//       } 
//       else {
//         console.log(result)
//       }
//   }); 
});



// setInterval(function () { con.query('SELECT 1') }, 5000)

// con.end(function(err) {
//   // The connection is terminated gracefully
//   // Ensures all previously enqueued queries are still
//   // before sending a COM_QUIT packet to the MySQL server.
// });

module.exports = con





