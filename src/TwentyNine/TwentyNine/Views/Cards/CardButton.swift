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
            
            try! manageCard()
            toggleButton()
            
        }) {
            Rectangle()
                .fill(isSelected ? Color.tahunaSands : .camarone)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .border(isSelected ? Color.fire : .tundora,
                        width: isSelected ? 2 : 0.2)
                .overlay(SuitImage(suit: card.suit).padding(3))
        }
    }
    
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    /// Determines if the `Deck` should deal the `Card` to the `Hand`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.`
    /// - Returns: True if the `Deck` should deal the `Card` to the `Hand`, else false.
    private func dealCard() -> Bool {
        
        return !isSelected && !modelData.hand.isFull()
    }
    
    /// Determines if the `Deck` should collect the `Card` from the `Hand`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.`
    /// - Returns: True if the `Deck` should collect the `Card` from the `Hand`.
    private func collectCard() -> Bool {
        
        return isSelected && !modelData.deck.isFull()
    }
    
    //=========================================================================//
    //                                UPDATERS                                 //
    //=========================================================================//
    
    /// Manages the transference of the button's `Card`, if necessary.
    ///
    /// - Precondition: None.
    /// - Postcondition: The `Card` is removed from the `Deck` and added to the `Hand` if it is
    ///                  not selected and the `Hand` is not full, or the `Card` is removed from the
    ///                  `Hand` and added to the `Deck` if it is selected, else no transfer occurs.
    private func manageCard() throws {
        
        if (dealCard()) {
            
            try modelData.deck.deal(card, to: modelData.hand)
           
        } else if (collectCard()) {
            
            try modelData.deck.collect(card, from: modelData.hand)
            
        } else {
        
            // Do nothing if not selected and Hand is full
        }
    }
    
    /// Toggles the button's selection state
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
        CardButton(card: try! Ace(of: .hearts))
            .environmentObject(modelData)
    }
}
