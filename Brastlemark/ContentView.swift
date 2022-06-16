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
            List(viewModel.population, id: \.id) { item in
                VStack {
                    Text(item.name)
                        .font(.title2)
                }
            }
            .task { await viewModel.loadData() }
            .navigationTitle("Brastlewark")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
