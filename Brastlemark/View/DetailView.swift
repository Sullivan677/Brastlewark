//
//  DetailView.swift
//  Brastlemark
//
//  Created by Sullivan De carli on 16/06/2022.
//

import SwiftUI

struct DetailView: View {
    
    var population: Brastlewark
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: population.thumbnail))
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 180, height: 180, alignment: .center)
                    .cornerRadius(18)
                Text(population.name)
                    .font(.title2)
                    .bold()
                Text("\(population.age)")
                    .font(.headline)
                    .bold()
                Spacer()
            }
        }
    }
}

