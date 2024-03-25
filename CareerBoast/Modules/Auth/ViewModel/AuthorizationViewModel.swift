import Foundation
import Firebase

final class AuthorizationViewModel: ObservableObject {
    @Published var email = String()
    @Published var password = String()
    @Published var wrongUsername = Int()
    @Published var wrongPassword = Int()
    @Published var showLoginScreen = Bool()
    @Published var showAlert: AlertShow?
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
                
                if error?.localizedDescription == "The email address is already in use by another account." {
                    self.showAlert = AlertShow(name: "Пользователь с таким электронным адресом уже зарегистрирован.")
                } else if error?.localizedDescription == "The password must be 6 characters long or more."{
                    self.showAlert = AlertShow(name: "Пароль должен быть длиннее 6 символов")
                } else if error?.localizedDescription == "The email address is badly formatted."{
                    self.showAlert = AlertShow(name: "Некорректный Email адрес")
                }
            } else{
                self.showAlert = AlertShow(name: "Ваш аккаунт успешно зарегестрирован!")
            }
        }
    }
    
    func validateFields() {
        if (email != "" || password != "") {
            wrongPassword = 0
            wrongUsername = 0
            register()
        } else{
            wrongPassword = 1
            wrongUsername = 1
            showAlert = AlertShow(name: "Заполните все поля!")
        }
    }
}
