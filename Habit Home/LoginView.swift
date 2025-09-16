//
//  ContentView.swift
//  Habits Home
//
//  Created by Ayush Singh on 13/09/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    
    @State var showSignUp: Bool = false
    @State var showHomeView: Bool = false
    
    var body: some View {
                
              
        NavigationStack {
            VStack(spacing:20) {
                
                HStack{
                    Image(systemName:"leaf.fill").resizable().frame(width: 30, height: 30).foregroundStyle(.customGreen)
                    Text("Habits Home").bold().font(.largeTitle)
                }
                
                Text("Login").font(.largeTitle).fontWeight(.heavy).bold().frame(maxWidth: .infinity,alignment: .leading)
                
                Image("loginImage")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                
                HStack(spacing:10){
                    Image(systemName: "envelope")
                    TextField("Email", text: $email)
                }.font(.title2).padding(20).frame(maxWidth: .infinity,alignment: .leading).background(RoundedRectangle(cornerRadius: 10).stroke(.gray,lineWidth: 1).fill(Color(.white)))
                
                HStack(spacing:10){
                    Image(systemName: "lock")
                    SecureField("Password", text: $password)
                }.font(.title2).padding(20).frame(maxWidth: .infinity,alignment: .leading).background(RoundedRectangle(cornerRadius: 10).stroke(.gray,lineWidth: 1).fill(Color(.white)))
                
                Button(action:{
                    showHomeView=true
                    email=""
                    password=""
                }){
                    Text("Login ").font(.title2).padding(20).foregroundColor(.white).frame(width: .infinity, height: 50).background(RoundedRectangle(cornerRadius: 30).fill(Color(.customGreen)))
                }.navigationDestination(isPresented: $showHomeView) {
                    HomeView()
                }
                
                Button(action:{}) {
                    Text("Forgot Password?").underline().font(.callout).foregroundStyle(Color.black).bold()
                }
                
                HStack{
                    Text("Don't have account?")
                    Button(action:{
                        showSignUp=true
                    }) {
                        Text("Sign Up").underline().font(.callout).foregroundStyle(Color.black).bold()
                    }.navigationDestination(isPresented: $showSignUp) {
                        SignupView()
                    }
                }
            }
            .padding(20)
        }.tint(.black)
                
            
    }
}

#Preview {
   LoginView()
}
