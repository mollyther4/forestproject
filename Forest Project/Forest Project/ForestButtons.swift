//
//  ForestButtons.swift
//  Forest Project
//
//  Created by Molly on 16/9/2023.
//

import Foundation
import SwiftUI

struct ForestButton: View {
    private let text: String
    @Binding var selectedOption: String?
    private let action: (() -> Void)?

    public init(text: String, selectedOption: Binding<String?>, action: (() -> Void)? = nil) {
        self.text = text
        self._selectedOption = selectedOption
        self.action = action
    }

    var body: some View {
        Button(action: {
            action?()
        }) {
            Text(text)
                .font(.subheadline)
                .foregroundColor(selectedOption == text ? .white : .green) // Dark green text when not selected, white text when selected
                .padding(16)
                .frame(width: UIScreen.main.bounds.width - 32, alignment: .center)
                .background(selectedOption == text ? Color.green : Color.clear) // Shaded green when selected
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.green, lineWidth: 2) // Dark green outline
                )
        }
    }
}

    
//    var homeButton: some View {
//        Button(action: {
//            action?()
//        }) {
//            VStack(alignment: .leading, spacing: 4.0) {
//                Text(text)
//                    .font(.subheadline)
//                    .foregroundColor(.black)
//            }
//            .padding(16)
//            .frame(width: UIScreen.main.bounds.width - 32, alignment: .center)
//            .background(Color.red)
//            .cornerRadius(16)
//        }
//    }
//}
