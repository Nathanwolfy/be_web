<?php

require_once("config.php");
$db = new PDO($dsn, $username, $password, $options);

function read($db, $requestParams){
    $queryParams = [];
    $queryText = "SELECT * FROM `events`";
    if (isset($requestParams["from"]) && isset($requestParams["to"])) { 
        $queryText .= " WHERE `end_date`>=? AND `start_date` < ?;";  
        $queryParams = [$requestParams["from"], $requestParams["to"]];  
    }

    $query = $db->prepare($queryText);
    $query->execute($queryParams);
    $events = $query->fetchAll();
    return $events;
}

function create($db, $event){
    $queryText = "INSERT INTO `events` SET
        `start_date`=?,
        `end_date`=?,
        `text`=?";
    $queryParams = [
        $event["start_date"],
        $event["end_date"],
        $event["text"]
    ];
    $query = $db->prepare($queryText);
    $query->execute($queryParams);
    return $db->lastInsertId();
}
// update an event
function update($db, $event, $id){
    $queryText = "UPDATE `events` SET
        `start_date`=?,
        `end_date`=?,
        `text`=?
        WHERE `id`=?";
    $queryParams = [
        $event["start_date"],
        $event["end_date"],
        $event["text"],
        $id
    ];
    $query = $db->prepare($queryText);
    $query->execute($queryParams);
}
// delete an event
function delete($db, $id){
    $queryText = "DELETE FROM `events` WHERE `id`=? ;";
    $query = $db->prepare($queryText);
    $query->execute([$id]);
}

switch ($_SERVER["REQUEST_METHOD"]) {
    case "GET":
        $result = read($db, $_GET);
        break;
    case "POST": 
        $requestPayload = json_decode(file_get_contents("php://input")); 
        $id = $requestPayload->id; 
        $action = $requestPayload->action; 
        $body = (array) $requestPayload->data; 
        $result = [ 
            "action" => $action 
        ]; 
        if ($action == "inserted") {; 
            $databaseId = create($db, $body); 
            $result["tid"] = $databaseId; 
        } elseif($action == "updated") { 
            update($db, $body, $id); 
        } elseif($action == "deleted") { 
            delete($db, $id); 
        } 
    break; 
   
    default: 
        throw new Exception("Unexpected Method"); 
    break;
}
header("Content-Type: application/json");
echo json_encode($result);