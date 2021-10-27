//
//  gameCharacter.swift
//  Project2
//
//  Created by Nathan Nguyen on 10/24/21.
//

import Foundation
import SwiftUI

struct gameCharacter: Hashable, Codable, Identifiable{
    var name: String
    var id: String
    var description: String
    var category: String
    
    var imageName: String
    var image: Image{
        Image(imageName)
    }

    init(name: String, id: String, description: String, category: String, imageName: String){
        self.name = name;
        self.id = id;
        self.description = description;
        self.category = category;
        self.imageName = imageName;
    }
}
