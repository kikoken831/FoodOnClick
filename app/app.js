const express = require("express");
const bodyParser = require("body-parser");
const ejs = require("ejs");
const _ = require("lodash");
const pool = require("./db");
const app = express();

let session = {
  name: "",
  role: "",
  email: "",
};

app.set("view engine", "ejs");

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

let invalidMsg = false;

app.get("/", (req, res) => {
  res.render("login", { invalidMsg: invalidMsg });
});

app.get("/dashboard", (req, res) => {
  console.log(session);
  res.render("dashboard",{session:session});
});

app.post("/", async (req, res) => {
  const username = req.body.username;
  const password = req.body.password;
  const userDetails = await pool.query(
    "select * from users JOIN user_role using (role_id) where users.username = $1 and users.password = $2",
    [username, password]
  );
  if (userDetails.rows.length == 0) {
    invalidMsg = true;
    res.redirect("/");
  } else {
    session.name = userDetails.rows[0].name;
    session.email = userDetails.rows[0].email;
    session.role = userDetails.rows[0].role_name;
    res.redirect("/dashboard");
  }
});

app.listen(3000, () => {
  console.log("Server started on port 3000");
});
