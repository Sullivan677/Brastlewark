//
//  ContentView.swift
//  Brastlemark
//
//  Created by Sullivan De carli on 16/06/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = InhabitantViewModel()
    @State private var query = ""
    
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
                                .clipShape(Circle())
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
            }
        }.task { await viewModel.loadData() }
        // Implementing the search feature in the UI
        .searchable(text: $query, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search by name")
            .disableAutocorrection(true)
            .onChange(of: query) { newValue in
                viewModel.search(with: newValue)
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Brastlewark")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
