<?php session_start(); ob_start();
require_once "../_treatments.php";

try 
{
    $html = "";
    $post = (isset($_POST) && count($_POST) > 0) ? $_POST : _treatments::throw_exception("Id formation not found !!!");
    $cmd = "SELECT f.*, a.*, t.*, d.*
            FROM `formation` f, `user` t, `affectation` a, `domaine` d
            WHERE 
                f.domaine_formation = d.id_domaine AND
                f.id_formation = :id AND
                f.id_formation = a.formation_affectation AND
                a.former_affectation = t.id_user";
    $params = array(array("label" => "id", "value" => $post["id"]));
    $result = _treatments::execute_command($cmd, $params);
    $line = (isset($result) && $result !== false && $result->rowCount() > 0) ? $result->fetchObject() : NULL;

    if(isset($line))
    { 
        $html = '
        <div style="text-align: left;">
            <h5 style="padding: 0px 8px; color: #0099ff;">'.$line->title_formation.'</h5>
            <small>
                <span 
                    style="
                        font-size: 11px;
                        padding: 4px 8px; 
                        border-top-right-radius: 500px;
                        border-bottom-right-radius: 500px; 
                        background-color: #66ccff; color: #fff;">
                    Domaine : '.$line->title_domaine.' | 
                    Trainer : '.$line->first_name_user.' '.$line->last_name_user.' | 
                    Add date : '.$line->added_date_formation.'
                </span>
            </small>

            <img 
                style="height: 300px; width: 100%; object-fit: cover;"
                src="uploads/'.$line->image_formation.'" 
                alt="Formation Roua - '.$line->title_formation.'">

            <p style="padding: 8px; font-size: 13px;">              
                Duration : '.$line->duration_formation.' Hours | 
                Price : '.$line->price_formation.' DA | 
                Promotion : '.$line->price_formation.' DA
            </p>
            <b style="padding: 8px; font-size: 13px;">SUMMARY</b>
            <p style="padding: 8px; font-size: 13px;">
                '.$line->summary_formation.'
            </p>

            <div style="text-align: right; padding: 10px; border-bottom: solid 1px #ccc;">
                <button 
                    onclick="window.location.href=\'workspace/signup.html\'" 
                    title="S\'inscrire" 
                    style="padding: 4px 8px; border: none; border-radius: 5px; 
                        background-color: #66ccff; color: #fff; cursor: pointer;">
                    <small style="font-size: 12px;">
                        <i class="bi bi-pencil-square"></i>
                        Subscribe
                    </small>
                </button>            
            </div>
        </div>';
    }

    echo $html;
} 
catch (Exception $e) 
{
    _treatments::treat_exception($e, 0, 3);
}