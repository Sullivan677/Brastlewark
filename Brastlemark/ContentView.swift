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
            HStack {
                VStack(alignment: .leading) {
                    Text("\(item.name)")
                        .font(.system(size: 18, weight: .bold))
                    
                    Text("\(item.age)")
                }
                Spacer()
                AsyncImage(url: URL(string: item.thumbnail))
                    .frame(width: 90, height: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 9, style: .continuous))
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
