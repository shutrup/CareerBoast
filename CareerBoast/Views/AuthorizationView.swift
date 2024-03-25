//
//  AuthorizationView.swift
//  CareerBoast
//
//  Created by Gamıd Khalıdov on 19.03.2024.
//

import SwiftUI
import Firebase

struct AlertShow: Identifiable {
    var id: String { name }
    let name: String
}

struct AuthorizationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showLoginScreen = false
    @State private var showAlert: AlertShow?
    
    
    var body: some View {
        ZStack{
            Color.blue
                .ignoresSafeArea()
            Circle()
                .scale(1.7)
                .foregroundStyle(Color.cyan)
            Circle()
                .scale(1.3)
                .foregroundStyle(Color.white)
            
            VStack{
                Text("Log in or create a new account")
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                    .bold()
                    .padding()
                
                Spacer().frame(height: 10)
                
                TextField("Username", text: $email)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.06))
                    .border(.red, width: CGFloat(wrongPassword))
                    .cornerRadius(10, corners: .allCorners)

                Spacer().frame(height: 10)
                
                TextField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .cornerRadius(36)
                    .background(Color.black.opacity(0.06))
                    .border(.red, width: CGFloat(wrongPassword))
                    .cornerRadius(10, corners: .allCorners)
                
                Spacer().frame(height: 40)
                
                HStack{
                    
                    Button("Sign up"){
                        if (email != "" || password != "") {
                            wrongPassword = 0
                            wrongUsername = 0
                            register()
                            
                            
                        }else{
                            wrongPassword = 1
                            wrongUsername = 1
                            showAlert = AlertShow(name: "Заполните все поля!")
                        }
                        
                    }
                    .foregroundStyle(Color.white)
                    .frame(width: 300, height: 50)
                    .background(.blue)
                    .cornerRadius(10, corners: .allCorners)
                    .alert(item: $showAlert) { alert in
                        Alert(title: Text(alert.name), dismissButton: .cancel())
                    }


                }
                .frame(width: 300)
            }
        }
    }
    func register(){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
                
                if error?.localizedDescription == "The email address is already in use by another account."{
                    showAlert = AlertShow(name: "Пользователь с таким электронным адресом уже зарегестрирован.")
                } else if error?.localizedDescription == "The password must be 6 characters long or more."{
                    showAlert = AlertShow(name: "Пароль должен быть длиннее 6 символов")
                } else if error?.localizedDescription == "The email address is badly formatted."{
                    showAlert = AlertShow(name: "Некорректный Email адрес")
                }
            }else{
                showAlert = AlertShow(name: "Ваш аккаунт успешно зарегестрирован!")
            }
            
        }
        
    }
}

#Preview {
    AuthorizationView()
}
