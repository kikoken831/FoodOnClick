const express = require("express");
const bodyParser = require("body-parser");
const ejs = require("ejs");
const _ = require("lodash");
const pool = require("./db");
const path = require("path");
const { json } = require("body-parser");
const PORT = process.env.PORT || 8000;
const cors = require("cors");
const app = express();
app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
var jsonParser = bodyParser.json();

app.use(express.static(path.join(__dirname, "../client/build")));

//api tester
app.get("/api/login", (req, res) => {
  console.log("called");
  res.json({ users: ["userOne", "userTwo", "userThree"] });
});

//API for LOGIN
app.post("/api/login", jsonParser, async (req, res) => {
  //console.log(req.body);
  const email = req.body.email;
  const password = req.body.password;
  const userDetails = await pool.query(
    "select * from users JOIN user_role using (role_id) where users.email = $1 and users.password = $2",
    [email, password]
  );
  if (userDetails.rows.length == 0) {
    // console.log("invalid login");
    res.sendStatus(401);
  } else {
    console.log("login valid");
    const obj = {
      user_id: userDetails.rows[0].user_id,
      name: userDetails.rows[0].name,
      email: userDetails.rows[0].email,
      role: userDetails.rows[0].role_name,
    };
    // console.log(obj);
    res.send(obj);
  }
});

//API for get ALL inventory items
app.get("/api/home/kitchen", async (req, res) => {
  const menu = await pool.query("select * from inventory");
  console.log(menu.rows);
  res.send(JSON.stringify(menu.rows));
});

//API for get inventory items by id
app.get("/api/home/kitchen/:id", async (req, res) => {
  const id = req.params.id;
  const menu = await pool.query("select * from inventory where id = $1", [id]);
  console.log(menu.rows);
  res.send(JSON.stringify(menu.rows));
});

//API for create new inventory items
app.post("/api/home/kitchen", jsonParser, async (req, res) => {
  console.log(req.body);
  const name = req.body.name;
  const unit = req.body.unit;
  const qty = req.body.qty;
  await pool.query("insert into inventory (name,unit,qty) values ($1,$2,$3)", [
    name,
    unit,
    qty,
  ]);
  res.sendStatus(200);
});

//API for update inventory item
app.put("/api/home/kitchen/:id", jsonParser, async (req, res) => {
  console.log(req.body);
  const id = req.params.id;
  const name = req.body.name;
  const unit = req.body.unit;
  const qty = req.body.qty;
  await pool.query(
    "UPDATE INVENTORY SET NAME = $1, UNIT = $2, QTY = $3 WHERE ID = $4",
    [name, unit, qty, id]
  );
  console.log([name, unit, qty, id]);
  res.sendStatus(200);
});

//API for update inventory item
app.delete("/api/home/kitchen/:id", async (req, res) => {
  const id = req.params.id;
  await pool.query("DELETE FROM INVENTORY WHERE ID = $1", [id]);
  console.log("Deleted");
  res.sendStatus(200);
});

app.listen(PORT, () => {
  console.log(`Server started on PORT: ${PORT}`);
});
