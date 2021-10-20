//login chido

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    @State var goToOtherView: Bool = false
    
    @State var isAlert = false
    @State var alertTitle = ""
    @State var alertMessage = ""
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        let passwordRegEx = ".{8,64}"
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: email)
    }
    
    func login(email: String, password: String) {
        let parameters: [String: Any] = ["email": email, "password": password]
        let urlString = "https://cetac.hernandez.dev/login"
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
                        setLogin(id: decodedData.id, nombre: decodedData.nombre, email: decodedData.email, rank: decodedData.rank, token: decodedData.token)
                        if(decodedData.rank == 1 || decodedData.rank == 2 || decodedData.rank == 3) {
                            goToOtherView.toggle()
                        }
                    } catch {
                        print(error)
                        alertTitle = "Error"
                        alertMessage = "Verifica tu correo y tu contraseña"
                        isAlert.toggle()
                    }
                }
            }
        }.resume()
    }
    
    func forgotPassword(email: String) {
        if(email == "") {
            alertTitle = "Error"
            alertMessage = "Escribe un correo electronico"
            isAlert.toggle()
            return
        }
        if (!isValidEmail(email)) {
            alertTitle = "Error"
            alertMessage = "El correo ingresado no es válido"
            isAlert.toggle()
            return
        }
        
        let parameters: [String: Any] = ["email": email]
        let urlString = "https://cetac.hernandez.dev/forgotPassword.php"
        let url = URL(string: urlString)
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async {
                alertTitle = "Recuperar contraseña"
                alertMessage = "Si el correo está registrado, te enviaremos un correo para recuperar tu contraseña"
                isAlert.toggle()
            }
        }.resume()
    }
    
    var body: some View {
        ZStack{
            //fondo
            Image("fondoLogin")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                //  logo
                Image("logoHD")
                    .resizable()
                    .frame(width: 226.7, height: 137.3)
                    .padding(.top, 40)
                
                Spacer()
                
                //  Form
                VStack(spacing:0){
                    Label {
                        CustomTextfield(placeholder: Text("Correo"), fontName: "NunitoSans-Regular", fontSize: 16, fontColor: Color.white, foregroundColor: Color.white, email: $email)
                    } icon: {
                        Image(systemName: "person")
                            .frame(width: 14, height: 14)
                            .padding(.leading)
                    }.frame(height: 45)
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 0.5).frame(height: 45))
                    
                    Label {
                        CustomSecureField(placeholder: Text("Contraseña"), fontName: "NunitoSans-Regular", fontSize: 16, fontColor: Color.white, password: $password)
                    } icon: {
                        Image(systemName: "lock")
                            .frame(width: 14, height: 14)
                            .padding(.leading)
                    }.frame(height: 45)
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 0.5).frame(height: 45))
                    
                }
                
                //botón de iniciar sesión
                Button(action: {
                    login(email: self.email, password: self.password)
                }){
                    Text("INICIAR SESIÓN")
                        .modifier(CustomTextM(fontName: "NunitoSans-Bold", fontSize: 16, fontColor: Color.black))
                }
                .modifier(SFButton())
                .background(Color.white)
                .padding(.vertical,30)
                
                //Contraseña olvidada
                Text("¿Olvidaste tu contraseña?")
                    .modifier(CustomTextM(fontName: "NunitoSans-Regular", fontSize: 16, fontColor: Color.white))
                    .padding(.bottom,30)
                    .onTapGesture {
                        forgotPassword(email: self.email)
                    }
                    
            
            }
            .foregroundColor(.white)
            .padding(.horizontal,20)
            
        }
        .alert(isPresented: $isAlert, content: {
            return Alert(title: Text(self.alertTitle), message: Text(self.alertMessage))
        })
        .fullScreenCover(isPresented: $goToOtherView) {
            PrincipalView(admin: false)
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct SFButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .frame(height: 56, alignment: .leading)
    }
}

struct CustomTextM: ViewModifier {
    let fontName: String
    let fontSize: CGFloat
    let fontColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.custom(fontName, size: fontSize))
            .foregroundColor(fontColor)
    }
}

struct CustomTextfield: View {
    var placeholder: Text
    var fontName: String
    var fontSize: CGFloat
    var fontColor: Color
    var foregroundColor: Color?
    
    @Binding var email: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if email.isEmpty { placeholder.modifier(CustomTextM(fontName: fontName, fontSize: fontSize, fontColor: fontColor)) }
            TextField("", text: $email, onEditingChanged: editingChanged, onCommit: commit).foregroundColor((foregroundColor != nil) ?  foregroundColor : Color.primary)
                .keyboardType(.emailAddress)
                .disableAutocorrection(true)
        }
    }
}

struct CustomSecureField: View {
    var placeholder: Text
    var fontName: String
    var fontSize: CGFloat
    var fontColor: Color
    
    @Binding var password: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if password.isEmpty { placeholder.modifier(CustomTextM(fontName: fontName, fontSize: fontSize, fontColor: fontColor)) }
            SecureField("", text: $password, onCommit: commit)
                .foregroundColor(.white)
        }
    }
}
    

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
