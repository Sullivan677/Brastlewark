//
//  InhabitantViewModel.swift
//  Brastlewark
//
//  Created by sdecarli on 15/6/22.
//

import SwiftUI

class InhabitantViewModel: ObservableObject {
    @Published var population = [Brastlewark]()
    @Published var defaultPopulation = [Brastlewark]()

    
    @MainActor
    func loadData() async {
        guard let url = URL(string: "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json") else { return }
        
        do {
            var (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid Server Response")
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            if let decodedResponse = try? decoder.decode(Result.self, from: data) {
                population = decodedResponse.Brastlewark
                defaultPopulation = decodedResponse.Brastlewark
                print("\(decodedResponse.Brastlewark)")
            }
        } catch {
            print("Invalid data")
        }
    }
    
    func search(with query: String = "") {
        population = query.isEmpty ? defaultPopulation : population.filter {$0.name.contains(query)}
    }
}

