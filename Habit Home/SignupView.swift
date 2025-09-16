//
//  SignupView.swift
//  Breeze
//
//  Created by Ayush Singh on 13/09/25.
//

import SwiftUI

struct SignupView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @State private var date : Date = Date()
    
    @State var showHomeView: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing:20) {
            
            HStack{
                Image("logo").resizable().frame(width: 80, height: 80)
                Text("Mind Track").bold().font(.largeTitle).offset(x:-15,y:-4)
            }
            
            Text("Sign Up").font(.largeTitle).fontWeight(.heavy).bold().frame(maxWidth: .infinity,alignment: .leading)
            
            HStack(spacing:10){
                Image(systemName: "person")
                TextField("Name", text: $name)
            }.font(.title2).padding(20).frame(maxWidth: .infinity,alignment: .leading).background(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 2))
            
            HStack(spacing:10){
                Image(systemName: "envelope")
                TextField("Email", text: $email)
            }.font(.title2).padding(20).frame(maxWidth: .infinity,alignment: .leading).background(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 2))
            
            HStack(spacing:10){
                Image(systemName: "lock")
                SecureField("Password", text: $password)
            }.font(.title2).padding(20).frame(maxWidth: .infinity,alignment: .leading).background(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 2))
            
            HStack(spacing:10){
                Image(systemName: "calendar")
                DatePicker("Date of Birth", selection: $date, displayedComponents: [.date]).accentColor(.customGreen)
            }.font(.title2).padding(20).frame(maxWidth: .infinity,alignment: .leading).background(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 2))
            

            Button(action:{
                showHomeView=true
            }){
                Text("Sign Up ").font(.title2).padding(20).foregroundColor(.white).frame(width: .infinity, height: 50).background(RoundedRectangle(cornerRadius: 30).fill(Color("customGreen")).stroke(Color("customGreen"), lineWidth: 2))
            }.navigationDestination(isPresented: $showHomeView) {
                HomeView()
            }

            
            HStack{
                Text("Already have an account?")
                Button(action:{
                    dismiss()
                }) {
                    Text("Log In").underline().font(.callout).foregroundStyle(Color.black).bold()
                }
                
            }
        }
        .padding(20)
    }
}

#Preview {
    SignupView()
}
