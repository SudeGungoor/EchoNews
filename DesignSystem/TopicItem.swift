//
//  TopicItem.swift
//  sample-figma-screen
//
//  Created by Sude GÜNGÖR on 6.01.2024.
//

import SwiftUI

struct TopicItem: View {
    var new: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        RoundedRectangle(cornerRadius: Radius.radius_5)
            .foregroundColor(isSelected ? Color(.buttonBorder) : Color(.lightGray))
            .frame(height: 40)
            .overlay(HStack { Text(new).padding(.horizontal, Spacing.spacing_2) })
            .onTapGesture(perform: action)
    }
}

#Preview {
    TopicItem(new: "test", isSelected: true, action: {
           print("Item tapped!")
       })
}
