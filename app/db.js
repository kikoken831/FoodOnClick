const Pool = require("pg").Pool;

const pool = new Pool({
    user: "kendrickkee",
    password: "",
    host: "localhost",
    port: 5432,
    database: "foodonclick"
});

module.exports = pool;