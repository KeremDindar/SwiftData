//
//  DetailRowView.swift
//  VeresiyeApp
//
//  Created by Kerem on 13.11.2024.
//

import SwiftUI

struct DetailRowView: View {
    let title: String
    @Binding var text: String
    let isEditing: Bool
    var isMultiline: Bool = false
    
    var body: some View {
        HStack(alignment: isMultiline ? .top : .center) {
            Text(title)
                .font(.headline)
            Spacer()
            if isEditing {
                if isMultiline {
                    TextEditor(text: $text)
                        .frame(height: 100)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                } else {
                    TextField("Enter \(title)", text: $text)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                }
            } else {
                Text(text)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

