<?php session_start(); ob_start();
require_once "../_treatments.php";

try 
{
    $html = '
    <span 
        style="margin: 10px; cursor: pointer;" 
        onclick="list_all_formations();">
        Show All
    </span><br>';
    $cmd = "SELECT * 
            FROM domaine 
            WHERE 
                id_domaine in (
                    SELECT DISTINCT d.id_domaine
                    FROM `formation` f, `user` t, `affectation` a, `domaine` d
                    WHERE  
                        f.domaine_formation = d.id_domaine AND
                        f.id_formation = a.formation_affectation AND
                        a.former_affectation = t.id_user AND 
                        f.state_formation = 1) AND 
                state_domaine = 1";
    $result = _treatments::execute_command($cmd, NULL);
    $list = (isset($result) && $result !== false && $result->rowCount() > 0) ? $result : NULL;

    if(isset($list))
    {
        while($line = $list->fetchObject())
        {
            $html .= '
            <span 
                style="margin: 10px; cursor: pointer;" 
                onclick="list_formations('.$line->id_domaine.', \''.$line->title_domaine.'\');">
                '.$line->title_domaine.'
            </span><br>';
        }
    }

    echo $html;

} 
catch (Exception $e) 
{
    _treatments::treat_exception($e, 0, 3);
}