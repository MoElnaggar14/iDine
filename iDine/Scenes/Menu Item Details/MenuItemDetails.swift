//
//  MenuItemDetails.swift
//  iDine
//
//  Created by Mohammed Elnaggar on 26/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import SwiftUI

struct MenuItemDetails: View {
    
    let item: MenuItem
    
    var body: some View {
        VStack {
            Image(item.mainImage)
            Text(item.description).padding()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MenuItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MenuItemDetails(item: .example)
        }
    }
}
