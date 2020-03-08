//
//  AboutView.swift
//  Bullseye
//
//  Created by PHAM ANH VIET on 3/8/20.
//  Copyright © 2020 PHAM ANH VIET. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    let beige = Color(red: 255.0 /  255.0, green: 214.0 / 255.0, blue: 179.0 / 255.0)
    
    struct AboutHeadingStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .padding(.top, 20)
                .padding(.bottom, 20)
        }
    }
    
    struct AboutBodyStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .padding(.leading, 60)
                .padding(.trailing, 60)
                .padding(.bottom, 20)
        }
    }
    
    var body: some View {
        Group{
        VStack{
            Text("🎯 Bullseye 🎯").modifier(AboutHeadingStyle())
            Text("This is Bullseye, the game where you can win points and ear fame by dagrring a slider.").modifier(AboutBodyStyle())
            Text("asdbkasdkasdkabdkasbdkasbdkasbdkasbdkqwbdkasbdqwduewasdbiqidibask iasbdabd asidubasibdas askdbaksbduw adbakwbdiqwudkasbd uasbdabwd").modifier(AboutBodyStyle())
            Text("Enjoy!").modifier(AboutBodyStyle())
        }
        .navigationBarTitle("About Bullseye!!")
        .background(beige)
        }
    .background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 419))
    }
}
