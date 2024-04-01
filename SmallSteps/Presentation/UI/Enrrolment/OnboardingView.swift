//
//  StartView.swift
//  SmallSteps
//
//  Created by T09870 on 25/02/24.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewmodel: StartViewModel
    var coordinator: StartCoordinator
    
    init(viewmodel: StartViewModel, coordinator: StartCoordinator) {
        self.viewmodel = viewmodel
        self.coordinator = coordinator
    }
    
    
    var body: some View {
        
        ZStack {
            // Imagen de fondo que ocupa toda la pantalla
            Image("gradient")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            // Imagen en la parte superior
            Image("launchImg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .offset(y: -200)
            
            // Imagen en la parte inferior
            Image("onbordingImg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(height: 200)
                .offset(y: 200)
            
            VStack {
                Spacer()
                Button(action: {
                    // Acción para el botón "Iniciar Sesión"
                }) {
                    Text("Iniciar Sesión")
                        .font(.custom("Raleway", size: 20))
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 319, height: 42)
                        .background(Color(red: 1.0, green: 0.61, blue: 0.81))
                        .cornerRadius(16)
                }
                
                Button(action: {
                    // Acción para el botón "Registrarse"
                }) {
                    Text("Registrarse")
                        .font(.custom("Raleway", size: 20))
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 319, height: 42)
                        .background(Color(red: 1.0, green: 0.61, blue: 0.81))
                        .cornerRadius(16)
                }.padding(.top, 20)
                
                Button(action: {
                    // Acción para el botón "Continuar con Google"
                }) {
                    HStack {
                        Image("google")
                            .foregroundColor(.black)
                        Text("Continuar con Google?")
                            .foregroundColor(.black)
                            .font(.custom("Raleway", size: 20))
                        
                    }
                    .frame(width: 290, height: 15)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.black, lineWidth: 1)
                    )
                }
                .padding(.top, 70)
            }
            .padding(.bottom, 120)
            .padding()
        }
    }
    //Text(Constant.environment.baseURL)
    //Text(Constant.environment.baseDomain)
}

#Preview {
    StartViewFactory.createPreview()
}
