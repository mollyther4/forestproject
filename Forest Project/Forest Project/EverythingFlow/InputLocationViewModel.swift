//
//  InputLocationViewModel.swift
//  Forest Project
//
//  Created by Molly on 6/10/2023.
//

import Foundation
import Firebase

class InputLocationViewModel: ObservableObject {
    
    @Published var list = [InputLocation]()
    
    func addData(time: String, date: String, landscapePosition: String, vegetationType: String, developmentStage: String, severity: String, groundRecovery: String, shrubRecovery: String, canopyRecovery: String, treeRecovery: String, animalType: String, birdRecord: String, floweringPlants: String) {
        
        let db = Firestore.firestore()
        
        db.collection("inputLocation").addDocument(data: ["time": time, "date": date, "landscapePosition": landscapePosition, "vegetationType": vegetationType, "developmentStage": developmentStage, "severity": severity,"groundRecovery": groundRecovery, "shrubRecovery": shrubRecovery, "canopyRecovery": canopyRecovery, "treeRecovery": treeRecovery,"animalType": animalType, "birdRecord": birdRecord, "floweringPlants": floweringPlants]) { error in
            
            if error == nil {
                self.getData()
            } else {
                //handle error
            }
        }
    }
    
    func getData() {
        
        let db = Firestore.firestore()
        
        db.collection("inputLocation").getDocuments  { snapshot, error in
            
            if error == nil {
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        self.list = snapshot.documents.map { d in
                            return InputLocation(id: d.documentID,
                                                 time: d["time"] as? String ?? "",
                                                 date: d["date"] as? String ?? "",
                                                 landscapePosition: d["landscapePosition"] as? String ?? "",
                                                 vegetationType: d["vegetationType"] as? String ?? "",
                                                 developmentStage: d["developmentStage"] as? String ?? "",
                                                 severity: d["severity"] as? String ?? "",
                                                 groundRecovery: d["groundRecovery"] as? String ?? "",
                                                 shrubRecovery: d["shrubRecovery"] as? String ?? "",
                                                 canopyRecovery: d["shrubRecovery"] as? String ?? "",
                                                 treeRecovery: d["treeRecovery"] as? String ?? "",
                                                 animalType: d["animalType"] as? String ?? "",
                                                 birdRecord: d["birdRecord"] as? String ?? "",
                                                 floweringPlants: d["floweringPlants"] as? String ?? ""
                            )
                        }
                    }
                }
            } else {
                //handle error
            }
        }
    }
}

