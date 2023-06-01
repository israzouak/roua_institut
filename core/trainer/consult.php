<?php session_start(); ob_start();
require_once "../_treatments.php";

try 
{
    $post = (isset($_POST) && count($_POST) > 0) ? $_POST : _treatments::throw_exception("Reference not found !!!");
    # $post['reference'] = '5678';
    $cmd = "SELECT * FROM user WHERE reference_user LIKE :ref";
    $params = array(array("label" => "ref", "value" => $post["reference"]));
    $result = _treatments::execute_command($cmd, $params);
    $account = (isset($result) && $result !== false && $result->rowCount() > 0) ? $result->fetchObject() : NULL;

    if(isset($account))
    {
        $_SESSION["trainer"] = $account;
        header("location: ../../sheets/trainer.php");
    }
    else 
    {
        _treatments::throw_exception("Trainer not found !!!");
    }
} 
catch (Exception $e) 
{
    _treatments::treat_exception($e, 0, 2);
}