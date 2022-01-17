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

    /// True if the `Button` is selected, else false.
    @State private var isSelected = false
    
    /// The content to display.
    var body: some View {
        Button(action: {
            
            if (addToHand()) {
                
                try! modelData.deck.deal(card, to: modelData.hand)
               
            } else if (isSelected) {
                
                _ = try! modelData.hand.remove(card)
                try! modelData.deck.add(card)
                
            } else {
            

            }
            
            toggleButton()
            
        }) {
            Rectangle()
                .fill(isSelected ? Color.tahunaSands : .camarone)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .border(isSelected ? Color.fire : .tundora,
                        width: isSelected ? 2 : 0.2)
                .overlay(SuitImage(suit: card.suit)
                            .padding(8))
        }
    }
    
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    /// Determines if the `Card` should be added to the `Hand`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.`
    /// - Returns: True if the `Card` shouild be added to the `Hand`, else false.
    private func addToHand() -> Bool {
        
        return !isSelected && !modelData.hand.isFull()
    }
    
    //=========================================================================//
    //                                UPDATERS                                 //
    //=========================================================================//
    
    /// Toggles the button selection state
    ///
    /// - Precondition: None.
    /// - Postcondition: The selection state is toggled to true/false inverse.
    private func toggleButton() {
        
        self.isSelected.toggle()
    }
}

/// The `CardButton`'s preview configuration.
struct CardButton_Previews: PreviewProvider {
    
    /// The model's current data.
    static var modelData: ModelData = ModelData()
    
    /// The content to display.
    static var previews: some View {
        CardButton(card: try! modelData.deck.getNextCard() )
            .environmentObject(modelData)
    }
}
