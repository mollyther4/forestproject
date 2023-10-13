//
//  EverythingView.swift
//  Forest Project
//
//  Created by Molly on 5/10/2023.

import SwiftUI

struct InputLocationView: View {

    @ObservedObject var model = InputLocationViewModel()
    @Environment(\.dismiss) var dismiss
    
    @State var time: String = ""
    @State var date: String = ""
    
    @State var landscapePosition: String? = ""
    @State var vegetationType: String? = ""
    @State var developmentStage: String? = ""
    
    @State var severity: String? = ""
    @State var groundRecovery: String? = ""
    @State var shrubRecovery: String? = ""
    @State var canopyRecovery: String? = ""
    @State var treeRecovery: String? = ""
    
    @State var animalType: String = ""
    @State var birdRecord: String = ""
    @State var floweringPlants: String? = ""
    
    @State var isPickerShowing = false
    @State var selectedImage: UIImage?
    
    var body: some View {
        ScrollView([.vertical], showsIndicators: false) {
            VStack {
                sectionOne
                    .font(.custom("Chalkduster", size: 20))
                    .foregroundColor(.green)
                sectionTwo
                    .font(.custom("Chalkduster", size: 20))
                    .foregroundColor(.green)
                sectionThree
                    .font(.custom("Chalkduster", size: 20))
                    .foregroundColor(.green)
                sectionFour
                    .font(.custom("Chalkduster", size: 20))
                    .foregroundColor(.green)
            }
        }
    }

}

extension InputLocationView {
    var sectionOne: some View {
        VStack {
            uploadPhotoSection
            timeAndDate
        }
        .sheet(isPresented: $isPickerShowing, onDismiss: nil) {
            ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
        }
    }
}

extension InputLocationView {
    var sectionTwo: some View {
        VStack {
            landscapePositionView
            vegetationTypeView
            developmentStageView
        }
    }
}

extension InputLocationView {
    var sectionThree: some View {
        VStack {
            severityView
            groundRecoveryView
            shrubRecoveryView
            canopyRecoveryView
            treeRecoveryView
        }
    }
}

extension InputLocationView {
    var sectionFour: some View {
        VStack {
            Text("Animals and Birds")
            animalBirdView
            floweringPlantsView
            continueButton
        }
    }
}

extension InputLocationView {
    var uploadPhotoSection: some View {
        VStack {
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            Button {
                isPickerShowing = true
            } label: {
                Text("Pick Image Here!")
            }
        }
    }
    var timeAndDate: some View {
        VStack {
            TextField("Time", text: $time)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
            TextField("Date", text: $date)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
        }
    }
}

extension InputLocationView {
    var landscapePositionView: some View {
        VStack {
            Text("Landscape Position")
            ForestButton(text: "Flat / undulating", selectedOption: $landscapePosition) {
                landscapePosition = "Flat / undulating"
            }
            ForestButton(text: "Ridge or hill", selectedOption: $landscapePosition) {
                landscapePosition = "Ridge or hill"
            }
            
            ForestButton(text: "Slope", selectedOption: $landscapePosition) {
                landscapePosition = "Slope"
            }
            
            ForestButton(text: "Valley / gully", selectedOption: $landscapePosition) {
                landscapePosition = "Valley / gully"
            }
            
        }
    }

    var vegetationTypeView: some View {
        VStack {
            Text("Vegetation Type")
            ForestButton(text: "Eucalypt forest (fern or herb)", selectedOption: $vegetationType) {
                vegetationType = "Eucalypt forest (fern or herb)"
            }
          
            ForestButton(text: "Eucalypt forest (grassy)", selectedOption: $vegetationType) {
                vegetationType = "Eucalypt forest (grassy)"
            }
            
            ForestButton(text: "Eucalypt forest (shrubby)", selectedOption: $vegetationType) {
                vegetationType = "Eucalypt forest (shrubby)"
            }
            ForestButton(text: "Rainforest", selectedOption: $vegetationType) {
                vegetationType = "Rainforest"
            }
        
            ForestButton(text: "Riparian", selectedOption: $vegetationType) {
                vegetationType = "Riparian"
            }
        }
    }

    var developmentStageView: some View {
        VStack {
            Text("Development stage")
            ForestButton(text: "Old", selectedOption: $developmentStage) {
                developmentStage = "Old"
            }
            ForestButton(text: "Mature", selectedOption: $developmentStage) {
                developmentStage = "Mature"
            }
            ForestButton(text: "Regrowth", selectedOption: $developmentStage) {
                developmentStage = "Regrowth"
            }
            ForestButton(text: "Mixed", selectedOption: $developmentStage) {
                developmentStage = "Mixed"
            }
            ForestButton(text: "Few trees present", selectedOption: $developmentStage) {
                developmentStage = "Few trees present"
            }
        }
    }
}

extension InputLocationView {
    var severityView: some View {
        VStack {
            Text("Severity")
            ForestButton(text: "Unburnt", selectedOption: $severity) {
                severity = "Unburnt"
            }
            ForestButton(text: "Low", selectedOption: $severity) {
                severity = "Low"
            }
            ForestButton(text: "Moderate", selectedOption: $severity) {
                severity = "Moderate"
            }
            ForestButton(text: "High", selectedOption: $severity) {
                severity = "High"
            }
            ForestButton(text: "Extreme", selectedOption: $severity) {
                severity = "Extreme"
            }
        }
    }

