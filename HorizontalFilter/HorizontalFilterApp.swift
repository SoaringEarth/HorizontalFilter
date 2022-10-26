//
//  HorizontalFilterApp.swift
//  HorizontalFilter
//
//  Created by Jonathon Albert on 27/09/2022.
//

import SwiftUI

@main
struct HorizontalFilterApp: App {

    let sections: [FilterCategory] = FilterCategory.allCases
    @State var selected: FilterCategory = .Recommendations

    let recommendations: [String] = ["Cyberpunk: Edgerunners", "Arcane", "The Sandman"]
    let features = ["Messaging", "User Profile", "Map"]
    let Tacos = ["Carne Asada", "Barbacoa", "Tacos de Birria"]
    let burgers = ["Lentil and Mushroom Burger", "Supreme Veggie Burger"]
    let pizza = ["Tuna", "Pepperoni", "Mushroom", "Extra cheese"]

    var body: some Scene {
        WindowGroup {
            VStack() {
                HorizontalFilterView(viewModel: HorizontalFilterViewModel(items: sections), selectedItem: $selected)
                switch selected {
                case .Recommendations:
                    ForEach(recommendations, id: \.self) { item in
                        Text(item)
                    }
                case .Features:
                    ForEach(features, id: \.self) { item in
                        Text(item)
                    }
                case .Tacos:
                    ForEach(Tacos, id: \.self) { item in
                        Text(item)
                    }
                case .Burgers:
                    ForEach(burgers, id: \.self) { item in
                        Text(item)
                    }
                case .Pizza:
                    ForEach(pizza, id: \.self) { item in
                        Text(item)
                    }
                }
            }
        }
    }
}
