var mysql      = require('mysql');
const {json} = require("express");
var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'Emiliedofus2',
    database : 'calendar'
});
var END_OF_SEASON = "22-07-01";

connection.connect();



async function getMatch() {
    try {
        let query = 'SELECT opponent, hall.location, team.name, game.date, game.time FROM game INNER JOIN hall ON fk_hall = hall.id INNER JOIN team on fk_team = team.id;'

        return new Promise(resolve => {
            connection.query(query, function (err, result, fields) {
                if (err) throw err
                console.log(result)
                resolve(result)
            })
        })
    } catch (error){
        return null;
    }

}

async function deleteMatch(matchId){

}

async function updateMatch(match){

}

module.exports = {getMatch, deleteMatch, updateMatch}

