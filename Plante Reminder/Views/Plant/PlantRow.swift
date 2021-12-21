//
//  PlantRow.swift
//  Plante Reminder
//
//  Created by Patrick Lamatiere on 19/12/2021.
//

import SwiftUI

struct PlantRow: View {
    var plant: Plant
    
    var body: some View {
        HStack {
            plant.image
                .resizable()
                .frame(width: 50, height: 50)
            
            Text("\(plant.nickname) (\(plant.species))")
            
            Spacer()

        }
    }
}

struct PlantRow_Previews: PreviewProvider {
    static var plant = ModelData().plant
    
    static var previews: some View {
        Group {
            PlantRow(plant: plant[0])
            PlantRow(plant: plant[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
