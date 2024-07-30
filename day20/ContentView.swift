//
//  ContentView.swift
//  day20
//
//  Created by Jatin Singh on 29/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    var body: some View {
        ZStack{
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            VStack(spacing : 30){
                VStack{
                    Text("tap the flag of").foregroundStyle(.white)
                        .font(.headline.weight(.heavy))
                    Text(countries[correctAnswer]).foregroundStyle(.white)
                        .font(.largeTitle.weight(.semibold))
                    
                }
                
                ForEach(0..<3){ number in
                    Button{
                        flagTapped(number)
                    }label: {
                        Image(countries[number])
                            .clipShape(.capsule)
                            .shadow(color: .black, radius: 5)
                    }
                }
            }
        }.alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        }message: {
            Text("Your score is ???")
        }
    }
    func flagTapped(_ number : Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
        }
        else {
            scoreTitle = "Wrong"
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