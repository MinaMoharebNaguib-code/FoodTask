//
//  PostCoreDataView.swift
//  Food-Task
//
//  Created by Mina Mohareb on 29/03/2023.
//

import SwiftUI

struct PostCoreDataView: View {
    @State var check : Int = 0
    @StateObject var postViewModel = PostCoreDataViewModel()
    @State var user = User(id: 555, firstName: "Mina", lastName: "Naguib", maidenName: "Mohareb", email: "mina@gmail.com", phone: "011111", username: "mina", password: "443311", image: "https://robohash.org/hicveldicta.png")
    var body: some View {
        VStack{
            
        }
    }
    func data()
    {
        postViewModel.addPost(body: "Craving something delicious? Try our new dish - a savory mix of roasted vegetables and quinoa, topped with a zesty garlic. Yum!")
        postViewModel.addPost(body: " Need a quick and easy dinner idea? Whip up some creamy macaroni and cheese with bacon bits for a tasty meal that's sure to please")
    }
}

struct PostCoreDataView_Previews: PreviewProvider {
    static var previews: some View {
        PostCoreDataView()
    }
}
