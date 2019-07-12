//
//  ContentView.swift
//  Pokemon
//
//  Created by Alejandro Orozco Builes on 24/06/19.
//  Copyright © 2019 Alejandro Orozco Builes. All rights reserved.
//

import Combine
import SwiftUI

struct Home : View {
    @State var pokemons = TestData.pokemons
    @State var selectedPokemon = TestData.pokemons[0]
    @State var selectedDetail = 0

    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    PokemonList(pokemons: $pokemons, selectedPokemon: $selectedPokemon).frame(height: 300)
                }.frame(height: 320)
                SegmentedControl(selection: $selectedDetail){
                    Text("General").tag(0)
                    Text("Abilities").tag(1)
                    Text("Stats").tag(2)
                    }.padding(.horizontal, 20).frame(height: 25)
                Spacer().frame(height: 25)
                if selectedDetail == 0 {
                    GeneralDetail(selectedPokemon: $selectedPokemon)
                } else {
                    Text("Nothing")
                }
                
                }
            .navigationBarTitle(Text("Pokemons"))
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        Home()
    }
}
#endif

struct PokemonList : View {
    @Binding var pokemons: [Pokemon]
    @Binding var selectedPokemon: Pokemon
    
    var body: some View {
        return HStack(alignment: .center, spacing: 25, content: {
            ForEach(pokemons.identified(by: \.id)) { pokemon in
                VStack {
                    Image(pokemon.name)
                        .resizable()
                        .frame(width: self.pokemonImageSize(pokemon).width, height: self.pokemonImageSize(pokemon).height)
                        .clipShape(Circle())
                        .shadow(radius: 15)
                        .overlay(Circle().stroke(pokemon.color.opacity(0.5), lineWidth: 5))
                    Text(pokemon.name.capitalized).fontWeight(.bold).font(.subheadline).padding(8).background(pokemon.color.blur(radius: 8)).foregroundColor(.white).cornerRadius(20)
                }.tapAction {
                    self.selectedPokemon = pokemon
                }
            }
        }).padding(EdgeInsets(top: 25, leading: 160, bottom: 20, trailing: 160)).animation(.basic())
    }
    
    private func pokemonImageSize(_ pokemon: Pokemon) -> CGSize {
        return self.selectedPokemon == pokemon ? CGSize(width: 220, height: 220) : CGSize(width: 120, height: 120)
    }
}
