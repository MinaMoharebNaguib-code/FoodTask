//
//  HomeViewModel.swift
//  Food-Task
//
//  Created by Mina Mohareb on 28/03/2023.
//

import Foundation
import Combine
class HomeViewModel: ObservableObject
{
    private var bag = Set<AnyCancellable>()
    @Published var posts: Posts = Posts(posts: [], total: 0, skip: 0, limit: 0)
    func fetchPosts()
    {
        guard let url = URL(string: "https://dummyjson.com/posts") else{
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap({
                res in
                guard let response = res.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode <= 299 else {
                    throw HomeError.invalidStatusCode
                }
                guard let posts = try? JSONDecoder().decode(Posts.self, from: res.data) else {
                    throw HomeError.failedToDecode
                }
                return posts
            }).sink {
                res in
                switch res {
                case .failure(let error):
                    print(HomeError.custom(error: error))
                default: break
                }
            } receiveValue: { [weak self] posts in
                self?.posts = posts
            }.store(in: &bag)
    }
}
extension HomeViewModel {
    enum HomeError: LocalizedError {
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
