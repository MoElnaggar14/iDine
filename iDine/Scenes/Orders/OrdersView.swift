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
                    .onDelete(perform: { deleteItem(at: $0) })
                }
                
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("Place Order")
                    }
                }
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("Orders")
            .listStyle(InsetGroupedListStyle())
            .toolbar(content: {
                EditButton()
            })
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
            .environmentObject(Order())
    }
}
