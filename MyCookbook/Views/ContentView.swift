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
            TimerCountdown()
                .tabItem{
                    VStack{
                        Image("clock")
                        Text("Timer")
                    }
            }.tag(0)
            
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
            
        }.edgesIgnoringSafeArea(.top)
    }
    

}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
