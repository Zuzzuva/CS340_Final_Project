var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : 'classmysql.engr.oregonstate.edu',
  user            : 'cs340_flickkad',
  password        : '3352',
  database        : 'cs340_flickkad'
});
module.exports.pool = pool;
