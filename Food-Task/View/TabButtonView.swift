//
//  TabButtonView.swift
//  Food-Task
//
//  Created by Mina Mohareb on 28/03/2023.
//

import SwiftUI

struct TabButton : View {
    
    var title : String
    @Binding var selectedTab : String
    var animation : Namespace.ID
    
    var body: some View{
        
        Button(action: {
            withAnimation{selectedTab = title}
        }) {
            
            VStack(spacing: 6){
                ZStack{
                    
                    CustomShape()
                        .fill(Color.clear)
                        .frame(width: 45, height: 6)
                    
                    if selectedTab == title{
                        
                        CustomShape()
                            .fill(Color(red: 0.247, green: 0.247, blue: 0.82))
                            .frame(width: 45, height: 6)
                            .matchedGeometryEffect(id: "Tab_Change", in: animation)
                    }
                }
                .padding(.bottom,10)
                
                Image(title)
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(selectedTab == title ? Color(red: 0.247, green: 0.247, blue: 0.82) : Color.black.opacity(0.2))
                    .frame(width: 24, height: 24)

            }
        }
    }
}

struct CustomShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 10, height: 10))
        
        return Path(path.cgPath)
    }
}
