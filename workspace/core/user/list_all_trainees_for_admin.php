<?php session_start(); ob_start();
require_once "../_treatments.php";

try 
{
    $account = isset($_SESSION['connected']) ? $_SESSION['connected'] : header('location: core/user/logout.php');
    $html = '
    <div class="d-flex align-items-center justify-content-between mb-4">
        <h5 style="text-align: left;">All Trainees</h5>     
    </div>';
    $cmd = "SELECT * FROM `user` WHERE type_user = 1";
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
                        <td style="width: 100%; vertical-align: top; padding-left: 10px;">
                            <h6 style="padding: 0px 8px; color: #0099ff;">'.$line->first_name_user.' '.$line->last_name_user.'</h6>
                            <small>
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
            </div>';
        }
    }

    echo $html;
} 
catch (Exception $e) 
{
    _treatments::treat_exception($e, 0, 3);
}