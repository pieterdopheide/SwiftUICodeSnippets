//
//  CityTabView.swift
//  SwiftUI Code Snippets
//
//  Created by Dopheide,Pieter on 09/10/2024.
//

import SwiftUI

struct CityTabView: View {
    @Bindable private var navigator = NavigationManager.nav
    @State private var searchText = ""
    
    let cities = ["New York", "Los Angeles", "Chicago", "Houston", "Phoenix", "Philadelphia", "San Antonio", "San Diego", "Dallas", "San Jose"]
    
    // Filtered cities based on the search text
    var filteredCities: [String] {
        if searchText.isEmpty {
            return cities
        } else {
            return cities.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack(path: $navigator.cityNavigator) {
            List(filteredCities, id: \.self) { city in
                NavigationLink(value: NavigationDestination.city(city)){
                    Text(city)
                }
            }
            .navigationTitle("City Search")
            .toolbarTitleDisplayMode(.inline)
            .addToolbar()
            .addNavigationSupport()
            .addSearchbar(text: $searchText, prompt: "Search a city")
        }
    }
}

#Preview {
    CityTabView()
}
