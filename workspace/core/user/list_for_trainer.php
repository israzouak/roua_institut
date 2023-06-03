<?php session_start(); ob_start();
require_once "../_treatments.php";

try 
{
    $account = isset($_SESSION['connected']) ? $_SESSION['connected'] : header('location: core/user/logout.php');
    $post = (isset($_POST) && count($_POST) > 0) ? $_POST : _treatments::throw_exception("Data not found !!!");
    $html = '<h5 style="text-align: left;">My Trainees</h5>';
    $cmd = "SELECT d.*, f.*, t.*, s.*
            FROM `domaine` d, `formation` f, `user` t, `subscription` s
            WHERE 
                f.id_formation = :id AND
                f.domaine_formation = d.id_domaine AND
                f.id_formation = s.formation_subscription AND
                s.learner_subscription = t.id_user AND 
                f.state_formation = 1";
    $params = array(array("label" => "id", "value" => $post['idf']));
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
                        <td style="width: 100%; vertical-align: top; padding-left: 10px;">
                            <h6 style="padding: 0px 8px; color: #0099ff;">'.$line->first_name_user.' '.$line->last_name_user.'</h6>
                            <small>
                                <span 
                                    style="
                                        font-size: 11px;
                                        padding: 4px 8px; 
                                        border-top-right-radius: 500px;
                                        border-bottom-right-radius: 500px; 
                                        background-color: #66ccff; color: #fff;"> 
                                    Date Subscription : '.$line->added_date_subscription.'
                                </span>
                                <p style="padding: 8px; font-size: 13px;">              
                                    Birth Date : '.$line->birth_date_user.'<br>
                                    Email : '.$line->email_user.'<br>
                                    Mobile : '.$line->mobile_user.'<br>
                                    Address : '.$line->address_user.'<br>
                                    About this trainee : <br>
                                    '.$line->biography_user.'
                                </p>
                            </small>
                        </td>
                    </tr>
                </table>
                <button 
                    onclick="list_trainees('.$line->id_formation.');"
                    title="Afficher la liste des apprenants" 
                    style="padding: 4px 8px; border: none; border-radius: 5px; 
                           background-color: #66ccff; color: #fff; cursor: pointer;">
                    <small style="font-size: 12px;">
                        <i class="bi bi-list"></i>
                        Trainees
                    </small>
                </button>
                <button 
                    onclick="consult_formation('.$line->id_formation.');"
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
    _treatments::treat_exception($e, 0, 3);
}