//
//  ContentView.swift
//  MyCookbook
//
//  Created by Liliana Covileac on 01/02/2020.
//  Copyright © 2020 Liliana Covileac. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
//            this is another tabitem which should contain a timer, due to time contraints i did not have enoth time to create it
//            Text("Timer to be developed")
//                .tabItem{
//                    VStack{
//                        Image("clock")
//                        Text("Timer")
//                    }
//            }.tag(1)
            
            HomeView()
                .tabItem{
                    VStack{
                        Image("home")
                        Text("Home")
                    }
            }.tag(1)
            
            NewRecipe()
                .tabItem{
                    VStack{
                        Image("plus")
                        Text("Add a recipe")
                    }
            }.tag(2)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
