//
//  ContentView.swift
//  SwiftUITest
//
//  Created by Abraham Zakharov on 5/15/20.
//  Copyright © 2020 Abraham Zakharov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                Image("lemon")
                Spacer()
                Image("lemon")
                Spacer()
                Image("lemon")
                Spacer()
            }
            Spacer()
            HStack{
                Spacer()
                Image("lemon")
                Spacer()
                Image("lemon")
                Spacer()
                Image("lemon")
                Spacer()
            }
            Spacer()
            HStack{
                Spacer()
                Image("lemon")
                Spacer()
                Image("lemon")
                Spacer()
                Image("lemon")
                Spacer()
            }
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
