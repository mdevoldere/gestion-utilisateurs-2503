
// Formulaire utilisateur-ajouter

const AdduserForm = document.getElementById("add-user")
const UserName = document.getElementById("user-name")
const UserFirstname = document.getElementById("user-firstname")
const UserEmail = document.getElementById("user-email")
const UserRole = document.getElementById("user-role")
const UserDate = document.getElementById("user-date")
const UserDescription = document.getElementById("user-description")
const AddUserButton = document.getElementById("btn-subuser")


//formulaire role-ajouter
const roleName = document.getElementById("role-name")
const roleDescription = document.getElementById("role-description")
const AddRoleButton = document.getElementById("btn-subrole")

//  Tableau utilisateur.html
const UserTable = document.getElementById("table-user")

//tableau role.html
const RoleTable = document.getElementById("table-role")

ListUser = []
ListRole = [] 


function AddUser(event) {
    event.preventDefault()

    const isValid = CheckInputUser()

    if (isValid) {

        ListUser.push({
            name: UserName.value.trim(),
            firstName: UserFirstname.value.trim(),
            email: UserEmail.value.trim().toLowerCase(),
            role: UserRole.value,
            date: UserDate.value,
            description: UserDescription.value

        })
        result.textContent = "Utilisateur ajouté"
    }

    UserName.value = ""
    UserFirstname.value = ""
    UserEmail.value = ""
    UserRole.value = ""
    UserDate.value = ""
    UserDescription.value = ""


}

function AddRole(event) {
    event.preventDefault()


    const isValid = CheckInputRole()

    if (isValid) {
        ListRole.push({
            name: roleName.value,
            description: roleDescription.value

        })
        result.textContent = "Rôle ajouté"


}
    roleName.value = ""
    roleDescription.value = ""

}

/*

   X Le nom, prénom contiennent au moins 2 caractères. X
   X Le nom et prénom contiennent uniquement des lettres. X
    Le nom et prénom peut contenir 1 espace ou 1 tiret s'il s'agit d'un nom composé.
   X L'adresse email doit être au bon format. X
   X Le libellé d'un rôle doit contenir entre 3 et 24 lettres (aucun autre caractère autorisé). X

*/

AddUserButton.addEventListener("click", AddUser)
//AddRoleButton.addEventListener("click", AddRole)




console.log(ListUser)

