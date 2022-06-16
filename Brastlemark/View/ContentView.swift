//
//  ContentView.swift
//  Brastlemark
//
//  Created by Sullivan De carli on 16/06/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = InhabitantViewModel()
    
    var body: some View {
        List(viewModel.population, id: \.id) { population in
            NavigationLink(destination: DetailView(population: population)) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(population.name)")
                            .font(.title3)
                            .bold()
                        Text("\(population.age)")
                            .font(.headline)
                    }
                    Spacer()
                    AsyncImage(url: URL(string: population.thumbnail)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .shadow(radius: 2)
                                .frame(width: 90, height: 90, alignment: .center)
                        case .failure:
                            Color.gray
                                .frame(width: 90, height: 90)
                                .cornerRadius(12)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
            }
        }.listStyle(GroupedListStyle())
            .task { await viewModel.loadData() }
            .navigationTitle("Brastlewark")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
