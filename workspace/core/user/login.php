<?php session_start(); ob_start();
require_once "../_treatments.php";

try 
{
    $post = (isset($_POST) && count($_POST) > 0) ? $_POST : _treatments::throw_exception("Login ou mot de passe manquant(s) !!!");
    $cmd = "SELECT * FROM user WHERE login_user LIKE :lgn AND password_user LIKE :pas";
    $params = array(
        array("label" => "lgn", "value" => $post["login"]),
        array("label" => "pas", "value" => $post["password"]));
    $result = _treatments::execute_command($cmd, $params);
    $account = (isset($result) && $result !== false && $result->rowCount() > 0) ? $result->fetchObject() : NULL;

    if(isset($account))
    {
        $_SESSION['connected'] = $account;
        switch($account->type_user)
        {
            case 1: header('location: ../../index.php'); break;
            case 2: header('location: ../../index_trainer.php'); break;
            case 3: header('location: ../../index_admin.php'); break;
        }
    }
    else 
    {
        _treatments::throw_exception("Compte introuvable !!!");
    }
} 
catch (Exception $e) 
{
    _treatments::treat_exception($e, 0, 2);
}