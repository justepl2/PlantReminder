//
//  Plant.swift
//  Plante Reminder
//
//  Created by Patrick Lamatiere on 19/12/2021.
//

import Foundation
import SwiftUI

struct Plant: Hashable, Codable, Identifiable {
    var id: String
    var species: String
    var nickname: String
    var water_evry: Int
    var description_internet: String
    var notes: String
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }
}
