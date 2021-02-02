//
//  StoriesView.swift
//  Facebook_SUI
//
//  Created by Vinicius Maino on 24/01/21.
//

import Foundation
import SwiftUI

struct StoriesView: View {
    
    let stories: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 3) {
                ForEach(stories, id:\.self) { name in
                    Image(name)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 140, height: 140, alignment: .center)
                        .background(Color.red)
                        .clipped()
                }
            }
            .padding()
        }
    }
}
