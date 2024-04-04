//
//  RegisterView.swift
//  SmallSteps
//
//  Created by barufe on 3/04/24.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var viewModel: RegisterViewModel
    var coordinator: RegisterCoordinator
    @State private var user: String = ""
    @State private var email: String = ""
    @State private var contraseña: String = ""
    
    
    init(viewModel: RegisterViewModel, coordinator: RegisterCoordinator) {
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

                Text("Crear cuenta")
                    .font(.custom("Bhavuka", size: 40))
                    .padding(.bottom, 14)
                
                VStack(alignment: .leading) {
                   
                    if !user.isEmpty {
                        Text("Nombre")
                            .font(.custom("DM Sans", size: 10))
                            .foregroundColor(.gray)
                    }
                    
                    TextField("Nombre", text: $user, onEditingChanged: { editing in
                    })
                    .padding(.bottom, 10)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
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
                    
                    
                    
                }.padding([.leading, .trailing], 20)
                
                Button(action: {
                    viewModel.registerUser(user: UserParameters(username: user, email: email, password: contraseña)) { result in
                        switch result {
                        case .success(let responseEntity):
                            showAlert(title: "Registro exitoso", message: responseEntity.message)
                        case .failure(let error):
                            showAlert(title: "Error", message: error.localizedDescription)
                        }
                    }
                })
                {
                    Text("Registrarse")
                        .font(.custom("DM Sans", size: 20))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .frame(width: 319, height: 42)
                        .background(Color(red: Double(0x9F) / 255.0, green: Double(0x9A) / 255.0, blue: Double(0xEB) / 255.0))
                        .cornerRadius(16)
                }.padding(.top, 40)
                
                HStack{
                    Text("¿Ya tienes una cuenta?")
                        .foregroundColor(.gray)
                        .font(.custom("DM Sans", size: 14))
                    
                    Button(action: {
                        coordinator.goToLogin()
                    })
                    {Text("Acceso")
                            .foregroundColor(.black)
                        .font(.custom("DM Sans", size: 14))}
                }.padding(.top, 20)
                
                VStack{
                    Text("Al crear una cuenta o firmar, acepta nuestros")
                        .foregroundColor(.gray)
                        .font(.custom("DM Sans", size: 14))
                    
                    Button(action: {
                        
                    })
                    {Text("Términos y condiciones")
                            .foregroundColor(.black)
                        .font(.custom("DM Sans", size: 14))}
                }.padding(.top, 10)
                
                
            }
        }
    }
}

func showAlert(title: String, message: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
    UIApplication.shared.windows.first?.rootViewController?.present(alertController, animated: true, completion: nil)
}

#Preview {
    RegisterViewFactory.createPreview()
}
