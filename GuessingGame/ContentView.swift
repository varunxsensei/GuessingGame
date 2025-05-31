//
//  ContentView.swift
//  GuessingGame
//
//  Created by Varun Saxena on 30/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["Estonia","France","Germany","Ireland","Italy","Nigeria","Poland","Spain","UK","Ukraine","US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack{
            Color.blue
                .ignoresSafeArea()
            VStack(spacing:30){
                VStack{
                    Text("Tap the flag of")
                        .foregroundStyle(.white)
                    Text(countries[correctAnswer])
                        .foregroundStyle(.white)
                }
                
                ForEach(0..<3){number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                    }
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue"){
                askQuestion()
            }
        }
        
    }
    func flagTapped(_ number:Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "wrong"
        }
        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
