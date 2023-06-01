<?php
// Classe bibliothèque contenant les attributs et les méthodes nécessaires aux traitements
class _treatments
{
    // Tableau contenant la liste des chaînes de caractères nécessaires aux traitements
    private static $strings = array(
        "connection" => "mysql:host=localhost;dbname=roua_db",
        "user"       => "root",
        "password"   => "",
        "online_connection" => "mysql:host=localhost;dbname=????",
        "online_user" => "????",
        "online_password" => "????"
    ); 

    // Méthode pour déclancher une exception (erreur)
    public static function throw_exception($msg) 
    {
        throw new Exception($msg);
    }

    // Méthode pour traiter une exception (erreur)
    public static function treat_exception($exception, $code, $level)
    {
        $_SESSION['connected'] = NULL;
        session_destroy();
        session_regenerate_id();
        self::display_message($exception->getMessage(), $code, $level);
    }

    public static function generate_reference()
    {
        return substr(md5(date("Y-m-d H:i:s.u")), 2, 8);
    }

    // Méthode pour afficher un message
    public static function display_message($message, $code, $level)
    {
        $path = "";

        for($i = 0; $i < $level; $i++)
        {
            $path .= '../';
        }

        $path .= "message.php?cd=".$code."&msg=".$message;
        header("location: ".$path);
    }

    // Méthode pour générer un objet PDO
    private static function generate_pdo()
    {
        $pdo = NULL;
        
        try 
        {
            $pdo = ($_SERVER['SERVER_NAME'] === 'localhost') ? // Si on est en localhost
                    new PDO(self::$strings["connection"], // Créer un objet PDO avec les coordonnées local
                            self::$strings["user"], 
                            self::$strings["password"], 
                            array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8')) : // Sinon si on est en ligne
                    new PDO(self::$strings["online_connection"], // Créer un objet PDO avec les coordonnées de l'hébergeur
                            self::$strings["online_user"], 
                            self::$strings["online_password"], 
                            array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
        } 
        catch (Exception $exception) 
        {
            self::treat_exception($exception, 0, 1);
        }

        return $pdo;
    }

    // Méthode pour récupérer une chaîne de caractères
    public static function get_string($name)
    {
        $constante = "";

        try 
        {
            $constante = (isset(self::$strings[$name])) ? 
                        self::$strings[$name] : 
                        self::throw_exception("ERREUR : CONSTANTE MANQUANTE !!!");
        } 
        catch (Exception $exception) 
        {
            self::treat_exception($exception, 0, 1);
        }

        return $constante;
    }

    // Méthode pour exécuter une commande SQL
    public static function execute_command($cmd, $params)
    {
        $pdo = NULL;
        $stmt = NULL;

        try
        {
            $pdo = self::generate_pdo();
            $stmt = $pdo->prepare($cmd);
         
            if(isset($params))
            {
                foreach($params as $p)
                {
                    $stmt->bindParam($p["label"], $p["value"]); 
                }
            }

            $stmt->execute();
        } 
        catch (Exception $exception)
        {
            self::treat_exception($exception, 0, 1);
        }

        return $stmt;
    }

    // Méthode pour générer le code HTML d'une liste
    public static function display_services($list)
    {
        $html = "";

        try 
        {
            if(isset($list) && $list !== false && $list->rowCount() > 0)
            {
                while($line = $list->fetchObject())
                {
                    $html .= self::get_html_line($line, 3);
                }
            }
        } 
        catch (Exception $exception)
        {
            self::treat_exception($exception, 0, 1);
        }

        return $html;
    }

    // Méthode pour générer le code HTML d'une ligne
    public static function get_html_line($line, $entity)
    {
        $html = "";

        try 
        {
            switch($entity)
            {
                case 1: ; break;
                case 2: ; break;
                case 3: $html = '
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="d-flex py-5 px-4">
                                <i class="fa fa-tools fa-3x text-primary flex-shrink-0"></i>
                                <div class="ps-4">
                                    <h5 class="mb-3">'.$line->intitule_service.'</h5>
                                    <p>'.$line->description_service.'</p>
                                    <!--a class="text-secondary border-bottom" href="">Read More</a-->
                                </div>
                            </div>
                        </div>'; break;
            }
        } 
        catch (Exception $exception)
        {
            self::treat_exception($exception, 0, 1);
        }

        return $html;
    }
}