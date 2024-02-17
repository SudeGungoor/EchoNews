//
//  CustomPickerView.swift
//  sample-figma-screen
//
//  Created by Sude GÜNGÖR on 5.01.2024.
//

import SwiftUI

struct CustomPickerView: View {
    @Binding var selection: String
    var items: [String]

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 1)
                    .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(.lightGray)))
                    .frame(width: 350, height: 40)
                Picker("", selection: $selection) {
                    ForEach(items, id: \.self) { item in
                        SubtitleText(text: item)
                            .font(.headline)
                            .foregroundColor(Color.black)
                    }
                }
                .pickerStyle(.menu)
                .frame(width: 200)
                .accentColor(.black)
            }
        }
    }
}

#Preview {
    CustomPickerView(selection: .constant("abc"), items: ["12", "123"])
}
