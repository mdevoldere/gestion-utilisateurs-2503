function CheckInputUser() {

	const name = UserName.value.trim()
	const firstName = UserFirstname.value.trim()
	const email = UserEmail.value.trim()
	const regex = /^[A-Za-zÀ-ÿ]+(?:[ -][A-Za-zÀ-ÿ]+)?$/
	const regexEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/

	if (!regex.test(name) || !regex.test(firstName)) {
		result.textContent = "Les noms ne peuvent contenir que des lettres."
		return false
	}

	else if (!regexEmail.test(email)) {
		result.textContent = "Adresse email invalide"
		return false
	}

	else if (name.length < 3 || firstName.length < 3) {
		result.textContent = "Les noms doivent comporter au moins 3 caractères."
		return false
	}

	else if (ListUser.some(user => user.name === name && user.firstName === firstName)) {
		result.textContent = "Cet utilisateur existe déjà."
		return false
	}
	else if (ListUser.some(user => user.email === UserEmail.value.trim().toLowerCase())) {
		result.textContent = "Cet email est déjà utilisé."
		return false

	}
	/* else if (!ListRole.includes(UserRole.value)) {
		 result.textContent = "Le rôle sélectionné n'est pas valide."
		 return false
	 }*/

	else {
		return true
	}


}

function CheckInputRole() {
	const name = roleName.value.trim()
	const description = roleDescription.value.trim()
	const regex = /^[A-Za-zÀ-ÿ]+$/
	if (!regex.test(name)) {
		result.textContent = "Le nom du rôle ne peut contenir que des lettres."
		return false
	}
	else if (name.length < 3 || name.length > 24) {
		result.textContent = "Le nom du rôle doit comporter entre 3 et 24 caractères."
		return false
	}

	else if (description.length < 10) {
		result.textContent = "La description du rôle doit comporter au moins 10 caractères."
		return false
	}
	else if (ListRole.some(role => role.name === name)) {
		result.textContent = "Ce rôle existe déjà."
		return false
	}


	else {
		return true
	}
}
