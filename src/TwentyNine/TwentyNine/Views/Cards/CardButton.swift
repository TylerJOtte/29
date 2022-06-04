//=============================================================================//
//                                                                             //
//  CardButton.swift                                                           //
//  29                                                                         //
//                                                                             //
//  Created by Tyler J. Otte on 10/03/21.                                      //
//-----------------------------------------------------------------------------//
//                                               ,.
// Copyright (c) 2021, Tyler J. Otte.                                          //
// Licensed under the GNU Affero General Public License v3.0.                  //
//                                                                             //
// See https://github.com/TylerJOtte/29/LICENSE.txt for more details.          //
//=============================================================================//

import SwiftUI
import Forge

/// A `PlayingCard Button`.
struct CardButton: View {

    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// The models' current data.
    @EnvironmentObject var modelData: ModelData

    /// The `Button`'s `PlayingCard`.
    var card: PlayingCard
    
    /// True if the `Hand` contains the given `Card`, else false.
    private var inHand: Bool {
        
        modelData.hand.contains(card)
    }
    
    /// The content to display.
    var body: some View {
        Button(action: {
            
            try! modelData.add(card)
                
        }) {
            Rectangle()
                .fill(inHand ? Color.tahunaSands : .camarone)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .border(inHand ? Color.fire : .tundora, width: inHand ? 2 : 0.23)
                .overlay(SuitImage(suit: card.suit).padding(8))
        }
    }
}

/// The `CardButton`'s preview configuration.
struct CardButton_Previews: PreviewProvider {
    
    /// The model's current data.
    static var modelData: ModelData = ModelData()
    
    /// The content to display.
    static var previews: some View {
        CardButton(card: try! Ace(of: .hearts))
            .environmentObject(modelData)
    }
}
