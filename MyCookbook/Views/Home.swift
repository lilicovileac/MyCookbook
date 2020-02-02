//
//  ContentView.swift
//  MyCookbook
//
//  Created by Liliana Covileac on 31/01/2020.
//  Copyright © 2020 Liliana Covileac. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var categories:[String:[Recipe]]{
        Dictionary(
            grouping: recipeData,
            by: {$0.category}
        )
    }
    
    
    var body: some View {
        NavigationView{
            List{
            ForEach(categories.keys.sorted(), id: \String.self) {key in
                    RecipeRow(categoryName: "\(key)s".uppercased(), recipes: self.categories[key]!)
                        .frame(height: 320)
                        .padding(.bottom)
            }
            }
            .navigationBarTitle(Text("My Cookbook"))

        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
