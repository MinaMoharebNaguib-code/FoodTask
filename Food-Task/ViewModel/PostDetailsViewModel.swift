//
//  PostDetailsViewModel.swift
//  Food-Task
//
//  Created by Mina Mohareb on 28/03/2023.
//

import Foundation
import Combine

class PostDetailsViewModel : ObservableObject
{
    private var bag = Set<AnyCancellable>()
    @Published var user: User = User(id: 105, firstName: "Mina", lastName: "Mohareb", maidenName: "", email: "abc@gmail.com", phone: "01111", username: "mina", password: "12345", image: "https://robohash.org/hicveldicta.png")
    func fetchUser(userId: Int)
    {
        guard let url = URL(string: "https://dummyjson.com/users/\(userId)") else{
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap({
                res in
                guard let response = res.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode <= 299 else {
                    throw UserError.invalidStatusCode
                }
                
                guard let user = try? JSONDecoder().decode(User.self, from: res.data) else {
                    throw UserError.failedToDecode
                }
                
                return user
            }).sink{ res in
                switch res {
                case .failure(let error):
                    print(UserError.custom(error: error))
                default: break
                }
            } receiveValue: { [weak self] user in
                self?.user = user
                
            }.store(in: &bag)
        }
}

extension PostDetailsViewModel{
    enum UserError: LocalizedError {
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
