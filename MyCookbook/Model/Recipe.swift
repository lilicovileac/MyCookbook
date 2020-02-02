//
//  Recipe.swift
//  MyCookbook
//
//  Created by Liliana Covileac on 31/01/2020.
//  Copyright © 2020 Liliana Covileac. All rights reserved.
//

import Foundation
import SwiftUI

struct Recipe: Hashable, Codable, Identifiable {
    
    var id:Int
    var name:String
    var imageName:String
    var category:String
    var ingredients = [String]()
    var description:String
    //var timeRequired:TimeInterval
    
    init(){
        id = Int.random(in: 1...100)
        name = ""
        imageName = "noimage"
        category = ""
        description = ""
    }
}

