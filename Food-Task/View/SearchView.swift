//
//  SearchView.swift
//  Food-Task
//
//  Created by Mina Mohareb on 28/03/2023.
//

import SwiftUI
struct SearchView: View {
    @State var searchText : String = ""
    @StateObject var dataModel = SearchViewModel()
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            ScrollView(.vertical,showsIndicators: false){
                VStack
                {
                    SearchBarView(searchText: $searchText)
                    Divider()
                    ForEach(dataModel.searchPosts.posts, id: \.self) { post in
                        PostDetailsView(check: 0, post: post)
                        Divider()
                    }
                }
            }
        }.onChange(of: searchText){
            value in
            async {
                if !value.isEmpty
                {
                    dataModel.searchPosts = Posts(posts: [], total: 0, skip: 0, limit: 0)
                    await dataModel.fetchSearch(search: searchText)
                }else
                {
                    dataModel.searchPosts = Posts(posts: [], total: 0, skip: 0, limit: 0)
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
