//
//  ContentView.swift
//  CetacApp
//
//  Created by Equipo 1 on 29/09/21.
//

import SwiftUI

let sett = true

struct ContentView: View {
    var body: some View {
        UserListView()
        //InicioView()
        /*TabView {
            InicioView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            if(sett) {
            Text("Settings")
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            }
        }*/
        //Text("Hello, world!")
        //    .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
