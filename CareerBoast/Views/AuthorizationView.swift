//
//  AuthorizationView.swift
//  CareerBoast
//
//  Created by Gamıd Khalıdov on 19.03.2024.
//

import SwiftUI

struct AuthorizationView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showLoginScreen = false
    
    
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
                
                TextField("Username", text: $username)
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

                HStack{
                    Button("Log in"){
                        
                    }
                    .foregroundStyle(Color.white)
                    .frame(width: 145, height: 50)
                    .background(.blue)
                    .cornerRadius(10, corners: .allCorners)
                    
                    Spacer()
                    
                    Button("Sign in"){
                        
                    }
                    .foregroundStyle(Color.white)
                    .frame(width: 145, height: 50)
                    .background(.blue)
                    .cornerRadius(10, corners: .allCorners)
                    


                }
                .frame(width: 300)
            }
        }

        
    }
}

#Preview {
    AuthorizationView()
}
