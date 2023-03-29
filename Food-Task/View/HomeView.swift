//
//  THomeView.swift
//  Food-Task
//
//  Created by Mina Mohareb on 27/03/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var dataModel = HomeViewModel()
    @State var selectedTab = "home-2"
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @Namespace var animation
    @StateObject var modelData = TabsViewModel()
    @State var isSearching : Bool = false
    var body: some View{
        VStack(spacing: 0)
        {
            GeometryReader{_ in
                
                ZStack{
                    NavigationView
                    {
                        ScrollView
                        {
                            VStack()
                            {
                                HStack()
                                {
                                    Image("LOGO").resizable()
                                        .scaledToFit()
                                        .padding([.leading], 16)
                                        .padding([.top,.bottom],20)
                                    Spacer()
                                    Button(action: {
                                        isSearching.toggle()
                                    }, label: {
                                        Image("search").resizable().scaledToFit()
                                            .frame(width: 24,height: 24)
                                            .padding(.trailing, 16)
                                            .padding([.top,.bottom],8)
                                    }).frame(width: 40,height: 40)
                                    
                                }.frame(width: UIScreen.main.bounds.width, height: 56, alignment: .leading)
                                Divider()
                                ForEach(dataModel.posts.posts, id: \.self)
                                {
                                    post in
                                    PostDetailsView(check: 0, post: post)
                                    Divider()
                                }
                                PostDataView(check: 1)
                                Divider()
                                PostDataView(check: 3)
                                Divider()
                            }
                        }.onAppear(perform: dataModel.fetchPosts)
                    }.fullScreenCover(isPresented: $isSearching, content: {
                        SearchView.init()
                    })
                    .opacity(selectedTab == "home-2" ? 1 : 0)
                    
                    Text("Shop")
                        .opacity(selectedTab == "shop" ? 1 : 0)
                    
                    Text("DiscountShape")
                        .opacity(selectedTab == "discount-shape" ? 1 : 0)
                    
                    Text("Gallery")
                        .opacity(selectedTab == "gallery" ? 1 : 0)
                    Text("Profile")
                        .opacity(selectedTab == "profile" ? 1 : 0)
                }
            }
            .onChange(of: selectedTab) { (_) in
                
                switch(selectedTab){
                
                case "shop": if !modelData.isShopLoad{modelData.loadShop()}
                case "discount-shape": if !modelData.isDiscountShapeLoad{modelData.loadDiscountShape()}
                case "gallery": if !modelData.isGalleryLoad{modelData.loadGallery()}
                case "profile": if !modelData.isProfileLoad{modelData.loadProfile()}
                default: ()
                }
            }
            Divider()
            HStack(spacing: 0){
                
                ForEach(tabs,id: \.self){tab in
                    
                    TabButton(title: tab, selectedTab: $selectedTab,animation: animation)
                    
                    if tab != tabs.last{
                        Spacer(minLength: 0)
                    }
                }
            }
            .padding(.horizontal,30)
            .padding(.bottom,edges?.bottom == 0 ? 15 : edges?.bottom)
            .background(Color.white)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
