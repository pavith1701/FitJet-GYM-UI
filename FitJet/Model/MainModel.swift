//
//  MainModel.swift
//  FitJet
//
//  Created by Pavithran P K on 15/11/25.
//

import Foundation


struct DataModelMain: Decodable{
    
    var name:String?
    var force:String?
    var level:String?
    var mechanic:String?
    var equipment:String?
    var primaryMuscles: [String]
    var secondaryMuscles:[String]
    var instructions:[String]
    var category: String?
    var images:[String]
    var id:String?
    static func praseData(data:Data) -> [DataModelMain]?
    {
        do {
            let jsonDecoder = JSONDecoder()
            return try jsonDecoder.decode([DataModelMain].self, from: data)
        }
        catch {
            print(error.localizedDescription)
            return nil
        }
    }
}





