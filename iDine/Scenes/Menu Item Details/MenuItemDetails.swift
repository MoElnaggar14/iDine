//
//  MenuItemDetails.swift
//  iDine
//
//  Created by Mohammed Elnaggar on 26/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import SwiftUI

struct MenuItemDetails: View {
    
    @EnvironmentObject var order: Order
    let item: MenuItem
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                
                Text("ⓒ\(item.photoCredit)")
                    .padding(4)
                    .background(Color.black.opacity(0.5))
                    .foregroundColor(.white)
                    .font(.caption)
                    .cornerRadius(3.0)
                    .offset(CGSize(width: -5, height: -5))
            }
            
            Text(item.description).padding()
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MenuItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MenuItemDetails(item: .example)
                .environmentObject(Order())
        }
    }
}
