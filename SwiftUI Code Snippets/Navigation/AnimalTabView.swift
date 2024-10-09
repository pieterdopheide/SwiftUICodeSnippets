//
//  AnimalTabView.swift
//  SwiftUI Code Snippets
//
//  Created by Dopheide,Pieter on 09/10/2024.
//

import SwiftUI

struct AnimalTabView: View {
    @Bindable private var navigator = NavigationManager.nav
    @State private var searchText = ""
    
    let animals = ["Lion", "Tiger", "Elephant", "Giraffe", "Zebra", "Penguin", "Kangaroo", "Panda", "Koala", "Leopard"]
    
    // Filtered cities based on the search text
    var filteredAnimals: [String] {
        if searchText.isEmpty {
            return animals
        } else {
            return animals.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack(path: $navigator.animalNavigator) {
            List(filteredAnimals, id: \.self) { animal in
                Text(animal)
            }
            .navigationTitle("Animal Search")
            .toolbarTitleDisplayMode(.inline)
            .addToolbar()
            .addNavigationSupport()
            .addSearchbar(text: $searchText, prompt: "Search an animal")
        }
    }
}

#Preview {
    AnimalTabView()
}
