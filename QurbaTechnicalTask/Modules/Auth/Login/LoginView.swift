//
//  LoginView.swift
//  QurbaTechnicalTask
//
//  Created by Karim on 17/03/2023.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator
    @StateObject var viewModel = LoginViewModel()
    @State var showPassword: Bool = false
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 24) {
            
            Image("three-girl-friends-having-pizza-bar 1")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .background(Color(#colorLiteral(red: 0.2470588235, green: 0.2470588235, blue: 0.8196078431, alpha: 1)))
                .frame(height: 440)
            
            Text("Welcome")
                .font(.system(size: 20))
                .bold()
                .foregroundColor(Color(#colorLiteral(red: 0.2470588235, green: 0.2470588235, blue: 0.8196078431, alpha: 1)))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            VStack(alignment: .leading, spacing: 6) {
                Text("User Name")
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                
                TextField("Name",
                          text: $viewModel.name ,
                          prompt: Text("Enter your user name")
                    .foregroundColor(Color(#colorLiteral(red: 0.8156862745, green: 0.8352941176, blue: 0.8666666667, alpha: 1)))
                )
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(#colorLiteral(red: 0.8156862745, green: 0.8352941176, blue: 0.8666666667, alpha: 1)), lineWidth: 2)
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            }
            
            VStack(alignment: .leading, spacing: 6) {
                
                Text("Password")
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                
                ZStack {
                    Group {
                        if showPassword {
                            TextField("Password",
                                      text: $viewModel.password,
                                      prompt: Text("Password").foregroundColor(Color(#colorLiteral(red: 0.8156862745, green: 0.8352941176, blue: 0.8666666667, alpha: 1))))
                        } else {
                            SecureField("Password",
                                        text: $viewModel.password,
                                        prompt: Text("Enter your user password").foregroundColor(Color(#colorLiteral(red: 0.8156862745, green: 0.8352941176, blue: 0.8666666667, alpha: 1))))
                        }
                    }
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(#colorLiteral(red: 0.8156862745, green: 0.8352941176, blue: 0.8666666667, alpha: 1)), lineWidth: 2)
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            showPassword.toggle()
                        }) {
                            Image("Visibility")
                        }
                    }
                    .padding()
                }.padding(.horizontal)
            }
            
            Spacer()
            
            Button {
                viewModel.login()
            } label: {
                Text("Sign in")
                    .foregroundColor(.white)
                    .font(.system(size: 17))
                    .bold()
            }
            
            .frame(height: 46)
            .frame(maxWidth: .infinity)
            .background(Color(#colorLiteral(red: 0.2470588235, green: 0.2470588235, blue: 0.8196078431, alpha: 1)))
            .cornerRadius(23)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            
        }
        
        .onChange(of: viewModel.isLoggedIn) { isLoggedIn in
            if isLoggedIn {
                coordinator.root(.tapBar)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
