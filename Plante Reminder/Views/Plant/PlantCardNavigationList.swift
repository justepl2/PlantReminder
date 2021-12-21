//
//  PlantCardNavigationList.swift
//  Plante Reminder
//
//  Created by Patrick Lamatiere on 19/12/2021.
//

import SwiftUI

struct PlantCardNavigationList: View {
    
    let columns = [
        GridItem(.adaptive(minimum: 175))
    ]
    
    var body: some View {
        NavigationView {
            let plants: [Plant] = ModelData().plant
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(plants) { plant in
                    NavigationLink {
                        PlantDetail(plant: plant)
                    } label: {
                        PlantCard(plant: plant)
                    }.padding(.horizontal)
                }
            }
            .toolbar{
                ToolbarItem(placement: .principal) {
                    HStack{
                        Text("Mes plantes")
                            .font(.title)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        PlantAddForm()
                    } label: {
                        Text("Ajouter")
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
        .onAppear(perform: {
            plants = ModelData().plant
        })
    }
    
    public func addPlant() {
        print("Add Plant button pressed")
    }
}

struct PlantCardNavigationList_Previews: PreviewProvider {
   
    static var previews: some View {
        ForEach(["iPhone 13", "iPad (9th generation)"], id: \.self) { deviceName in
        PlantCardNavigationList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
