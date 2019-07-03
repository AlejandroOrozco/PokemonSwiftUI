//
//  GeneralDetail.swift
//  Pokemon
//
//  Created by Alejandro Orozco Builes on 24/06/19.
//  Copyright © 2019 Alejandro Orozco Builes. All rights reserved.
//

import Combine
import SwiftUI

struct GeneralDetail : View {
    @Binding var selectedPokemon: Pokemon

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(selectedPokemon.color)
                    .shadow(radius: 5)
                    .frame(width: 350, height: 80)
                VStack {
                    Text(selectedPokemon.types.joined(separator: " / ")).font(.system(size: 24, design: .rounded)).bold().color(.white)
                    Text("Type").font(.system(size: 20, design: .rounded)).color(.white)
                }
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(selectedPokemon.color)
                    .shadow(radius: 5)
                    .frame(width: 350, height: 80)
                VStack {
                    Text("\(selectedPokemon.weight) lb").font(.system(size: 24, design: .rounded)).bold().color(.white)
                    Text("Weight").font(.system(size: 20, design: .rounded)).color(.white)
                }
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(selectedPokemon.color)
                    .shadow(radius: 5)
                    .frame(width: 350, height: 80)
                VStack {
                    Text("\(selectedPokemon.height) m").font(.system(size: 24, design: .rounded)).bold().color(.white)
                    Text("Height").font(.system(size: 20, design: .rounded)).color(.white)
                }
            }
        }.animation(.fluidSpring())
    }
}

#if DEBUG
struct GeneralDetail_Previews : PreviewProvider {
    @State static var pokemon = TestData.pokemons[0]
    static var previews: some View {
        GeneralDetail(selectedPokemon: $pokemon)
    }
}
#endif
