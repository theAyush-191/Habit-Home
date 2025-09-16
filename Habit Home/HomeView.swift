//
//  HomeView.swift
//  Breeze
//
//  Created by Ayush Singh on 13/09/25.
//

import SwiftUI




struct HomeView: View {

    var body: some View {
        
            TabView{
                Group{
                    HabitView().tabItem {
                        Label("Habits", systemImage: "checkmark.seal.text.page")
                    }
                    ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person")
                        }
                }.toolbarBackground(Color(.white))
                    .toolbarBackground(.visible, for: .tabBar)
            }.navigationBarBackButtonHidden(true)
       
    }
}



#Preview {
    HomeView()
}
