//
//  ViewExistingView.swift
//  Forest Project
//
//  Created by Molly on 8/10/2023.
//

import SwiftUI

struct ViewExistingView: View {
    
    @ObservedObject var model = ViewExistingViewModel()
    
    var body: some View {
        Text("View Existing Entries")
        List {
            ForEach(Array(model.list.enumerated()), id: \.element.id) { (index, item) in
                Section(header: Text("Entry \(index + 1)")) {
                    Text("Date and Time: \(item.date) at \(item.time)")
                    Text("Landscape Position: \(item.landscapePosition)")
                    Text("Vegetation Type: \(item.vegetationType)")
                    Text("Development Stage: \(item.developmentStage)")
                    Text("Severity: \(item.severity)")
                    Text("Ground Recovery: \(item.groundRecovery)")
                    Text("Shrub Recovery: \(item.shrubRecovery)")
                    Text("Canopy Recovery: \(item.canopyRecovery)")
                    Text("Tree Recovery: \(item.treeRecovery)")
                    Text("Bird & Animal Type: \(item.animalType) & \(item.birdRecord)")
                    //Text("Flowering Plants: \(item.floweringPlants)")
                }
            }
        }
    }
    
    init() {
        model.getData()
    }
}
struct ViewExistingView_Previews: PreviewProvider {
    static var previews: some View {
        ViewExistingView()
    }
}
