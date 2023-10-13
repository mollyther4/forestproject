//
//  HomeView.swift
//  Forest Project
//
//  Created by Molly on 13/9/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var addNew = false
    
    @State private var viewExisting = false
    
    @State private var viewUpload = false
    
    @State private var someSelectedOption = ""
    

    var body: some View {
        NavigationView {
            VStack {
                Image("tree") // Add the tree icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                Text("FOREST PROJECT!")
                    .font(.custom("Chalkduster", size: 30)) // Using Chalkduster font
                    .foregroundColor(Color.green)
                addNewButton
                viewExistingButton
                
            }
            .padding()
        }
        .background(
            NavigationLink("", destination: InputLocationView(), isActive: $addNew)
                .opacity(0)
            
        )
        .background(
            NavigationLink("", destination: ViewExistingView(), isActive: $viewExisting) // Link to ViewExistingView
                .opacity(0)
        )
        
    }
    
}
extension HomeView {
    var addNewButton: some View {
        Button(action: {
            addNew = true
        }) {
            Text("Add New")
                .font(.custom("AnotherCoolFont", size: 20)) // Replace "AnotherCoolFont" with your preferred font
                .foregroundColor(Color.green)
                .padding(16)
                .frame(width: UIScreen.main.bounds.width - 32, alignment: .center)
                .background(Color.white)
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.green, lineWidth: 2) // Green outline
                )
        }
    }
    
    var viewExistingButton: some View {
        Button(action: {
            viewExisting = true
        }) {
            Text("View Existing")
                .font(.custom("AnotherCoolFont", size: 20)) // Replace "AnotherCoolFont" with your preferred font
                .foregroundColor(Color.green)
                .padding(16)
                .frame(width: UIScreen.main.bounds.width - 32, alignment: .center)
                .background(Color.white)
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.green, lineWidth: 2) // Green outline
                )
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
