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
            
         
            Image("profilePic")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .shadow(radius: 4)
            
        
            Text("Ayush Singh")
                .font(.title2)
                .fontWeight(.semibold)
            
    
            Text("ayush.singh@example.com")
                .font(.subheadline)
                .foregroundColor(.black)
                .underline()
            

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
            
            Text("\"Consistency is the key to achieving lasting wellness.\"")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color(.systemGray4), radius: 2, x: 0, y: 2)
            
           
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
