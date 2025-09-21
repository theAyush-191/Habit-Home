//
//  Habits_HomeApp.swift
//  Habits Home
//
//  Created by Ayush Singh on 13/09/25.
//

import SwiftUI
import SwiftData

@main
struct Habit_HomeApp: App {
   
    @AppStorage("lastLaunchDate") private var lastLaunchDate: Double = 0
    @AppStorage("streakCount") private var streakCount = 0
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    @State private var isSplashActive = true
    
    init() {
           updateStreak()
       }
       
    var body: some Scene {
        WindowGroup {
            if isSplashActive {
                            SplashView()
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        withAnimation {
                                            isSplashActive = false
                                        }
                                    }
                                }
                        } else {
                            NavigationView {
                                if isLoggedIn {
                                    HomeView()
                                        .navigationBarBackButtonHidden(true)
                                } else {
                                    LoginView()
                                }
                            }
                        }
        }.modelContainer(for: Habit.self)
    }
    
    private func updateStreak() {
           let now = Date()
           let calendar = Calendar.current
           
           if lastLaunchDate == 0 {
        
               streakCount = 1
           } else {
               let lastDate = Date(timeIntervalSince1970: lastLaunchDate)
               
               let days = calendar.dateComponents([.day], from: calendar.startOfDay(for: lastDate), to: calendar.startOfDay(for: now)).day ?? 0
               
               if days == 0 {
                   
               } else if days == 1 {
               
                   streakCount += 1
               } else {
                
                   streakCount = 1
               }
           }
           
           lastLaunchDate = now.timeIntervalSince1970
       }
}
