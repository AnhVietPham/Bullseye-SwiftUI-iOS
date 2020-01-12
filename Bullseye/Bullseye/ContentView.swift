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
    var body: some View {
        VStack{
            Text("Welcome to my first App")
                .fontWeight(.semibold)
                .foregroundColor(Color.red)
            Button(action:{
                self.isAlertVisible = true
            }){
                Text("Hit me!")
            }
            .alert(isPresented: $isAlertVisible) { () ->
                Alert in
                return Alert(title: Text("Hello Everyone"),
                             message: Text("This is my first POP-UP"),
                             dismissButton: .default(Text("Awsome!!")))
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
