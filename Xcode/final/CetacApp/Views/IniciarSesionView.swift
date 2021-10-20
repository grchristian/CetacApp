import SwiftUI

struct IniciarSesionView: View {
    @State private var email = ""
    @State private var password = ""
    @State var goToOtherView: Bool = false
    @State var goToOtherViewAdmin: Bool = false
    
    @State var isAlert = false
    
    func login(email: String, password: String) {
        //print(email)
        /*    if(email == "admin") {
                goToOtherViewAdmin.toggle()
                return true
            
            } else {
                goToOtherView.toggle()
                return false
            }*/
        let parameters: [String: Any] = ["email": email, "password": password]
        let urlString = "https://cetac.hernandez.dev/login.php"
        let url = URL(string: urlString)
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(getLoginData.self, from: data)
                        //setLogin(id: decodedData.id, rank: decodedData.rank)
                        if(decodedData.rank == 1) {
                            goToOtherViewAdmin.toggle()
                        } else if (decodedData.rank == 3) {
                            goToOtherView.toggle()
                        }
                    } catch {
                        print("Error, algo salió mal")
                        isAlert.toggle()
                    }
                }
            }
        }.resume()
        
        //print(addLogin())
        }
    
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
            
            Button(action: {
                login(email: self.email, password: self.password)
            }) {
                Text("Iniciar sesión")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }
            
            Spacer()
            HStack(spacing: 0) {
                Button(action: {}) {
                    Text(" ")
                        .foregroundColor(.black)
                }
            }
            
            .alert(isPresented: $isAlert, content: {
                let title = Text("Error")
                let message = Text("Los datos son incorrectos")
                return Alert(title: title, message: message)
            })
        }
        .fullScreenCover(isPresented: $goToOtherViewAdmin) {
            PrincipalView(admin: true)
        }
        .fullScreenCover(isPresented: $goToOtherView) {
            PrincipalView(admin: false)
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

struct IniciarSesionView_Previews: PreviewProvider {
    static var previews: some View {
        IniciarSesionView()
    }
}
