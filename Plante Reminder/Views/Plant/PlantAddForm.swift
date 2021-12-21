//
//  PlantAddForm.swift
//  Plante Reminder
//
//  Created by Patrick Lamatiere on 19/12/2021.
//

import SwiftUI

struct PlantAddForm: View {
    @State private var formSpecies: String = ""
    @State private var formNickname:  String = ""
    @State private var formWater_evry: Int = 5
    @State private var formDescription: String = ""
    @State private var formImage: String = "default"
    
    @State private var isFormComplete = false
    @State private var showError = false
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Information de la plante")) {
                    TextField("Espéce", text: $formSpecies)
                    TextField("Surnom", text: $formNickname)
                    TextField("Desciption", text: $formDescription
                    )
                }
                
                Section(header: Text("Besoins de la plante")) {
                    Picker("Doit être arrosé tous les: ", selection: $formWater_evry) {
                        ForEach(2 ..< 365) {
                            Text("\($0) jours")
                        }
                    }
                }
                Button(action: {
                    validateForm()
                }) {
                    Text("Ajouter ma plante!")
                }.alert(isPresented: $showError) {
                    Alert(title: Text("Error"), message: Text("Vous devez renseigner une espéce"), dismissButton: .default(Text("OK")))
                }
            }.navigationTitle("Ajout d'une plante")
        }.navigationViewStyle(.stack)
    }
    
    func validateForm() {
        if(formSpecies.isEmpty) {
            showError = true
            isFormComplete = false
        } else {
            showError = false
            isFormComplete = true
            saveDataAsJson()
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func saveDataAsJson() {
        var newPlant = Plant(
            id: UUID().uuidString,
            species: formSpecies,
            nickname: formNickname,
            water_evry: formWater_evry,
            description_internet: formDescription,
            notes: "",
            imageName: formImage
        )
        
        ModelData().plant.append(newPlant)
        var test = ModelData().plant
        
    }
}

struct PlantAddForm_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        Group {
            ForEach(["iPhone 13", "iPad (9th generation)"], id: \.self) { deviceName in
                PlantAddForm()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .previewDisplayName(deviceName)
            }
        }
    }
}

//        plants.append(newPlant)

