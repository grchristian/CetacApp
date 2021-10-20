//
//  ViewModel.swift
//  CetacApp
//
//  Created by Equipo 1 on 01/10/21.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var items = [PostModel]()
    let prefixUrl = "https://cetac.hernandez.dev"
    
    /*init() {
        let parameters: [String: Any] = ["token": getToken()]
        fetchUsers(parameters: parameters)
    }*/
    
    // retrive data
    func fetchUsers(parameters: [String: Any]) {
        guard let url = URL(string: "\(prefixUrl)/users") else {
            print("Not found")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in
            if error != nil {
                print("Error: ", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        self.items = result.data
                    }
                } else {
                    print("No data")
                }
            } catch let JsonError {
                print("Fetch JSON Error: ", JsonError.localizedDescription)
            }
        }.resume()
    }
    
    // cretae data
    func createUser(parameters: [String: Any]) {
        guard let url = URL(string: "\(prefixUrl)/createUser") else {
            print("Not found")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in
            if error != nil {
                print("Error: ", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                } else {
                    print("No data")
                }
            } catch let JsonError {
                print("Fetch JSON Error: ", JsonError.localizedDescription)
            }
        }.resume()
    }
    
    // update data
    /*func updateUser(parameters: [String: Any]) {
        guard let url = URL(string: "\(prefixUrl)/updateUser") else {
            print("Not found")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in
            if error != nil {
                print("Error: ", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                } else {
                    print("No data")
                }
            } catch let JsonError {
                print("Fetch JSON Error: ", JsonError.localizedDescription)
            }
        }.resume()
    }*/
    
    // delete data
    func deleteUser(parameters: [String: Any]) {
        guard let url = URL(string: "\(prefixUrl)/deleteUser") else {
            print("Not found")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in
            if error != nil {
                print("Error: ", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                } else {
                    print("No data")
                }
            } catch let JsonError {
                print("Fetch JSON Error: ", JsonError.localizedDescription)
            }
        }.resume()
    }
}
