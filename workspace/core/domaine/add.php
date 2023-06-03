<?php session_start(); ob_start();
require_once "../_treatments.php";

try 
{
    $account = isset($_SESSION['connected']) ? $_SESSION['connected'] : header('location: core/user/logout.php');
    $post = (isset($_POST) && count($_POST) > 0) ? $_POST : _treatments::throw_exception("Data not found !!!");
    $cmd = "INSERT INTO `domaine`(`reference_domaine`, `title_domaine`) VALUES (:ref, :tit)";
    $params = array(
        array("label" => "ref", "value" => _treatments::generate_reference()),
        array("label" => "tit", "value" => $post["title"])
    );
    $result = _treatments::execute_command($cmd, $params);
    $state = (isset($result) && $result !== false && $result->rowCount() > 0);
    $msg = $state ? "Opération terminée avec succès." : "Echèc de l'opération !";
    header('location: ../../index_admin.php');
} 
catch (Exception $e) 
{
    _treatments::treat_exception($e, 0, 2);
}