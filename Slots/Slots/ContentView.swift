//
//  ContentView.swift
//  Slots
//
//  Created by Abraham Zakharov on 5/17/20.
//  Copyright © 2020 Abraham Zakharov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = Array(repeating: 0, count: 9)
    @State private var backgrounds = Array(repeating: Color.white, count: 9)
    @State private var credits = 1000
    private var betAmount = 5
    private var superBetAmount = 25
    
    var body: some View {
        
        ZStack{
            //Background
            Rectangle().foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255)).edgesIgnoringSafeArea(.all)
            
            Rectangle()
            .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45)).edgesIgnoringSafeArea(.all)
            
            
            VStack{
                
                Spacer()
                
                //Title
                HStack{
                    Image(systemName:"star.fill").foregroundColor(.yellow)
                    Text("Slots")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        
                    Image(systemName:"star.fill").foregroundColor(.yellow)
                }.scaleEffect(2)
                
                Spacer()
                
                 //Credits counter
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                .cornerRadius(20)
                
                Spacer()
                
                VStack{
                //Cards Row 1
                HStack{
                    Spacer()
                    
                    CardView(symbol: $symbols[numbers[0]], background: $backgrounds[0])
                    
                    CardView(symbol: $symbols[numbers[1]], background: $backgrounds[1])
                    
                    CardView(symbol: $symbols[numbers[2]], background: $backgrounds[2])
                    
                    
                    Spacer()
                }
                    
                    //Cards Row 2
                    HStack{
                        Spacer()
                        
                        CardView(symbol: $symbols[numbers[3]], background: $backgrounds[3])
                        
                        CardView(symbol: $symbols[numbers[4]], background: $backgrounds[4])
                        
                        CardView(symbol: $symbols[numbers[5]], background: $backgrounds[5])
                        
                        
                        Spacer()
                    }
                    
                    //Cards Row 3
                    HStack{
                        Spacer()
                        
                        CardView(symbol: $symbols[numbers[6]], background: $backgrounds[6])
                        
                        CardView(symbol: $symbols[numbers[7]], background: $backgrounds[7])
                        
                        CardView(symbol: $symbols[numbers[8]], background: $backgrounds[8])
                        
                        
                        Spacer()
                    }
                }
                
                Spacer()
                
                HStack{
                    
                    //Spin Button
                    VStack{
                    Button(action: {
                        self.processResults(false)
                        
                    }) {
                        Text("Spin")
                        .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing], 30)
                            .background(Color.pink)
                         .cornerRadius(20)
                    }
                    .padding(.trailing)
                        Text("\(betAmount) Credits").padding(.top, 10).font(.footnote)
                    }
                    
                    //Super Spin Button
                    VStack{
                    Button(action: {
                        self.processResults(true)
                    }) {
                        Text("Super Spin")
                        .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing], 30)
                            .background(Color.pink)
                         .cornerRadius(20)
                    }
                    .padding(.leading)
                        Text("\(superBetAmount) Credits").padding(.top, 10).font(.footnote)
                }
                }
                
                
                Spacer()
            }
        }
    }
    
    func processResults(_ isSuper: Bool = false){
        //Update backgrounds to white
        self.backgrounds = self.backgrounds.map { _ in
            Color.white
        }
        
        
        //Randomize our slots
        //If Max all
        if (isSuper){
        self.numbers = self.numbers.map { _ in
            Int.random(in: 0...self.symbols.count-1)
        }
        }
        //If not, only middle row
        else{
            self.numbers[3] = Int.random(in: 0...self.symbols.count-1)
            self.numbers[4] = Int.random(in: 0...self.symbols.count-1)
            self.numbers[5] = Int.random(in: 0...self.symbols.count-1)
        }
        
        var wins = 0
        
        //Check winnings
        //Middle Row
        if isMatch(3,4,5){
            //Won
            wins += 1
        }
        
        //All other rows only if max bet
        if (isSuper){
        //First Row
        if isMatch(0,1,2){
            //Won
            wins += 1
        }
        //Bottom Row
        if isMatch(6,7,8){
            //Won
            wins += 1
        }
            
            //Diagnol Top Left to Bottom Right
            if isMatch(0,4,8){
                //Won
                wins += 1
            }
        
            //Diagnol Top Right to Bottom Left
        if isMatch(2,4,6){
            //Won
            wins += 1
        }
        }
        
        //Calculate winnings or losses
        if (isSuper){
            if (wins>0){
                self.credits += (self.betAmount * 10 * wins)
            }
            else{
                self.credits -= self.superBetAmount
            }
        }
        else{
            if (wins>0){
                self.credits += (self.betAmount * 10)
            }
            else{
                self.credits -= self.betAmount
            }
        }
    }
    
    //Check if we got matches
    func isMatch(_ index1: Int, _ index2: Int, _ index3: Int) -> Bool{
         if self.numbers[index1] == self.numbers[index2] && self.numbers[index2] == self.numbers[index3]{
            //Change to green and return true
            //Update backgrounds to green
            self.backgrounds[index1] = Color.green
            self.backgrounds[index2] = Color.green
            self.backgrounds[index3] = Color.green
            return true
        }
         else{
            //If no match return false
            return false
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
