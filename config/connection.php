<?php
    /*require_once se utiliza para indicarle a php que si el archivo "global.php" eta incluido
     ya no incluirlo denuevo*/
    require_once "global.php";

    //Acceso a base de datos
    $conn = new mysqli(DB_HOST,DB_USERNAME,DB_PASSWORD,DB_NAME);

    //Consulta a base de datos
    mysqli_query($conn,'SET NAMES "'.DB_ENCODE.'"');

    //Si tenemos un posible error en la cadena de conexion
    if(mysqli_connect_errno()){
        printf("Fallo en la conexion con la base de datos: %s \n",mysqli_connect_error());
        exit();
    }

    //Evaluacion si existe una peticion al metodo ejecutar consulta
    if(!function_exists("QueryExec")){
        
        function QueryExec($sql){
            global $conn;
            $query = $conn->query($sql);
            return $query;
        }

        /*Devuelte un fila de resultado como un array asosiativo , 
        lo que se traduce como el metodo print_r*/
        function QueryExec_SimpleRow($sql)
        {
            global $conn;
            $query = $conn->query($sql);
            $row = $query->fetch_assoc();
            return $row;
        }

        /*Devuelve el id generado por una conuslta de un tabla que contenga un atribuo con AUTO_INCREMENT
         es decir, la PK*/
        function QueryExec_returnID($sql)
        {
            global $conn;
            $query = $conn->query($sql);
            return $query->insert_id;
        }

        /* Permite escapar los caracteres establecidos en un sentencia,de tipo declarado utf8 en
         el DB_ENCODE   CleanChain => /Limpiar Candena/  */
        function CleanChain($str)
        {
            global $conn;
            $str = mysqli_real_escape_string($conn,trim($str));
            return htmlspecialchars($str);
        }
    }
?>