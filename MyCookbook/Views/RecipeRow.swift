//
//  RecipeRow.swift
//  MyCookbook
//
//  Created by Liliana Covileac on 31/01/2020.
//  Copyright © 2020 Liliana Covileac. All rights reserved.
//

import SwiftUI

struct RecipeRow: View {
    
    var categoryName:String
    var recipes:[Recipe]
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text(self.categoryName)
                .font(.title)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach (self.recipes)
                    {
                        recipe in
                        
                        NavigationLink(destination: RecipeDetail(recipe: recipe)){
                       RecipeItem(recipe: recipe)
                            .frame(width: 300)
                            .padding(.trailing, 30)
                         }
                        
                    }
                }
            
            }
        }}
}

struct RecipeRow_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRow(categoryName: "Food", recipes: recipeData)
    }
}
