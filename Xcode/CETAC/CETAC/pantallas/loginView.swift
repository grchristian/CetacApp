import SwiftUI

struct loginView: View {
    @State private var email = ""
    @State private var password = ""
    
    // MARK: - View
    var body: some View {
        VStack() {
            Spacer()
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 260, height: 230)
                .shadow(radius: 10.0, x: 20, y: 10)
                .padding(.bottom, 50)
            
            VStack(alignment: .leading, spacing: 15) {
                TextField("Usuario", text: self.$email)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                
                SecureField("Contraseña", text: self.$password)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }.padding([.leading, .trailing], 27.5)
            
            Button(action: {}) {
                Text("Iniciar sesión")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }.padding(.top, 50)
            
            Spacer()
            HStack(spacing: 0) {
                Button(action: {}) {
                    Text("Conoce CETAC")
                        .foregroundColor(.black)
                }
            }
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(red: 0.950, green: 1, blue: 1),Color(red: 0.999, green: 1, blue: 1)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all))
    }
}

extension Color {
    static var themeTextField: Color {
        return Color(red: 220.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, opacity: 1.0)
    }
}

struct loginView_Previews: PreviewProvider {
    static var previews: some View {
        loginView()
    }
}
