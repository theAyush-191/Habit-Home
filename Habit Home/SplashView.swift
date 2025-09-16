//
//  SplashView.swift
//  Habit Home
//
//  Created by Ayush Singh on 16/09/25.
//


import SwiftUI


        struct SplashView: View {
            var body: some View {
                ZStack {
                    Color("splashColor").ignoresSafeArea()
                    VStack(spacing: 15) {
                        Image(systemName: "leaf.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white)
                        Text("Habits Home")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
            }
        }

#Preview {
    SplashView()
}
