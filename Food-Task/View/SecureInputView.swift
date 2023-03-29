//
//  SecureInputView.swift
//  Food-Task
//
//  Created by Mina Mohareb on 29/03/2023.
//

import SwiftUI

struct SecureInputView: View {
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
            self.title = title
            self._text = text
        }
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text).textFieldStyle(.roundedBorder).frame(height: 42)
                } else {
                    TextField(title, text: $text).textFieldStyle(.roundedBorder).frame(height: 42)
                }
            }
            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray).padding([.trailing,.top,.bottom],13).frame(width: 16,height: 16)
            }
        }
    }
}

struct SecureInputView_Previews: PreviewProvider {
    static var previews: some View {
        SecureInputView("", text: .constant(""))
    }
}
