//
//  SearchViewModel.swift
//  Food-Task
//
//  Created by Mina Mohareb on 29/03/2023.
//

import Foundation

class SearchViewModel: ObservableObject{
    @Published var searchPosts = Posts(posts: [], total: 0, skip: 0, limit: 0)
    func fetchSearch(search: String)
    {
        guard let url = URL(string: "https://dummyjson.com/posts/search?q=\(search)") else{
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else
            {
                return
            }
            do{
                let searchPosts = try JSONDecoder().decode(Posts.self, from: data)
                
                DispatchQueue.main.async {
                    self.searchPosts = searchPosts
                }
            }catch
            {
                print(error)
            }
        }
        task.resume()
    }
}
