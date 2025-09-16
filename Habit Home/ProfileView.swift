//
//  Settings.swift
//  Habits Home
//
//  Created by Ayush Singh on 16/09/25.
//

import SwiftUI


struct ProfileView: View {
    
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = true
    @AppStorage("streakCount") private var streakCount = 0
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Profile Image
            Image("profilePic") // replace with your asset name
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .shadow(radius: 4)
            
            // Name
            Text("Ayush Singh")
                .font(.title2)
                .fontWeight(.semibold)
            
            // Email
            Text("ayush.singh@example.com")
                .font(.subheadline)
                .foregroundColor(.black)
                .underline()
            
            // Current Streak Card
            VStack(spacing: 8) {
                Text("Current Streak")
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                if streakCount>1{
                    Text("\(streakCount) Days")
                        .font(.title)
                        .fontWeight(.bold)
                }
                else{
                    Text("\(streakCount) Day")
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.green.opacity(0.2))
            .cornerRadius(12)
            
            // Quote Card
            Text("\"Consistency is the key to achieving lasting wellness.\"")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color(.systemGray4), radius: 2, x: 0, y: 2)
            
            // Logout Button
            Button(action: {
                withAnimation {
                    dismiss()
                    isLoggedIn=false
                }
                
            }) {
                Text("Logout")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(25)
            }
            .padding(.top, 10)
            
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
    }
}


#Preview {
    ProfileView()
}
