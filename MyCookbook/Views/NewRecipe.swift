//
//  NewRecipe.swift
//  MyCookbook
//
//  Created by Liliana Covileac on 01/02/2020.
//  Copyright © 2020 Liliana Covileac. All rights reserved.
//

import SwiftUI

struct NewRecipe: View {

    
    @State private var recipe = Recipe()
    let myCategories:[String] = ["food", "drink"]
    @State private var pickerSelection = 0
    @State private var image: Image? = nil
    @State var showCaptureImageView: Bool = false
    @State private var newIngredient = ""
    @State private var addedIngredients:[String] = []
    @State private var showingAlert = false

    
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    TextField("Recipe name", text: $recipe.name)
                }
                
                Section(header: Text("Category")){
                Picker(selection: $pickerSelection, label: Text("Category"))
                {
                    ForEach(0 ..< myCategories.count)
                    { Text(self.myCategories[$0])}

                }.pickerStyle(SegmentedPickerStyle())
                    
                }
                
                Section(header: Text("Ingredients"))
                {
                    List{
                        ForEach(addedIngredients, id:\.self){ ingredient in
                            Text(ingredient)
                            
                        }
                    }
                    
                    TextField("Add new ingredient", text: $newIngredient)
                    Button(action: {
                        self.addedIngredients.append(self.newIngredient)
                            
                        self.newIngredient = ""
                    })
                    {
                        Image("plus")
                    }
                    
                    
                }
                
                
                Section(header: Text("Description")){
                    TextField("", text: $recipe.description)
                    .lineLimit(nil)
                    
                }
                
                Section(header: Text("Upload an image")){
                    VStack(alignment: .center) {
                        Button(action: {
                      self.showCaptureImageView.toggle()
                        }) {
                            Text("Take a photo")
                        }
                        
                     image?.resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 170)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                            
                    
                    }
                    if (showCaptureImageView) {
                        CaptureImageView(isShown: $showCaptureImageView, image: $image)
                    .aspectRatio(contentMode: .fill)
                        
                    

                    
                    }
                    
                }
                
            
                
                Section {
                    Button(action: {
                        self.recipe.id = Int.random(in: 1...1000)
                        self.recipe.category = self.myCategories[self.pickerSelection]
                        self.recipe.ingredients = self.addedIngredients
                        EncodeRecipe(recipe: self.recipe)
                        
                         self.showingAlert = true
                        
                        
                        
                       
                            }) {
                                HStack(spacing: 2.0) {
                                    Spacer()
                                    Text("Add Recipe")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 220, height: 60)
                                        .background(Color.accentColor)
                                    .cornerRadius(15.0)
                                    Spacer()
                                }
                                
                            }
                    .accentColor(.green)
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Success"), message: Text("A new recipe has been added"), dismissButton: .default(Text("Cool!")))
                }
            
            
        }.navigationBarTitle (Text("Add a new recipe"))
            
        }

    }}
}
    
struct NewRecipe_Previews: PreviewProvider {
   
    
    static var previews: some View {
        NewRecipe()
    }
}

