//
//  listaTanatologosView.swift
//  CETAC
//
//  Created by Christian González on 04/10/21.
//

import SwiftUI

struct listaTanatologosView: View {
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        Text("Ledo")
                        Text("Marlen")
                        Text("Martin")
                    }
                }
                .navigationBarTitle(Text("Tanatólogs"))
            }
        }
        
    }
}

struct listaTanatologosView_Previews: PreviewProvider {
    static var previews: some View {
        listaTanatologosView()
    }
}
