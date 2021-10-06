//
//  splashView.swift
//  CETAC
//
//  Created by Christian González on 30/09/21.
//

import SwiftUI

struct splashView: View {
    var body: some View {
        VStack{
            Spacer()
            Image("logo")
                .resizable()
                .padding(.horizontal,30.0)
                .scaledToFit()
            Text("Reconocer, comprender y apreciar las emociones y los sentimientos de los demás")
                .font(Font.custom("helvetica-light", size: 22))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 42)
            
            Spacer()
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(red: 189/255, green: 235/255, blue: 255/255),Color(red: 189/255, green: 235/255, blue: 255/255)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all))
    }
}


struct splashView_Previews: PreviewProvider {
    static var previews: some View {
        splashView()
    }
}
