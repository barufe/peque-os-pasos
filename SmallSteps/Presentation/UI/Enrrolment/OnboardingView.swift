//
//  StartView.swift
//  SmallSteps
//
//  Created by T09870 on 25/02/24.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewmodel: OnboardingViewModel
    var coordinator: OnboardingCoordinator
    
    init(viewmodel: OnboardingViewModel, coordinator: OnboardingCoordinator) {
        self.viewmodel = viewmodel
        self.coordinator = coordinator
    }
    
    var body: some View {
        
        ZStack {
            // Imagen de fondo que ocupa toda la pantalla
            Image("fondo")
                   .resizable()
                   .aspectRatio(contentMode: .fill)
                   .edgesIgnoringSafeArea(.all)
                   
            
            // Imagen en la parte superior
            VStack(alignment: .center) {
                
                Text("Bienvenidos!")
                    .font(.custom("Bhavuka", size: 40))
                    .padding(.bottom, 14)
                
                Button(action: {
                    coordinator.goToLogin()
                }) {
                    Text("Iniciar Sesión")
                        .font(.custom("DM Sans", size: 20))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 319, height: 42)
                        .background(Color(red: Double(0x9F) / 255.0, green: Double(0x9A) / 255.0, blue: Double(0xEB) / 255.0))
                        .cornerRadius(16)
                }.padding(.top, 20)
                
                Button(action: {
                    coordinator.goToRegister()
                }) {
                    Text("Registrarse")
                        .font(.custom("DM Sans", size: 20))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 319, height: 42)
                        .background(Color(red: Double(0x9F) / 255.0, green: Double(0x9A) / 255.0, blue: Double(0xEB) / 255.0))
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
                .padding(.top, 70)
            }
        }
    }
}

#Preview {
    OnboardingViewFactory.createPreview()
}
