'use strict';

var express = require('express')
var path = require('path');

var app = express();

app.use(express.static(path.join(__dirname, './static')));

app.all('*', (req, res) => {
    return res.sendFile(path.join(__dirname, './static/login.html'));
});

module.exports = app.listen(5050, function(err) {

    if (err) {
        console.log(err)
        return
    }

    console.log(new Date() + ' Listening prod at http://127.0.0.1:' + 5050 + '\n')
});
