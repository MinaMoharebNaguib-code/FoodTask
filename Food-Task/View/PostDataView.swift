//
//  PostDataView.swift
//  Food-Task
//
//  Created by Mina Mohareb on 26/03/2023.
//

import SwiftUI

struct PostDataView: View {
    @State var user = User(id: 105, firstName: "Mina", lastName: "Mohareb", maidenName: "", email: "mina@gmail.com", phone: "011111", username: "mina", password: "555111", image: "https://robohash.org/hicveldicta.png")
    @State var post = Post(id: 99000, title: "", body: "Craving something delicious? Try our new dish - a savory mix of roasted vegetables and quinoa, topped with a zesty garlic. Yum!", userID: 105, tags: [], reactions: 4)
    var check : Int = 0
    var body: some View {
        VStack(alignment: .leading)
        {
            HStack(alignment: .top)
            {
                AsyncImage(url: URL(string: user.image), content: {
                    image in image.resizable().frame(width: 40,height: 40).padding([.top,.leading],16).clipShape(Circle())
                }, placeholder: {
                    EmptyView()
                })
                VStack(alignment: .leading, spacing: 2)
                {
                    Text("\(user.firstName) \(user.lastName)").font(.custom("SFProText-Bold", size: 17)).foregroundColor(Color("Color1"))
                    Text("2 days ago").font(.custom("SFProText-Regular", size: 13)).foregroundColor(Color("Color4"))
                }.padding(.top,16)
                    .padding(.leading, 4)
            }
            Text("\(post.body)").padding(.top, 14)
                .padding([.leading,.trailing],16).font(.custom("SFProText-Regular", size: 17)).foregroundColor(Color("Color3"))
            if check == 0
            {
                
            }else if check == 1
            {
                HStack()
                {
                    Image("bigImage")
                        .resizable().padding([.top,.bottom],12)
                        .padding([.leading,.trailing],16)
                }
            }else if check == 2
            {
               HStack()
                {
                    Image("")
                        .resizable()
                    Image("")
                        .resizable()
                }.padding([.top,.bottom],12)
                    .padding([.leading,.trailing],16)
            }
            else if check == 3
            {
                HStack()
                {
                    Image("image1")
                        .resizable()
                    LazyVStack{
                        Image("image2")
                        Image("image3")
                    }
                }.padding([.top,.bottom],12)
                    .padding([.leading,.trailing],16)
            }else if check == 4
            {
                HStack()
                {
                    LazyVStack(){
                        Image("image2")
                        Image("image3")
                    }
                    LazyVStack()
                    {
                        Image("image2")
                        Image("image3")
                    }
                }.padding([.top,.bottom],12)
                    .padding([.leading,.trailing],16)
            }else
            {
                
            }
        }
    }
}
