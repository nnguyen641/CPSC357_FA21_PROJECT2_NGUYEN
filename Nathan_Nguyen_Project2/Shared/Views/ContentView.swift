//
//  ContentView.swift
//  Shared
//
//  Created by Nathan Nguyen on 10/21/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var gameCharacterStorage: gameCharacterStore = gameCharacterStore(gameCharacters: gameCharacters)
    
    var body: some View {
        NavigationView{
            List{
                ForEach (gameCharacterStorage.gameCharacters){ gameCharacter in
                    ListCell(gameCharacter: gameCharacter)
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationBarTitle(Text("Deltarune Characters"))
            .navigationBarItems(leading: NavigationLink(destination: AddNewGameCharacter(gameCharacterStore: self.gameCharacterStorage)){
                Text("Add")
                    .foregroundColor(.blue)
            }, trailing: EditButton())
        }
    }
    func deleteItems(at offsets: IndexSet){
        gameCharacterStorage.gameCharacters.remove(atOffsets: offsets)
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        gameCharacterStorage.gameCharacters.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListCell: View {
    var gameCharacter: gameCharacter
    var body: some View {
        NavigationLink(destination: gameCharacterDetail(selectedGameCharacter: gameCharacter)){
            HStack{
                Image(gameCharacter.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 60)
                Text(gameCharacter.name)
            }
        
        }
    }
}


