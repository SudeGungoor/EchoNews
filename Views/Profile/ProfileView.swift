//
//  ProfileView.swift
//  sample-figma-screen
//
//  Created by Sude Güngör on 19.12.2023.
//

import SwiftUI

struct ProfileView: View {

    @StateObject private var viewModel = UserProfileViewModel()
    @EnvironmentObject var userSession: UserSession
    @State private var isLoggedOut = false

    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .center) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.black)
                        .padding(.bottom, 20)

                    if viewModel.isLoading {
                        LoadingView()
                            .onAppear {
                                viewModel.retrieveUserProfile()
                                viewModel.isLoading = false
                            }
                    } else {
                        List {
                            Section(header: Text("User Information")) {
                                ProfileInfoRow(label: "Name", value: viewModel.name)
                                ProfileInfoRow(label: "Email Address", value: viewModel.emailAddress)
                            }

                            Section(header: Text("Preferences")) {
                                ProfileInfoRow(label: "Country",
                                               value: viewModel.getCountryName(for: viewModel.country))
                                ProfileInfoRow(label: "Language",
                                               value: viewModel.getLanguageName(for: viewModel.language))

                                if !viewModel.topics.isEmpty {
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Text("Topics")
                                                .foregroundColor(.gray)
                                            if viewModel.isEditingProfile {
                                                EditProfileView()
                                            } else {
                                                NavigationLink(destination: EditProfileView()) {
                                                    Image(systemName: "gear")
                                                        .foregroundColor(.black)
                                                }
                                            }
                                        }
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            HStack {
                                                ForEach(viewModel.topics, id: \.self) { topic in
                                                    Text(topic)
                                                        .padding(.horizontal)
                                                        .padding(.vertical, 5)
                                                        .background(Color.blue)
                                                        .foregroundColor(.white)
                                                        .cornerRadius(15)
                                                }
                                            }
                                        }
                                    }
                                }

                            }

                        }
                        .listStyle(InsetGroupedListStyle())

                        ButtonDS(buttonTitle: "Logout") {
                            viewModel.signOut()
                            userSession.isLoggedIn = false
                            userSession.email = ""
                            userSession.name = ""
                            isLoggedOut = true
                        }
                        .background(
                            NavigationLink(
                                destination: LoginView(),
                                isActive: $isLoggedOut,
                                label: { EmptyView() }
                            ).hidden()
                        )
                    }
                }
                .padding()
            }
            .navigationTitle("Profile")
            .navigationBarHidden(true)
        }
        .onAppear {
            viewModel.retrieveUserProfile()
        }.navigationBarHidden(true)
    }
}

#Preview {
    ProfileView()
        .environmentObject(UserSession())
}
