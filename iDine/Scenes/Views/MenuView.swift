//
//  MenuView.swift
//  iDine
//
//  Created by Mohammed Elnaggar on 25/07/2021.
//  Copyright © 2021 Mohammed Elnaggar. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
        
    fileprivate func extractedFunc() -> List<Never, ForEach<[MenuSection], UUID, Section<Text, ForEach<[MenuItem], UUID, Text>, EmptyView>>> {
        return List {
            ForEach(menu) { section in
                Section(header: Text(section.name)) {
                    ForEach(section.items) {
                        Text($0.name)
                    }
                }
            }
        }
    }
    
    var body: some View {
        NavigationView {
            extractedFunc()
            .navigationTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
