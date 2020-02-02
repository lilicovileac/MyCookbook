//
//  RecipeItem.swift
//  MyCookbook
//
//  Created by Liliana Covileac on 31/01/2020.
//  Copyright © 2020 Liliana Covileac. All rights reserved.
//

import SwiftUI

struct RecipeItem: View {
    var recipe:Recipe
    var body: some View {
        VStack(alignment:.leading, spacing: 16.0) {
            Image(recipe.imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 170)
                .cornerRadius(10)
                .shadow(radius: 10)
            VStack(alignment: .leading, spacing: 5.0) {
                Text(recipe.name)
                    .foregroundColor(.primary)
                    .font(.headline)
            
            Text(recipe.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
                .frame( height: 40)
            }
            
            
        }
        
        
        
        
        
    }
}

struct RecipeItem_Previews: PreviewProvider {
    static var previews: some View {
        RecipeItem(recipe: recipeData[0])
    }
}
