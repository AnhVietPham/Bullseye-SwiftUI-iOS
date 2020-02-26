//
//  ContentView.swift
//  Bullseye
//
//  Created by PHAM ANH VIET on 1/8/20.
//  Copyright © 2020 PHAM ANH VIET. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isAlertVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var targetValue: Int = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    
    var body: some View {
            VStack{
                    Spacer()
                    // Target row
                    HStack {
                        Text("Put BullEyes in Center can to: ")
                        Text("\(self.targetValue)")
                    }
                    Spacer()
                    // Slider row
                    HStack{
                        Text("1")
                        Slider(value: self.$sliderValue, in: 1...100)
                        Text("100")
                    }
                    Spacer()
                    // Button row
                    Button(action:{
                        self.isAlertVisible = true
                    }){
                        Text("Hit me!")
                    }
                    .alert(isPresented: $isAlertVisible) { () ->
                    Alert in
                        return Alert(title: Text(alertTile()),
                                     message: Text("The Slider's value is \(sliderValueRounded()).\n" +
                                        "Your score is \(self.pointsForCurrentRound())"
                            ),
                                     dismissButton: .default(Text("Awsome!!")){
                                        self.score = self.pointsForCurrentRound()
                                        self.targetValue = Int.random(in: 1...100)
                                        self.round += 1
                            })
                        
                    }
                    Spacer()
                    // Score row
                HStack{
                    Button(action:
                    {
                        self.startNewGame()
                    }){
                        Text("Start over")
                    }
                    Spacer()
                    Text("Score: ")
                    Text("\(score)")
                    Spacer()
                    Text("Round: ")
                    Text("\(round)")
                    Spacer()
                    Button(action: {}){
                        Text("Info")
                    }
                }.padding(.bottom, 20)
            }
    
    }
    
    func pointsForCurrentRound() -> Int {
        
        let roundedValue = Int(self.sliderValue.rounded())
        let difference =  abs(self.targetValue - roundedValue)
        let awardedPoints = 100 - difference
        return awardedPoints
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    
    func alertTile() -> String {
        let difference = abs(targetValue - sliderValueRounded())
        let title: String
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        return title
    }
    
    func startNewGame() {
        score = 0
        round = 1
        sliderValue = 50.0
        targetValue = Int.random(in: 1...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 419))
    }
}
