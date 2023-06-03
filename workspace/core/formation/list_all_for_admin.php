<?php session_start(); ob_start();
require_once "../_treatments.php";

try 
{
    $html = '<h5 style="text-align: left">All Formations</h5>';
    $cmd = "SELECT * FROM `formation`";
    $params = NULL;
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
                                src="../uploads/'.$line->image_formation.'" 
                                alt="Formation Roua - '.$line->title_formation.'">
                        </td>
                        <td style="width: 60%; vertical-align: top; padding-left: 10px;">
                            <h6 style="padding: 0px 8px; color: #0099ff;">'.$line->title_formation.'</h6>
                            <small>
                                <p style="padding: 8px; font-size: 13px;">              
                                Duration : '.$line->duration_formation.' Hours<br>
                                Price : '.$line->price_formation.' DA<br>
                                Promotion : '.$line->promotion_formation.' DA
                                </p>
                            </small>
                        </td>
                    </tr>
                </table>
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
                <button 
                    onclick="delete_formation('.$line->id_formation.');"
                    title="Delete this formation" 
                    style="padding: 4px 8px; border: none; border-radius: 5px; 
                        background-color: #dc0000; color: #fff; cursor: pointer;">
                    <small style="font-size: 12px;">
                        <i class="bi bi-x"></i>
                        Delete
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