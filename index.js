var express = require("express");
var mysql = require("mysql");

//Connect to MySQL
var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "testmanga",
});
require("events").EventEmitter.defaultMaxListeners = 20; //fix memory leaked

//Create Restful
var app = express();
var publicDir = __dirname + "/public/"; //Set static dir for display image local by url
app.use(express.static(publicDir));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
//Get all banner
app.get("/banner", (req, res, next) => {
    con.query("SELECT * FROM banner", function (error, result, fields) {
        con.on("error", function (err) {
            console.log("[MY SQL ERROR]", err);
        });
        if (result && result.length) {
            res.end(JSON.stringify(result));
        } else {
            res.end(JSON.stringify("No banner here"));
        }
    });
});

//Get all Comic
app.get("/comic", (req, res, next) => {
    con.query("SELECT * FROM manga", function (error, result, fields) {
        con.on("error", function (err) {
            console.log("[MY SQL ERROR]", err);
        });
        if (result && result.length) {
            res.end(JSON.stringify(result));
        } else {
            res.end(JSON.stringify("No comic here"));
        }
    });
});

//Get chapter by mangaID
app.get("/chapter/:mangaid", (req, res, next) => {
    con.query(
        "SELECT * FROM chapter where MangaID=?",
        [req.params.mangaid],
        function (error, result, fields) {
            con.on("error", function (err) {
                console.log("[MY SQL ERROR]", err);
            });
            if (result && result.length) {
                res.end(JSON.stringify(result));
            } else {
                res.end(JSON.stringify("No chapter here"));
            }
        }
    );
});

//Get Image by Chapter ID
app.get("/links/:chapterid", (req, res, next) => {
    con.query(
        "SELECT * FROM link where ChapterId=?",
        [req.params.chapterid],
        function (error, result, fields) {
            con.on("error", function (err) {
                console.log("[MY SQL ERROR]", err);
            });
            if (result && result.length) {
                res.end(JSON.stringify(result));
            } else {
                res.end(JSON.stringify("No links here"));
            }
        }
    );
});

//get All Category
app.get("/categories", (req, res, next) => {
    con.query("SELECT * FROM Category", function (error, result, fields) {
        con.on("error", function (err) {
            console.log("[MY SQL ERROR]", err);
        });
        if (result && result.length) {
            res.end(JSON.stringify(result));
        } else {
            res.end(JSON.stringify("No category here"));
        }
    });
});

//Filter
app.post("/filter", (req, res, next) => {
    var post_data = req.body; //GET POST DATA FROM POST REQUEST
    var array = JSON.parse(post_data.data); //Parse 'data' field from POST REQUEST TO JSON ARRAY
    var query =
        "SELECT * FROM manga WHERE ID IN (SELECT MangaID FROM mangacategory"; //default query
    if (array.length > 0) {
        query += " GROUP BY MangaID";
        if (array.length == 1)
            //if user just submit 1 category
            query +=
                " HAVING SUM(CASE WHEN CategoryID = " +
                array[0] +
                " THEN 1 ELSE 0 END) > 0)";
        else {
            //if user submit more than 1 category
            for (var i = 0; i < array.length; i++) {
                if (i == 0)
                    //first condition
                    query +=
                        " HAVING SUM(CASE WHEN CategoryID = " +
                        array[0] +
                        " THEN 1 ELSE 0 END) > 0 AND";
                else if (i == array.length - 1)
                    //last condition
                    query +=
                        " SUM(CASE WHEN CategoryID =" +
                        array[i] +
                        " THEN 1 ELSE 0 END) >0)";
                else
                    query +=
                        " SUM(CASE WHEN CategoryID =" +
                        array[i] +
                        " THEN 1 ELSE 0 END) >0 AND";
            }
        }
        con.query(query, function (error, result, fields) {
            con.on("error", function (err) {
                console.log("[MY SQL ERROR]", err);
            });
            if (result && result.length) {
                res.end(JSON.stringify(result));
            } else {
                res.end(JSON.stringify("No comic here"));
            }
        });
    }
});

//Search manga by name
app.post("/search", (req, res, next) => {
    var post_data = req.body; //Get body post
    var name_search = post_data.search; //Get "search" data from Post Request

    var query = "SELECT * FROM manga WHERE Name Like '%" + name_search + "%'";
    con.query(query, function (error, result, fields) {
        con.on("error", function (err) {
            console.log("[MY SQL ERROR]", err);
        });
        if (result && result.length) {
            res.end(JSON.stringify(result));
        } else {
            res.end(JSON.stringify("No comic here"));
        }
    });
});

//Start server
app.listen(3000, () => {
    console.log("SERVER IS RUNNING ON PORT 3000");
});
