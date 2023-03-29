//
//  PostCoreDataViewModel.swift
//  Food-Task
//
//  Created by Mina Mohareb on 29/03/2023.
//

import Foundation
import CoreData
import Combine

class PostCoreDataViewModel: ObservableObject{
    let container = NSPersistentContainer(name: "PostModel")
    @Published var postsEntities : [PostEntity] = []
    init()
    {
        container.loadPersistentStores { descripton, error in
                if let error = error{
                    print("Core Data failed to load : \(error.localizedDescription)")
                }
        }
        fetchPosts()
    }
    
    func fetchPosts()
    {
        let request = NSFetchRequest<PostEntity>(entityName: "PostEntity")
        do{
            postsEntities = try container.viewContext.fetch(request)
        }catch let error{
            print("Error fetching, \(error)")
        }
    }
    
    func addPost(body: String){
        
        let newPost = PostEntity(context: container.viewContext)
        newPost.id = UUID()
        newPost.userID = 555
        newPost.title = ""
        newPost.reactions = 1
        newPost.body = body
        
        saveData()
    }
    
    func saveData()
    {
        do{
            try container.viewContext.save()
            fetchPosts()
        }catch let error {
            print("Error saving, \(error)")
        }
    }
    
}
