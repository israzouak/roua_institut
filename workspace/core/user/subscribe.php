<?php session_start(); ob_start();
require_once "../_treatments.php";

try 
{
    $post = (isset($_POST) && count($_POST) > 0) ? $_POST : _treatments::throw_exception("Login ou mot de passe manquant(s) !!!");
    $cmd = "INSERT INTO `user`(
                `reference_user`, 
                `first_name_user`, 
                `last_name_user`, 
                `email_user`, 
                `mobile_user`, 
                `address_user`, 
                `birth_date_user`, 
                `login_user`, 
                `password_user`) 
            VALUES (:ref, :fnm, :lnm, :ema, :mob, :adr, :bdt, :lgn, :pas)";
    $params = array(
        array("label" => "ref", "value" => _treatments::generate_reference()),
        array("label" => "fnm", "value" => $post["first_name"]),
        array("label" => "lnm", "value" => $post["last_name"]),
        array("label" => "ema", "value" => $post["email"]),
        array("label" => "mob", "value" => $post["mobile"]),
        array("label" => "adr", "value" => $post["adresse"]),
        array("label" => "bdt", "value" => $post["birth_date"]),
        array("label" => "lgn", "value" => $post["login"]),
        array("label" => "pas", "value" => $post["password"])
    );

    $result = _treatments::execute_command($cmd, $params);
    $state = (isset($result) && $result !== false && $result->rowCount() > 0);

    if($state)
    {
        _treatments::display_message("Opération terminée avec succès", 1, 2);
    }
    else 
    {
        _treatments::throw_exception("Echèc de l'opération !");
    }
} 
catch (Exception $e) 
{
    _treatments::treat_exception($e, 0, 2);
}