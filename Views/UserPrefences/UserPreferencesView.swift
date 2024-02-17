//
//  UserPreferencesView.swift
//  sample-figma-screen
//
//  Created by Sude Güngör on 19.12.2023.
//
import SwiftUI

struct UserPreferencesView: View {
    @StateObject private var viewModel = UserPreferencesViewModel()
    @EnvironmentObject var userSession: UserSession
    @State private var showError: Bool = false

    var body: some View {
        ZStack {
            BackgroundImage()
            ScrollView {
                VStack(spacing: Spacing.spacing_2) {
                    LogoText(text: "Let's set up your profile!")
                    TitleText(text: "Select at most 3 topics you are interested in:")

                    LazyVGrid(
                        columns: [
                            GridItem(.adaptive(minimum: 150), spacing: Spacing.spacing_2)
                        ],
                        spacing: Spacing.spacing_2
                    ) {
                        ForEach(viewModel.news, id: \.self) { new in
                            VStack {
                                Image(new)
                                TopicItem(new: new, isSelected: viewModel.selectedNews.contains(new)) {
                                    withAnimation { viewModel.toggleSelection(for: new) }
                                }
                                .padding(Spacing.spacing_1)
                            }
                        }
                    }
                    .padding(Spacing.spacing_2)

                    VStack {
                        PickerRowView(title: "Select Country:",
                                      selection: $viewModel.selectedCountry,
                                      items: viewModel.countriesDictionary)
                        PickerRowView(title: "Select Language:",
                                      selection: $viewModel.selectedLanguage,
                                      items: viewModel.languagesDictionary)
                    }
                    .padding(Spacing.spacing_2)

                    ButtonDS(buttonTitle: "Continue") {
                        if viewModel.selectedNews.count != 3 ||
                            viewModel.selectedCountry.isEmpty ||
                            viewModel.selectedLanguage.isEmpty {
                            showError = true
                        } else {
                            showError = false
                            viewModel.saveSelectedNewsToFirebase()
                            viewModel.navigateToContentView = true
                        }
                    }
                    .padding(Spacing.spacing_2)

                    NavigationLink(destination: FooterView(), isActive: $viewModel.navigateToContentView) {
                        EmptyView()
                    }
                    .hidden()

                    if showError {
                        Text("Please select 3 topics, Country, and Language.")
                            .foregroundColor(.red)
                            .padding(.top, Spacing.spacing_1)
                    }
                }
                .padding(.horizontal, Spacing.spacing_2)
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    UserPreferencesView()
        .environmentObject(UserSession())
}
