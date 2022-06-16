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
        Form {
            HStack(alignment: .center) {
                VStack {
                    AsyncImage(url: URL(string: population.thumbnail)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                        
                    } placeholder: {
                        Color.gray
                            .frame(width: 180, height: 180, alignment: .center)
                            .clipShape(Circle())
                        
                    }
                    .frame(width: 180, height: 180, alignment: .center)
                    .clipShape(Circle())
                    .shadow(radius: 2)
                    
                }
            }
            Section(header: Text("Professions")) {
                HStack {
                    Text(population.professions, format: .list(type: .and))
                }
            }
            Section(header: Text("Friends")) {
                HStack {
                    Text(population.friends, format: .list(type: .and))
                }
            }
            Section(header: Text("Hair Color")) {
                HStack {
                    Text(population.hairColor)
                }
            }
            Section(header: Text("Measure")) {
                HStack {
                    Text("Weight")
                    Spacer()
                    Text("\(population.weight)")
                }
                HStack {
                    Text("Height")
                    Spacer()
                    Text("\(population.height)")
                }
            }
            
        }.onAppear {
            UITableView.appearance().backgroundColor = .systemBackground
        }
        .navigationTitle(population.name)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(population: Brastlewark(id: 4, name: "", thumbnail: "", age: 3, weight: 4.3, height: 4.5, hairColor: "", professions: ["String", "String"], friends: ["String", "String"]))
    }
}

