//
//  ContentView.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 01/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            PokemonExploreView(viewModel: ExploreModule().provideExploreViewModel())
        }
    }
}

#Preview {
    ContentView()
}
