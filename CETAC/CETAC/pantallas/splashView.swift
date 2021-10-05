//
//  splashView.swift
//  CETAC
//
//  Created by Christian González on 30/09/21.
//

import SwiftUI

struct splashView: View {
    var body: some View {
        ZStack {
            Color(red: 0.643, green: 0.941, blue: 1)
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                
                Image("logo")
                    .resizable()
                    .padding(.all,5.0)
                    .scaledToFit()
                
                Text("Reconocer, comprender y apreciar las emociones y los sentimientos de los demás")
                    .font(Font.custom("callout", size: 25))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40.0)
                
                Spacer()
            }
        }
    }
}

struct splashView_Previews: PreviewProvider {
    static var previews: some View {
        splashView()
    }
}
