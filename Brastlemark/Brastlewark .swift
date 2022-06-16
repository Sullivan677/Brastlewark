//
//  Brastlewark .swift
//  Brastlewark
//
//  Created by Skorobogatow, Christian on 15/6/22.
//

import SwiftUI

struct Response: Codable {
    let Brastlewark: [Brastlewark]
}

struct Brastlewark: Codable, Identifiable {
    let id: Int
    let name: String
    let thumbnail: String
    let age: Int
    let weight: Double
    let height: Double
    let hairColor: String
    let professions : [String]
    let friends: [String]
}

