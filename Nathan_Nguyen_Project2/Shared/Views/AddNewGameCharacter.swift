//
//  AddNewGameCharacter.swift
//  Project2
//
//  Created by Nathan Nguyen on 10/26/21.
//

import SwiftUI

struct AddNewGameCharacter: View {
    @StateObject var gameCharacterStore : gameCharacterStore
    
    @State private var name: String = ""
    @State private var id: Int = 0
    @State private var description: String = ""
    @State private var category: String = ""
    var body: some View {
        Form {
            Section(header: Text("Deltarune Character Details")){
                Image("dogSprite")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                DataInput(title: "Name", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                DataInput(title: "Category", userInput: $category)
                
            }
            
            Button(action: addNewGameCharacter){
                Text("Add Character")
            }
        }
    }
    
    func addNewGameCharacter(){
        
        let newCharacter = gameCharacter(name: name, id: UUID().uuidString, description: description, category: category, imageName: "dogSprite")
        gameCharacterStore.gameCharacters.append(newCharacter)
    }
    
}

struct AddNewGameCharacter_Previews: PreviewProvider {
    static var previews: some View {
        AddNewGameCharacter(gameCharacterStore: gameCharacterStore(gameCharacters: gameCharacters))
    }
}

struct DataInput: View{
    
    var title: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}
