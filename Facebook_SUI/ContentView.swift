//
//  ContentView.swift
//  Facebook_SUI
//
//  Created by Vinicius Maino on 23/01/21.
//

import SwiftUI

struct FBPostModel: Hashable {
    let name: String
    let post: String
    let imageName: String
}

struct ContentView: View {
    
    @Binding var text: String
    
    let stories = ["story1", "story2", "story3"]
    
    let posts: [FBPostModel] = [FBPostModel(name: "Mike Zuckerberg", post: "I made Facebook. ", imageName: "mike"),
                 FBPostModel(name: "Ayrton Senna", post: "Sou piloto de F1. ", imageName: "ayrton"),
                 FBPostModel(name: "Bill Gates", post: "I made Windows. ", imageName: "bill")]
    
    let facebookBlue = UIColor(red: 23/255.0, green: 120/255.0, blue: 242/255.0, alpha: 1)
    
    var body: some View {
        VStack {
            HStack{
                Text("facebook")
                    .font(.system(size: 48, weight: .bold, design: .default))
                    .foregroundColor(Color(facebookBlue))
                
                Spacer()
                
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(Color(.secondaryLabel))
            }
            .padding()
            
            TextField("Search...", text: $text)
                .padding(7)
                .background(Color(.systemGray5))
                .cornerRadius(13)
                .padding(.horizontal, 15)
            
            ZStack {
                Color(.secondarySystemBackground)
                
                ScrollView(.vertical) {
                    VStack {
                        StoriesView(stories: stories)
                        
                        ForEach(posts, id:\.self) { model in
                            FBPost(model: model)
                            Spacer()
                        }
                    }
                }
            }
                
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(text: .constant(""))
    }
}
