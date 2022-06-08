<?php
header("Content-Type: application/json");

$dsn = "mysql:host=localhost;port=3306;dbname=IENAC21_Bineau_Dagorn_Dauriac_Ledergerber";
$username = "root";
$password = "";
 
$options = array(
    PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'",
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
);

try {
    $pdo = new PDO($dsn, $username, $password);
    $retour["success"] = true;
    $retour["message"] = "Connexion à la base de donnée réussie"
} catch(Exception $e){
    $retour["success"] = false;
    $retour["message"] = "Connexion à la base de donnée impossible"
}

/*
function read($db, $requestParams){
    $queryParams = [];
    $queryText = "SELECT * FROM `events`";
    $query = $db->prepare($queryText);
    $query->execute($queryParams);
    $events = $query->fetchAll();
    return $events;
} */

switch ($_SERVER["REQUEST_METHOD"]) {
    case "GET":
        break;
    case "POST":
        // we'll implement this later
    break;
    default: 
        throw new Exception("Unexpected Method"); 
    break;
} echo json_encode($retour);