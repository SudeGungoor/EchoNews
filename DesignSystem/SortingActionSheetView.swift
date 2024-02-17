//
//  SortingActionView.swift
//  sample-figma-screen
//
//  Created by Buse Özkan on 9.01.2024.
//
import SwiftUI

struct SortingActionSheetView: View {
    @Binding var isPresented: Bool
    var onSortSelection: (String) -> Void

    var body: some View {
        Button {
            self.isPresented = true
        } label: {
            Image(systemName: "slider.horizontal.3")
                .imageScale(.large)
        }
        .actionSheet(isPresented: $isPresented, content: {
            ActionSheet(
                title: Text("Sort Articles"),
                buttons: [
                    .default(Text("Sort by Newest"), action: {
                        onSortSelection("Newest")
                    }),
                    .default(Text("Sort by Oldest"), action: {
                        onSortSelection("Oldest")
                    }),
                    .cancel()
                ]
            )
        })
    }
}

#Preview {
    SortingActionSheetView(isPresented: .constant(true), onSortSelection: {_ in })
}
