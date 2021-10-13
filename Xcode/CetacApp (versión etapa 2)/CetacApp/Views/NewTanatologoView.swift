//
//  NewTanatologoView.swift
//  CetacApp
//
//  Created by Alejandro Hernandez on 07/10/21.
//

import SwiftUI

struct NewTanatologoView: View {
    @Binding var isPresented: Bool
    @State var name: String = ""
    @State var age: String = ""
    @State var isAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Información")) {
                    TextField("Nombre", text: $name)
                    TextField("Correo", text: $age)
                }
                
                Text("Se enviará vía correo electrónico un enlace para crear la contraseña de la cuenta.")
                
                .alert(isPresented: $isAlert, content: {
                    let title = Text("Error")
                    let message = Text("Por favor, llena todos los campos")
                    return Alert(title: title, message: message)
                })
            }
            .navigationBarTitle("Nuevo Tanatólogo", displayMode: .inline)
            .navigationBarItems(leading: leading, trailing: trailing)
        }
    }
    
    var leading: some View {
        Button(action: {
            isPresented.toggle()
        }, label: {
            Text("Cancelar")
        })
    }
    
    var trailing: some View {
        Button(action: {
            if name != "" && age != "" {
                isPresented.toggle()
            } else {
                isAlert.toggle()
            }
        }, label: {
            Text("Agregar")
        })
    }
}
/*
struct NewTanatologoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTanatologoView()
    }
}
*/
