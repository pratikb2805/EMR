let express = require("express");
let apiRoutes = require("./api_routes");
let app = express();
var port = process.env.PORT || 8080;
// Use Api routes in the App
app.use("/api", apiRoutes);
mongoose.connect("mongodb://localhost/resthub", { useNewUrlParser: true });
var db = mongoose.connection;

// Added check for DB connection
if (!db) console.log("Error connecting db");
else console.log("Db connected successfully");

// Import Mongoose
let mongoose = require("mongoose");
// Configure bodyparser to handle post requests
app.use(express.urlencoded());
app.get("/", (req, res) => res.send("Hello World with Express"));
app.listen(port, function () {
  console.log("Running RestHub on port " + port);
});