    var groundRecoveryView: some View {
        VStack {
            Text("Ground Layer Recovery")
            ForestButton(text: "Unburnt", selectedOption: $groundRecovery) {
                groundRecovery = "Unburnt"
            }
            ForestButton(text: "New Growth visible", selectedOption: $groundRecovery) {
                groundRecovery = "New Growth visible"
            }
            ForestButton(text: "No new growth", selectedOption: $groundRecovery) {
                groundRecovery = "No new growth"
            }
            ForestButton(text: "No ground cover present", selectedOption: $groundRecovery) {
                groundRecovery = "No ground cover present"
            }
        }
    }

    var shrubRecoveryView: some View {
        VStack {
            Text("Shrub Layer Recovery")
            ForestButton(text: "Unburnt", selectedOption: $shrubRecovery) {
                shrubRecovery = "Unburnt"
            }
            ForestButton(text: "Shoots present", selectedOption: $shrubRecovery) {
                shrubRecovery = "Shoots present"
            }
            ForestButton(text: "Seedling's present", selectedOption: $shrubRecovery) {
                shrubRecovery = "Seedling's present"
            }
            ForestButton(text: "Both shoots and seedlings present", selectedOption: $shrubRecovery) {
                shrubRecovery = "Both shoots and seedlings present"
            }
            ForestButton(text: "No shoots or seedlings present", selectedOption: $shrubRecovery) {
                shrubRecovery = "No shoots or seedlings present"
            }
            ForestButton(text: "No shrub layer present", selectedOption: $shrubRecovery) {
                shrubRecovery = "No shrub layer present"
            }
        }
    }

    var canopyRecoveryView: some View {
        VStack {
            Text("Sub canopy layer recovery")
            ForestButton(text: "Unburnt", selectedOption: $canopyRecovery) {
                canopyRecovery = "Unburnt"
            }
            ForestButton(text: "Shoots present", selectedOption: $canopyRecovery) {
                canopyRecovery = "Shoots present"
            }
            ForestButton(text: "No shoots present", selectedOption: $canopyRecovery) {
                canopyRecovery = "No shoots present"
            }
            ForestButton(text: "No sub canopy present", selectedOption: $canopyRecovery) {
                canopyRecovery = "No sub canopy present"
            }
        }
    }

    var treeRecoveryView: some View {
        VStack {
            Text("Tallest tree layer recovery")
            ForestButton(text: "Unburnt", selectedOption: $treeRecovery) {
                treeRecovery = "Unburnt"
            }
            ForestButton(text: "Basal shoots present", selectedOption: $treeRecovery) {
                treeRecovery = "Basal shoots present"
            }
            ForestButton(text: "Epicormic shoots present", selectedOption: $treeRecovery) {
                treeRecovery = "Epicormic shoots present"
            }
            ForestButton(text: "Epicormic and basal shoots present", selectedOption: $treeRecovery) {
                treeRecovery = "Epicormic and basal shoots present"
            }
            ForestButton(text: "No epicormic or basal shoots present", selectedOption: $treeRecovery) {
                treeRecovery = "No epicormic or basal shoots present"
            }
        }
    }
}

extension InputLocationView {
    var animalBirdView: some View {
        VStack {
            TextField("Animal", text: $animalType)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
            TextField("Bird", text: $birdRecord)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
        }
    }

    var floweringPlantsView: some View {
        VStack {
            Text("The state of any flowering plants")
            ForestButton(text: "Ground Layer", selectedOption: $floweringPlants) {
                floweringPlants = "Ground Layer"
            }
            ForestButton(text: "Shrub Layer", selectedOption: $floweringPlants) {
                floweringPlants = "Shrub Layer"
            }
            ForestButton(text: "Upper Canopy Layer", selectedOption: $floweringPlants) {
                floweringPlants = "Upper Canopy Layer"
            }
        }
    }
}

extension InputLocationView {
    var continueButton: some View {
        Button(action: {
            model.addData(
                time: time,
                date: date,
                landscapePosition: landscapePosition ?? "",
                vegetationType: vegetationType ?? "",
                developmentStage: developmentStage ?? "",
                severity: severity ?? "",
                groundRecovery: groundRecovery ?? "",
                shrubRecovery: shrubRecovery ?? "",
                canopyRecovery: canopyRecovery ?? "",
                treeRecovery: treeRecovery ?? "",
                animalType: animalType,
                birdRecord: birdRecord,
                floweringPlants: floweringPlants ?? ""
            )
            dismiss()
        }) {
            Text("Continue")
                .font(.custom("Chalkduster", size: 20)) // Chalkduster font
                .foregroundColor(.white)
                .padding(16)
                .frame(width: UIScreen.main.bounds.width - 32, alignment: .center)
                .background(Color.green)
                .cornerRadius(16)
        }
    }
}


struct InputLocationView_Previews: PreviewProvider {
    static var previews: some View {
        InputLocationView()
    }
}
