const express = require('express')
const app = express()
const db = require('./databaseHandler');








app.get('/', function (req, res) {
})
app.get('/match', async function (req, res) {
    res.json(await db.getMatch())
})

app.listen(3000)
