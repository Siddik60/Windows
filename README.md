function CreateAccount(){
    $user = Read-Host -prompt "Entrer le nom du nouveau utilisateur "
    $password =  Read-Host -prompt "Entrer le mot de passe :"
    echo "1.Fortnite , 2.Far cry 5 3.Counter Strike"
    $jeux = Read-Host -prompt "Entrer le id du jeux :"
    $securedPassword = ConvertTo-SecureString -String $password -AsPlainText -Force
    New-LocalUser -Name $user -Password $securedPassword
    conenctionSQLAdd $user $password $jeux

}
function DeleteAccount(){
    $user = Read-Host -prompt "Entrer le nom d'utilisateur à supprimer"
    Remove-LocalUser -Name $user
    conenctionSQLRemove $user
}


do{
    echo "1 . Créer un compte "
    echo "2 . Supprimer un Compte "
    echo "3 . Lister les utilsateurs"    
    echo "4 . Arretez le script"    
    $choix = Read-Host -prompt 'Choisiez votre option : '
    if($choix -eq "2"){
        DeleteAccount
    }ElseIf($choix -eq "1"){
        
      CreateAccount
    }ElseIF($choix -eq "3"){
        Get-WmiObject -Class Win32_UserAccount
       
    }
    Else{
       break
    }
}while($run -eq 1)
