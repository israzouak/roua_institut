<?php session_start(); ob_start();
require_once "../_treatments.php";

try 
{
    $account = isset($_SESSION['connected']) ? $_SESSION['connected'] : header('location: core/user/logout.php');
    $post = (isset($_POST) && count($_POST) > 0) ? $_POST : _treatments::throw_exception("Data not found !!!");
    $cmd = "DELETE FROM formation WHERE id_formation = :id";
    $params = array(
        array("label" => "id", "value" => $post["id"])
    );
    $result = _treatments::execute_command($cmd, $params);
    $state = (isset($result) && $result !== false && $result->rowCount() > 0);
    $msg = $state ? "Opération terminée avec succès." : "Echèc de l'opération !";
    echo $msg;
} 
catch (Exception $e) 
{
    _treatments::treat_exception($e, 0, 2);
}