//
//  GlobalFunctions.swift
//  Forest Project
//
//  Created by Molly on 16/9/2023.
//

import Foundation

/// Delay in seconds on `MAIN` thread
/// - Parameters:
///   - seconds: elapse time to delay
///   - work: the action after delay
func delayInMain(in seconds: Double, execute work: @escaping (() -> Void)) {
    
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: work)
    
}
