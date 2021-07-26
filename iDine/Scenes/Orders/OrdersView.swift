//
//  OrdersView.swift
//  iDine
//
//  Created by Mohammed Elnaggar on 26/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import SwiftUI

struct OrdersView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("Place Order")
                    }
                }
            }
            .navigationTitle("Orders")
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
            .environmentObject(Order())
    }
}
