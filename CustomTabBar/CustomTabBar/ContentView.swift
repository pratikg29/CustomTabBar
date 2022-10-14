//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Pratik on 14/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


enum Tab: String, Identifiable, CaseIterable {
    case home, stats, favourites, settings
    
    internal var id: String { rawValue }
    
    var icon: String {
        switch self {
        case .home:
            return "house.fill"
        case .stats:
            return "chart.bar.xaxis"
        case .favourites:
            return "suit.heart.fill"
        case .settings:
            return "gearshape.fill"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .stats:
            return "Stats"
        case .favourites:
            return "Favorite"
        case .settings:
            return "Settings"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
            return .indigo
        case .stats:
            return .purple
        case .favourites:
            return .mint
        case .settings:
            return .gray
        }
    }
}
