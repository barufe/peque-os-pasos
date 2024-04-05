//
//  LoginView.swift
//  SmallSteps
//
//  Created by barufe on 1/04/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    var coordinator: LoginCoordinator
    @State private var email: String = ""
    @State private var contraseña: String = ""
    
    
    init(viewModel: LoginViewModel, coordinator: LoginCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
    }
    
    var body: some View {
        ZStack {
            Image("f-registro")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack(alignment: .center){
                
                Text("Iniciar Sesión")
                    .font(.custom("Bhavuka", size: 40))
                    .padding(.bottom, 14)
                
                VStack(alignment: .leading) {
                    Text("Información de tu cuenta")
                        .font(.custom("DM Sans", size: 17))
                        .padding(.leading, 14)
                    
                    if !email.isEmpty {
                        Text("Email")
                            .font(.custom("DM Sans", size: 10))
                            .foregroundColor(.gray)
                    }
                    
                    TextField("Email", text: $email, onEditingChanged: { editing in
                    })
                    .padding(.bottom, 10)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    
                    if !contraseña.isEmpty {
                        Text("Contraseña")
                            .font(.custom("DM Sans", size: 10))
                            .foregroundColor(.gray)
                    }
                    
                    TextField("Contraseña", text: $contraseña, onEditingChanged: { editing in
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        
                    })
                    {Text("¿Olvidaste tu contraseña?")
                            .foregroundColor(.gray)
                        .font(.custom("DM Sans", size: 17))}
                    .padding(.top, 24)
                    
                    
                    
                }.padding([.leading, .trailing], 20)
                
                Button(action: {
                    viewModel.login(user: LoginUserParameters(email: email, password: contraseña)) { result in
                        switch result {
                        case .success(let responseEntity):
                            showAlert(title: "Login exitoso", message: responseEntity.message)
                        case .failure(let error):
                            showAlert(title: "Error", message: error.localizedDescription)
                        }
                    }
                })
                {
                    Text("Iniciar Sesión")
                        .font(.custom("DM Sans", size: 20))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .frame(width: 319, height: 42)
                        .background(Color(red: Double(0x9F) / 255.0, green: Double(0x9A) / 255.0, blue: Double(0xEB) / 255.0))
                        .cornerRadius(16)
                }.padding(.top, 40)
                
                Button(action: {
                    // Acción para el botón "Continuar con Google"
                }) {
                    HStack {
                        Image("google")
                            .foregroundColor(.black)
                        Text("Continuar con Google?")
                            .foregroundColor(.black)
                            .font(.custom("DM Sans", size: 20))
                        
                    }
                    .frame(width: 290, height: 15)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
                }
                .padding(.top, 10)
                HStack{
                    Text("¿Aun no tienes una cuenta?")
                        .foregroundColor(.gray)
                        .font(.custom("DM Sans", size: 14))
                    
                    Button(action: {
                        coordinator.goToRegister()
                    })
                    {Text("Registrate")
                            .foregroundColor(.black)
                        .font(.custom("DM Sans", size: 14))}
                }
                .padding(.top, 40)
                
                
            }
        }
    }
}

#Preview {
    LoginViewFactory.createPreview()
}
