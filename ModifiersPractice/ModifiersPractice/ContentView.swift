//
//  ContentView.swift
//  ModifiersPractice
//
//  Created by Abraham Zakharov on 5/15/20.
//  Copyright © 2020 Abraham Zakharov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Image("Breakfast")
            VStack{
                ZStack{
                    Image("TopGradient")
                    HStack{
                        Text("Hardcore Avo Toast")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .padding(.leading, 15.0)
                            .lineSpacing(/*@START_MENU_TOKEN@*/7.0/*@END_MENU_TOKEN@*/)
                        Spacer()
                            .padding()
                        Image("Heart_health")
                            .padding(.trailing, 15.0)
                    }
                    .padding(.bottom, 150)
                }
                Spacer()
                ZStack{
                    Image("BottomGradient")
                    Text("Energize with this healthy and hearty breakfast")
                        .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                        .padding(.top, 125)
                        .shadow(radius: 10)
                }
            }
        }.edgesIgnoringSafeArea(.all)
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
