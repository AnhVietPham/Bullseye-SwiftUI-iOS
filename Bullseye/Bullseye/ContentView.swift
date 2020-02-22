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
                        let roundValue = Int(self.sliderValue)
                        return Alert(title: Text("Hello Everyone"),
                                     message: Text("The Slider's value is \(roundValue).\n" +
                                        "Your score is \(self.pointsForCurrentRound())"
                            ),
                                     dismissButton: .default(Text("Awsome!!")))
                        
                    }
                    Spacer()
                    // Score row
                HStack{
                    Button(action: {}){
                        Text("Start over")
                    }
                    Spacer()
                    Text("Score: ")
                    Text("999999")
                    Spacer()
                    Text("Round: ")
                    Text("999")
                    Spacer()
                    Button(action: {}){
                        Text("Info")
                    }
                }.padding(.bottom, 20)
            }
    
    }
    func pointsForCurrentRound() -> Int {
        return 9090
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 419))
    }
}
