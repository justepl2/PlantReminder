//
//  PlantDetail.swift
//  Plante Reminder
//
//  Created by Patrick Lamatiere on 19/12/2021.
//

import SwiftUI

struct PlantDetail: View {
    var plant: Plant
    
    var body: some View {
        ScrollView {
            VStack {
                CircleImage(image: plant.image)
                    .padding(.bottom, 30)
                    .padding()
                Text(plant.nickname)
                    .font(.title)
                Text(plant.species)
                    .font(.title2)
                    .fontWeight(.light)
            }
            
            
            VStack (alignment: .leading) {
                HStack {
                    Text("Arroser tous les : ")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("\(plant.water_evry)")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.top, .leading], 30.0)
            
            VStack (alignment: .leading) {
                Text("Description : ")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                Text(plant.description_internet)
            }
            .padding()
        }
    }
}

struct PlantDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        PlantDetail(plant: ModelData().plant[0])
            .environmentObject(modelData)
    }
}
