<?php session_start(); ob_start();
require_once "../_treatments.php";

try 
{
    $post = (isset($_POST) && count($_POST) > 0) ? $_POST : _treatments::throw_exception("Domaine not found !!!");
    $cmd = "SELECT f.*, a.*, t.*
            FROM `formation` f, `user` t, `affectation` a
            WHERE 
                f.id_formation = :id AND
                f.id_formation = a.formation_affectation AND
                a.former_affectation = u.id_user";
    $params = array(array("label" => "id", "value" => $post["idf"]));
    $result = _treatments::execute_command($cmd, $params);
    $formation = (isset($result) && $result !== false && $result->rowCount() > 0) ? $result->fetchObject() : NULL;

    if(isset($formation))
    {
        $_SESSION["formation"] = $formation;
        header("location: ../../sheets/formation.php");
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