//
//  Data.swift
//  MyCookbook
//
//  Created by Liliana Covileac on 31/01/2020.
//  Copyright © 2020 Liliana Covileac. All rights reserved.
//

import Foundation

var recipeData:[Recipe] = checkFile("example.json")

//this function checkes if the example.json file exists and if not
// uses data.json file from the main bundle to create the array with 3 recipes(for testing) then calls the encodeRecipe function using an item from the recipeData
//which will create the example.json file

func checkFile(_ filename:String) -> [Recipe]
{
    do{
    let fileURL = try FileManager.default
    .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        .appendingPathComponent(filename).path
        let fileManager = FileManager.default
            if fileManager.fileExists(atPath: fileURL) {
                print("FILE AVAILABLE")
                return load(filename)
            } else {
                print("FILE NOT AVAILABLE")
                return firstload("data.json")
                
                
            }
            
    }catch
    {
        fatalError("\(error)")
    }
}


func load<T:Decodable>(_ filename:String, as type:T.Type = T.self)->T{
    
    let data:Data
    do
    {
        let fileURL = try FileManager.default
        .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(filename)
        
        data = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
        catch {
            fatalError("something went wrong \(error)")
    }
}
    

func firstload<T:Decodable>(_ filename:String, as type:T.Type = T.self)->T{
    
    do {
            
        let data:Data
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: nil)
            else{
                fatalError("error")
        }
        
        data = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch {
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }

    
}


func EncodeRecipe(recipe:Recipe)
{
    
    do{
        let fileURL = try FileManager.default
        .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        .appendingPathComponent("example.json")
        recipeData.append(recipe)
     try JSONEncoder().encode(recipeData).write(to: fileURL)
        print("something went throu encoder")
    }catch {
        print(error)
    }
}
