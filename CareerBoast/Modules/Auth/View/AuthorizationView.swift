//
//  AuthorizationView.swift
//  CareerBoast
//
//  Created by Gamıd Khalıdov on 19.03.2024.
//

import SwiftUI

struct AuthorizationView: View {
    @StateObject private var vm = AuthorizationViewModel()
    
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
                Text("Create a new account")
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                    .bold()
                    .padding()
                
                Spacer().frame(height: 10)
                
                TextField("Username", text: $vm.email)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.06))
                    .border(.red, width: CGFloat(vm.wrongPassword))
                    .cornerRadius(10, corners: .allCorners)

                Spacer().frame(height: 10)
                
                TextField("Password", text: $vm.password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .cornerRadius(36)
                    .background(Color.black.opacity(0.06))
                    .border(.red, width: CGFloat(vm.wrongPassword))
                    .cornerRadius(10, corners: .allCorners)
                
                Spacer().frame(height: 40)
                
                HStack {
                    Button("Sign up"){
                        vm.validateFields()
                    }
                    .foregroundStyle(Color.white)
                    .frame(width: 300, height: 50)
                    .background(.blue)
                    .cornerRadius(10, corners: .allCorners)
                    .alert(item: $vm.showAlert) { alert in
                        Alert(title: Text(alert.name), dismissButton: .cancel())
                    }
                }
                .frame(width: 300)
            }
        }
    }
}

#Preview {
    AuthorizationView()
}
