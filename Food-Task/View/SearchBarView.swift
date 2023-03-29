//
//  SearchBarView.swift
//  Food-Task
//
//  Created by Mina Mohareb on 29/03/2023.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText : String
    var body: some View {
        HStack{
            Image("search").resizable().frame(width: 16,height: 16)
            TextField("Search .....",text: $searchText).overlay(Button(action: {
                        searchText = ""
                    }, label: {
                        Image("close-circle")
                    }),alignment: .trailing)
            
        }.padding([.leading,.trailing],16).padding([.top,.bottom],8).background(
            RoundedRectangle(cornerRadius: 8.4).fill(Color.white).border(Color(red: 0.814, green: 0.835, blue: 0.866),width: 1)
        ).frame(width: UIScreen.main.bounds.width - 32,height: 40)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}
