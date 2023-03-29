//
//  LogInViewModel.swift
//  Food-Task
//
//  Created by Mina Mohareb on 28/03/2023.
//

import Foundation
class LogInViewModel: ObservableObject{
    @Published var isAuthenticated: Bool = false
    
    init(isAuthenticated: Bool) {
        self.isAuthenticated = isAuthenticated
    }
    
    func checkLogIn(username: String, password:String)
    {
        guard let urlLogin = URL(string: "https://dummyjson.com/auth/login") else {
            return
        }
        let params : [String:String] = ["username":username,"password":password]
        let finalBody = try! JSONSerialization.data(withJSONObject: params)
        var request = URLRequest(url: urlLogin)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { data, _, error in
            if error != nil{
                print(error?.localizedDescription ?? "")
                return
            }
            guard let data = data else {return}
            do {
                let logInResponse = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
                print(logInResponse)
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}

extension LogInViewModel
{
    enum LogInError: LocalizedError {
        case custom(error: Error)
        case failedToDecode
        case invalidStatusCode
        
        var errorDescription: String? {
            switch self {
            case .failedToDecode:
                return "Failed to decode response"
            case .custom(let error):
                return error.localizedDescription
            case .invalidStatusCode:
                return "Request doesn't fall in the valid status code"
            }
        }
    }
}
