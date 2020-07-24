//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Arthur Mendonça Sasse on 17/07/20.
//  Copyright © 2020 Arthur Mendonça Sasse. All rights reserved.
//

import SwiftUI

//custom modifier 1
struct CountryTitle: ViewModifier {
    
    let cFont = Font.largeTitle.weight(.black)
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(cFont)
    }
}

extension View {
    func countryTitleStyle() -> some View {
        self.modifier(CountryTitle())
    }
}

//custom modifier 2
struct ColoredScore: ViewModifier {
    var score: Int
    
    func body(content: Content) -> some View {
        if(score > 0){
            return content.foregroundColor(.green)
        }
        else if(score < 0){
            return content.foregroundColor(.red)
        }
        else{
            return content.foregroundColor(.yellow)
        }
    }
}

extension View {
    func colorMyScore(score: Int) -> some View{
        self.modifier(ColoredScore(score: score))
    }
}

struct FlagImage: View {
    var countryName: String
    
    var body: some View {
        Image(countryName)
        .renderingMode(.original)
        .clipShape(Capsule())
        .overlay(Capsule()
            .stroke(Color.black, lineWidth: 1))
        .shadow(color: .black, radius: 2)
    }
}

struct ContentView: View {
// Exemplos de uso do conhecimento aprendido na liçao 2
//    @State private var showingAlert = false
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0

    let correctPoints = 25 //added to the score when the user is correct
    let wrongPoints = 10 //subtracted from the score when the user is wrong
    @State var additionalMessage = ""
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing:30){
                VStack{
                    Text("Tap the flag of...").foregroundColor(.white)
                    Text("\(countries[correctAnswer])")
                        .countryTitleStyle()
                }
                
                ForEach(0..<3){ number in
                    Button(action: {
                        self.flagTapped(number)
                    }){
                        FlagImage(countryName: self.countries[number])
                            .overlay(Capsule()
                                .foregroundColor(self.isCorrect(number) ? .green : .red)
                                .opacity(self.showingScore ? 0.7 : 0))
                    }
                }
                Spacer()
                    .frame(maxHeight: 50)
                VStack {
                    Text("Total Score:")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("\(score)")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .colorMyScore(score: score)
                }
                .padding(.bottom, 150)

            }
            .padding(.top, 40.0)
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text(additionalMessage), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                })
        }
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
    
    func flagTapped(_ number: Int) {
        if(number == correctAnswer){
            scoreTitle = "✅ " + "(" + "+" + String(correctPoints) + ")"
            score = score + correctPoints
            additionalMessage = "Nice!"
        }
        else {
            scoreTitle = "❌" + "(" + "-" + String(wrongPoints) + ")"
            score = score - wrongPoints
            additionalMessage = "That's the flag of \(countries[number])!"
        }
        
        showingScore = true
    }
    
    func isCorrect(_ number: Int) -> Bool {
        if (number == correctAnswer) {
            return true
        }
        else {
            return false
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func isPositive(_ number: Int) -> Bool {
        if (number > 0){
            return true
        }
        else{
            return false
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
