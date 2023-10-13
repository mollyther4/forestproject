//
//  ViewExistingViewModel.swift
//  Forest Project
//
//  Created by Molly on 8/10/2023.
//

import Foundation
import Firebase

class ViewExistingViewModel: ObservableObject {
    
    @Published var list = [InputLocation]()
    
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

