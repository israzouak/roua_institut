<?php session_start(); ob_start();
require_once "../_treatments.php";

try 
{
    $account = isset($_SESSION['connected']) ? $_SESSION['connected'] : header('location: core/user/logout.php');
    $post = (isset($_POST) && count($_POST) > 0) ? $_POST : _treatments::throw_exception("Data not found !!!");
    $cmd = "INSERT INTO `subscription`(`reference_subscription`, `learner_subscription`, `formation_subscription`) 
                 VALUES  (:ref, :idu, :idf)";
    $params = array(
        array("label" => "ref", "value" => _treatments::generate_reference()),
        array("label" => "idu", "value" => $account->id_user),
        array("label" => "idf", "value" => $post["idf"])
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