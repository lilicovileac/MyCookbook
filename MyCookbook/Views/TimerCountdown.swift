//
//  TimerCountdown.swift
//  MyCookbook
//
//  Created by Liliana Covileac on 03/02/2020.
//  Copyright © 2020 Liliana Covileac. All rights reserved.
//

import SwiftUI

struct TimerCountdown: View {
    
    @State var nowDate: Date = Date()
    var referenceDate:Date = Date(timeIntervalSinceNow: 900)
    
    //instantiates a default timer of 15 min which is 900 minutes
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowDate = Date()
        }
    }
    
    var body: some View {
        
        
        Text(countDownString(from: referenceDate))
        .font(.largeTitle)
        .onAppear(perform: {
            _ = self.timer
        })
    }
    
    func countDownString(from date: Date) -> String {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar
            .dateComponents([.hour, .minute, .second],
                            from: self.nowDate,
                            to: self.referenceDate)
        return String(format: "%02dh:%02dm:%02ds",
                      components.hour ?? 00,
                      components.minute ?? 00,
                      components.second ?? 00)
    }
}

struct TimerCountdown_Previews: PreviewProvider {
    static var previews: some View {
        TimerCountdown()
    }
}
