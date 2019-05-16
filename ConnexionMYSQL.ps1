[void][system.reflection.Assembly]::LoadWithPartialName("MySql.Data")

clear
$run = 1



function Execute-MySQLNonQuery($conn, [string]$query) { 
  $command = $conn.CreateCommand()                  # Create command object
  $command.CommandText = $query                     # Load query into object
  $RowsInserted = $command.ExecuteNonQuery()        # Execute command
  $command.Dispose()                                # Dispose of command object
  if ($RowsInserted) { 
    return $RowInserted 
  } else { 
    return $false 
  } 
} 



function conenctionSQLAdd($val , $mdp ,$jeu){
    Try{
        $connStr = "server=localhost;port=3306;uid=root;pwd=1234;database=ga2019;Pooling=FALSE" 
        $conn = New-Object MySql.Data.MySqlClient.MySqlConnection($connStr) 
        $conn.Open()
        $query = "INSERT INTO joueurs (pseudo , mdp , id_jeu)  VALUES ('$val', '$mdp' , '$jeu')" 
        $Rows = Execute-MySQLNonQuery $conn $query 
         
       
         
    }Catch
    {
        $err_detail = $_.Exception.Message
        $err = $err+ "`t Probleme connexion SQL requete  ==> $err_detail `n"
        echo $err_detail
        exit
    }

}
function conenctionSQLRemove($val){
    Try{
        $connStr = "server=localhost;port=3306;uid=root;pwd=1234;database=ga2019;Pooling=FALSE" 
        $conn = New-Object MySql.Data.MySqlClient.MySqlConnection($connStr) 
        $conn.Open()
        $query = "DELETE FROM joueurs WHERE pseudo like '%"+ $val + "%'"
        $Rows = Execute-MySQLNonQuery $conn $query 
         
       
         
    }Catch
    {
        $err_detail = $_.Exception.Message
        $err = $err+ "`t Probleme connexion SQL requete  ==> $err_detail `n"
        echo $err_detail
        exit
    }

}
