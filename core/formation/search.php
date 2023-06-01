<?php session_start(); ob_start();
require_once "../_treatments.php";

try 
{
    $post = $_POST;
    $html = "<h2>Recherche de `".$post['info']."`</h2>";
    $info = '%'.$post['info'].'%';
    $cmd = "SELECT f.*, a.*, t.*, d.*
            FROM `formation` f, `user` t, `affectation` a, `domaine` d
            WHERE 
                (f.title_formation LIKE :inf OR
                f.summary_formation LIKE :inf) AND 
                f.domaine_formation = d.id_domaine AND
                f.id_formation = a.formation_affectation AND
                a.former_affectation = t.id_user AND 
                f.state_formation = 1";
    $params = array(array("label" => "inf", "value" => $info));
    $result = _treatments::execute_command($cmd, $params);
    $list = (isset($result) && $result !== false && $result->rowCount() > 0) ? $result: NULL;

    if(isset($list))
    {
        while($line = $list->fetchObject())
        {
            $html .= '
            <div style="text-align: right; padding: 10px; border-bottom: solid 1px #ccc;">
                <table style="text-align: left; width: 100%;">
                    <tr>
                        <td style="width: 15%; vertical-align: top;">
                            <img 
                                style="height: 100px; width: 150px; object-fit: cover;"
                                src="uploads/'.$line->image_formation.'" 
                                alt="Formation Roua - '.$line->title_formation.'">
                        </td>
                        <td style="width: 85%; vertical-align: top; padding-left: 10px;">
                            <h6 style="padding: 0px 8px; color: #0099ff;">'.$line->title_formation.'</h6>
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
                                <p style="padding: 8px; font-size: 13px;">              
                                Duration : '.$line->duration_formation.' Hours<br>
                                Price : '.$line->price_formation.' DA<br>
                                Promotion : '.$line->price_formation.' DA
                                </p>
                            </small>
                        </td>
                    </tr>
                </table>
                <button 
                    title="Afficher les détails de cette formation" 
                    style="padding: 4px 8px; border: none; border-radius: 5px; 
                           background-color: #66ccff; color: #fff; cursor: pointer;">
                    <small style="font-size: 12px;">
                        <i class="bi bi-search"></i>
                        Détails
                    </small>
                </button>
            </div>';
        }
    }

    echo $html;
} 
catch (Exception $e) 
{
    _treatments::treat_exception($e, 0, 2);
}