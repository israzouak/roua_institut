<?php session_start(); ob_start();
require_once "../_treatments.php";

try 
{
    $html = '
    <div class="d-flex align-items-center justify-content-between mb-4">
        <h5>Domaines</h5>
        <form method="post" action="core/domaine/add.php">
        <input type="text" name="title" required placeholder="Nouveau domaine">
        <button 
            type="submit"
            onclick="add_domaine();"
            title="Afficher la liste des apprenants" 
            class="btn btn-sm btn-sm btn-primary">
            <small style="font-size: 12px;">
                <i class="bi bi-plus"></i>
                Nouveau
            </small>
        </button>
        </form>
    </div>';
    $cmd = "SELECT * FROM domaine";
    $result = _treatments::execute_command($cmd, NULL);
    $list = (isset($result) && $result !== false && $result->rowCount() > 0) ? $result : NULL;

    if(isset($list))
    {
        while($line = $list->fetchObject())
        {
            $html .= '
            <div style="text-align: right; padding: 10px; border-bottom: solid 1px #ccc;">
                <table style="text-align: left; width: 100%;" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="width: 70%; vertical-align: middle;">
                            <small>'.$line->title_domaine.'</small>
                        </td>
                        <td style="width: 30%; vertical-align: middle; padding-left: 10px; text-align: right;">
                            <button 
                                onclick="add_formation('.$line->id_domaine.');"
                                title="Afficher la liste des formations" 
                                class="btn btn-sm btn-sm btn-primary">
                                <small style="font-size: 12px;">
                                    <i class="bi bi-plus"></i>
                                    Formation
                                </small>
                            </button>
                            <button 
                                onclick="list_formations('.$line->id_domaine.', \''.$line->title_domaine.'\');"
                                title="Afficher la liste des formations" 
                                class="btn btn-sm btn-sm btn-primary">
                                <small style="font-size: 12px;">
                                    <i class="bi bi-list"></i>
                                    Formations
                                </small>
                            </button>
                            <button 
                                onclick="delete_domaine('.$line->id_domaine.');"
                                title="Supprimer un domaine" 
                                class="btn btn-sm btn-sm btn-danger">
                                <small style="font-size: 12px;">
                                    <i class="bi bi-x"></i>
                                    Delete
                                </small>
                            </button>
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