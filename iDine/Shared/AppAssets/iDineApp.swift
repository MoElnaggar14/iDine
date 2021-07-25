//
//  iDineApp.swift
//  iDine
//
//  Created by Mohammed Elnaggar on 25/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import SwiftUI

@main
struct iDineApp: App {
    
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MenuView()
                .environmentObject(order)
        }
    }
}
