//
//  ContentView.swift
//  MyCookbook
//
//  Created by Liliana Covileac on 01/02/2020.
//  Copyright © 2020 Liliana Covileac. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var nowDate: Date = Date()
    var referenceDate:Date = Date(timeIntervalSinceNow: 900)
    
    
    //instantiates a default timer of 15 min which is 900 minutes
       var timer: Timer {
           Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
               self.nowDate = Date()
           }
       }
    
    var body: some View {
        TabView{
//            this is another tabitem which should contain a timer, due to time contraints i did not have enoth time to create it
            
            Text(countDownString(from: referenceDate))
            .font(.largeTitle)
            .onAppear(perform: {
                _ = self.timer
            })
                .tabItem{
                    VStack{
                        Image("clock")
                        Text("Timer")
                    }
            }.tag(1)
            
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
    
    func countDownString(from date: Date) -> String {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar
            .dateComponents([.hour, .minute, .second],
                            from: nowDate,
                            to: referenceDate)
        return String(format: "%02dh:%02dm:%02ds",
                      components.hour ?? 00,
                      components.minute ?? 00,
                      components.second ?? 00)
    }

}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
