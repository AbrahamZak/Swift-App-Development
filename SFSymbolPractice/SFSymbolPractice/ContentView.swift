//
//  ContentView.swift
//  SFSymbolPractice
//
//  Created by Abraham Zakharov on 5/15/20.
//  Copyright © 2020 Abraham Zakharov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            Image(systemName:"heart.fill").foregroundColor(.red)
            Text("Like")
        }.font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
