//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Arthur Mendonça Sasse on 17/07/20.
//  Copyright © 2020 Arthur Mendonça Sasse. All rights reserved.
//

import SwiftUI

struct ContentView: View {
// Exemplos de uso do conhecimento aprendido na liçao 2
//    @State private var showingAlert = false
    
    var body: some View {
        Text("Hello World")
        //Exemplos de uso do conhecimento aprendido na liçao 2
//        ZStack{
////            Color(red:1, green:0.5, blue:0.7).edgesIgnoringSafeArea(.all)
////            Color(red:0.5,green: 0, blue: 0.8).edgesIgnoringSafeArea(.all).frame(width:200, height: 450)
////            LinearGradient(gradient: Gradient(colors: [.blue,.orange]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
////            RadialGradient(gradient: Gradient(colors: [.green, .black]), center: .center, startRadius: 20, endRadius: 200).edgesIgnoringSafeArea(.all)
////            AngularGradient(gradient: Gradient(colors: [.white,.black,.white,.black,.white]), center: .center).edgesIgnoringSafeArea(.all)
//            VStack(alignment: .center, spacing: 20.0){
//                HStack(spacing: 25.0){
//                    Text("1")
//                    Text("2")
//                    Text("3")
//                }
//                HStack(spacing: 25.0){
//                    Text("4")
//                    Text("5")
//                    Text("6")
//                }
//                HStack(spacing: 25.0){
//                    Text("7")
//                    Text("8")
//                    Text("9")
//                }
//                Text("0")
//                Button(action: {
//                    self.showingAlert = true
//                }) {
//                    HStack(spacing: 10){
//                        Image(systemName: "phone")
//                            .renderingMode(.original)
//                            .colorInvert()
//                        Text("Call")
//                            .foregroundColor(Color.white)
//                    }
//                    .frame(width: 100.0)
//                    .background(/*@START_MENU_TOKEN@*/Color.green/*@END_MENU_TOKEN@*/)
//                    .cornerRadius(/*@START_MENU_TOKEN@*/11.0/*@END_MENU_TOKEN@*/)
//                    .animation(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
//                }.alert(isPresented: $showingAlert) {
//                    Alert(title: Text("Phone"), message: Text("Calling Larissa"), primaryButton: .default(Text("Ok")), secondaryButton: .destructive(Text("Cancel")))
//                }
//
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
