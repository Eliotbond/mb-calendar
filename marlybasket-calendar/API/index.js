const express = require('express')
const app = express()
const db = require('./datasource/matchDb');


/*
 * Route example for GET on url/match
 * When user will reach or request with GET domain.tld/match it will answer with JSON
 */

app.get('/match', async function (req, res) {
    res.json(await db.getMatch())
})

/*
 * Route example for DELETE on url/match
 * When user will request with DELETE domain.tld/match it will answer with JSON
 */
app.delete('/match', async function (req, res) {
    res.json(await db.getMatch())
})


app.listen(3000)
