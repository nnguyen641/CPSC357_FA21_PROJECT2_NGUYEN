//
//  gameCharacterDetail.swift
//  Project2
//
//  Created by Nathan Nguyen on 10/25/21.
//

import SwiftUI

struct gameCharacterDetail: View {
    var selectedGameCharacter: gameCharacter
    @State var count: Int = 0;
    @State var tapped: Bool = false
    
    var body: some View {
        ScrollView {
            
            VStack {
                CircleImage(image: selectedGameCharacter.image)
                    .padding()
                
                
                VStack{
                    Text(selectedGameCharacter.name)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(tapped ? Color.yellow : Color.black)
                    Text(selectedGameCharacter.category)
                        .font(.subheadline)
                        .foregroundColor(tapped ? Color.yellow : Color.secondary)
                }
                
                VStack(alignment: .leading) {
                    Divider().frame(height:10).background(Color.gray)
                        .padding()
                    
                    Text("About \(selectedGameCharacter.name)")
                        .padding(10)
                        .font(.title2)
                        .foregroundColor(tapped ? Color.yellow : Color.black)
                    
                    Text(selectedGameCharacter.description)
                        .padding(10)
                        .foregroundColor(tapped ? Color.yellow : Color.black)
                }
                
                Button(action: {
                    if(count == 0){
                        self.tapped = true
                        count = 1;
                    } else if(count == 1){
                        self.tapped = false;
                        count = 0;
                    }
                }){
                    Text("Surprise")
                        .foregroundColor(.black)
                }
                .frame(width: 100, height: 75, alignment: .center)
                .padding(.all, 10)
                .background(tapped ? Color.yellow : Color.blue)
            }
            .navigationTitle(selectedGameCharacter.name)
            .navigationBarTitleDisplayMode(.inline)
            
            
        }
    }
}

struct gameCharacterDetail_Previews: PreviewProvider {
    static var previews: some View {
        gameCharacterDetail(selectedGameCharacter: gameCharacters[0])
    }
}

