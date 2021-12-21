//
//  PlantCard.swift
//  Plante Reminder
//
//  Created by Patrick Lamatiere on 19/12/2021.
//

import SwiftUI

struct PlantCard: View {
    var plant: Plant
    private let cornerRadius: CGFloat = 5
    private let imageHeight: CGFloat = 116
    private let cardAndImageWidth: CGFloat = 170
    private let cardHeight: CGFloat = 174
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                 .strokeBorder(.black, lineWidth: 2)
                 .frame(width: cardAndImageWidth, height: cardHeight)
                 .background(.white)
                 .shadow(color: .gray, radius: 5)
            VStack(alignment: .leading, spacing: 10) {
                plant.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: cardAndImageWidth, height: imageHeight)
                    .clipped()
                LazyVStack(alignment: .leading, spacing: 2) {
                    Text(plant.nickname)
                        .font(.custom("Avenir", size: 14))
                    Text(plant.species)
                        .font(.custom("Avenir", size: 12))
                        .foregroundColor(.gray)
                        .background(.gray.opacity(0.0))
                }
                .padding(.horizontal, 12)
                .padding(.bottom, 10)
                
            }
            .frame(width: cardAndImageWidth, height: cardHeight)
            .cornerRadius(cornerRadius)
            
        }
    }
}

struct PlantCard_Previews: PreviewProvider {
    static var plant = ModelData().plant
    
    static var previews: some View {
        Group{
            PlantCard(plant: plant[0])
        }.previewLayout(.fixed(width: 170, height: 174))
    }

}
