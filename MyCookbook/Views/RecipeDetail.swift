//
//  RecipeDetail.swift
//  MyCookbook
//
//  Created by Liliana Covileac on 01/02/2020.
//  Copyright © 2020 Liliana Covileac. All rights reserved.
//

import SwiftUI

struct RecipeDetail: View {
    var recipe:Recipe
    
    var body: some View {
        List{
            ZStack(alignment: .bottom) {
                Image(recipe.imageName)
                    .resizable()
                    .frame(height:360.0)
                    .aspectRatio(contentMode: .fit)
                    
                    
                    
                Rectangle()
                    .frame(height: 80)
                    .opacity(0.25)
                    .blur(radius:10)
                
                HStack{
                    VStack(alignment: .leading, spacing: 8)
                        {
                            Text(recipe.name)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                        }
                        .padding(.leading)
                        .padding(.bottom)
                    Spacer()
                    }
            
            }.listRowInsets(EdgeInsets())
            
            Text("Ingredients")
                .font(.headline)
                .foregroundColor(.primary)
            VStack(alignment: .leading, spacing: 5.0){
                ForEach(recipe.ingredients, id:\.self)
                {
                ingredient in
                    Text("‣    \(ingredient)")
                        .font(.body)
                    
                }}
            Text("Description")
                .font(.headline)
            Text(recipe.description)
                .lineLimit(nil)
                .lineSpacing(10)
                .font(.body)
            
            
        }.edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetail(recipe: recipeData[0])
    }
}
