//
//  EditProfileView.swift
//  sample-figma-screen
//
//  Created by Buse Özkan on 24.01.2024.
//
import SwiftUI

struct EditProfileView: View {
    @StateObject private var viewModel = UserProfileViewModel()
    @State private var selectedTopics: Set<String> = []
    @State private var isProfileViewActive = false
    @State private var isTopicsValid = true

    var body: some View {
        ZStack {
            BackgroundImage()

            ScrollView {
                VStack(spacing: Spacing.spacing_2) {
                    TitleText(text: "Select 3 topics you are interested in:")
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150),
                                                 spacing: Spacing.spacing_2)], spacing: Spacing.spacing_2) {
                        ForEach(viewModel.news, id: \.self) { topic in
                            VStack {
                                Image(topic)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 30)

                                Button {
                                    toggleTopicSelection(topic: topic)
                                } label: {
                                    HStack {
                                        Image(systemName: selectedTopics.contains(topic)
                                              ? "checkmark.circle.fill" : "circle")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(selectedTopics.contains(topic) ? .green : .black)
                                        Text(topic)
                                            .foregroundColor(.black)
                                    }
                                }
                                .padding(Spacing.spacing_1)
                            }
                        }
                    }
                    .padding(Spacing.spacing_2)

                    ButtonDS(buttonTitle: "Submit") {
                        if selectedTopics.count == 3 {
                            viewModel.updateTopics(newTopics: Array(selectedTopics))
                            isProfileViewActive = true
                        } else {
                            isTopicsValid = false
                        }
                    }
                    .padding(Spacing.spacing_2)
                    .alert(isPresented: $isTopicsValid) {
                        Alert(title: Text("Error"),
                              message: Text("Please select exactly 3 topics."), dismissButton: .default(Text("OK")))
                    }
                }
                .padding(.horizontal, Spacing.spacing_2)
            }
            .navigationBarTitle("Edit Profile", displayMode: .inline)
        }
        .onAppear {
            viewModel.retrieveUserProfile()
            selectedTopics = Set(viewModel.topics.prefix(3))
        }
        .background(NavigationLink(destination: ProfileView(), isActive: $isProfileViewActive) {
            EmptyView()
        })
    }

    private func toggleTopicSelection(topic: String) {
        if selectedTopics.contains(topic) {
            selectedTopics.remove(topic)
        } else {
            if selectedTopics.count < 3 {
                selectedTopics.insert(topic)
            }
        }
    }
}

#Preview {
    EditProfileView()
        .environmentObject(UserSession())
}
