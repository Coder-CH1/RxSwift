//
//  SignupView.swift
//  RxSwift
//
//  Created by Mac on 16/10/2023.
//

import SwiftUI

struct SignupView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var reEnteredPassword: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Email address")
                .foregroundColor(Color.gray)
                .padding(.horizontal, 16)
                .padding(.vertical, 0)
            ZStack(alignment: .bottom) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.black)
                    .padding(.horizontal, 16)
                CustomTextField(email: $email, placeholder: "Enter email")
            }
            .padding(.bottom, 40)
            Text("Password")
                .foregroundColor(Color.gray)
                .padding(.horizontal, 16)
                .padding(.bottom, 5)
            ZStack(alignment: .bottom) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.black)
                    .padding(.horizontal, 16)
                SecureCustomTextField(text: $password, placeholder: "Enter password")
            }
            
            .padding(.bottom, 40)
            Text("Re-enter Password")
                .foregroundColor(Color.gray)
                .padding(.horizontal, 16)
                .padding(.bottom, 5)
            ZStack(alignment: .bottom) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.black)
                    .padding(.horizontal, 16)
                SecureField("Re-enter password", text: $password)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 5)
            }
            Spacer().frame(height: 120)
            Button(action: {
                //("btn tapped")
            }) {
                Text("Sign up")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 20)
                    .frame(width: 300, height: 50)
                    .background(Color(hex: 0xFA4A0C))
                    .cornerRadius(25)
                    .position(x: 190)
                    .frame(width: 300, height: 50)
                    .controlSize(.large)
            }
        }
        
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
