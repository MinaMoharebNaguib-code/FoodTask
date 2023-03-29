//
//  LoginView.swift
//  Food-Task
//
//  Created by Mina Mohareb on 26/03/2023.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack{
                Image("imageLogin")
                    .resizable()
                    .frame(height: 440)
                Spacer()
                LoginDataView().offset(y:24)
                    .padding(.bottom,50)
            }
        }.ignoresSafeArea(.all)
    }
}

struct LoginDataView: View {
    @State var isSecure: Bool = false
    @StateObject private var loginVM = LogInViewModel(isAuthenticated: false)
    @State private var username = ""
    @State private var password = ""
    var body: some View {

        VStack
        {
            VStack{
                Text("Welcowe")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Color2"))
                VStack(spacing: 24)
                {
                    VStack(alignment: .leading, spacing: 6)
                    {
                        Text("User Name")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(Color("Color1"))
                        TextField("Enter your user name",text: $username).textFieldStyle(.roundedBorder).frame(height: 42)
                        
                        
                    }
                    VStack(alignment: .leading, spacing: 6)
                    {
                        Text("Password")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(Color("Color1"))
                        SecureInputView("Enter your password", text: $password)
                    }
                }
            }
            Spacer()
            Button(action: {
                guard !username.isEmpty, !password.isEmpty else{
                    return 
                }
                loginVM.checkLogIn(username: username, password: password)
            }, label: {
                Text("Sign in")
                    .foregroundColor(Color.white)
                    .background(Color("Color2"))
                    .frame(width: UIScreen.main.bounds.width - 32, height: 46)
                    .clipShape(Capsule())
            }).fullScreenCover(isPresented: self.$loginVM.isAuthenticated, content: {
                HomeView.init()
            })
                .foregroundColor(Color.white)
                .background(Color("Color2"))
                .frame(width: UIScreen.main.bounds.width - 32, height: 46)
                .clipShape(Capsule())
                .padding(.top, 40)
        }.padding([.leading,.trailing], 16)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
