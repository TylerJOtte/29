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
    
    /// True if the `Button` is selected, else false.
    @State private var isSelected = false
    
    /// The `Button`'s `PlayingCard`.
    var card: PlayingCard
    
    /// The content to display.
    var body: some View {
        Button(action: {
            
            if (try! addCard()) {
                
                toggleButton()
            }
            
        }) {
            Rectangle()
                .fill(isSelected ? Color.tahunaSands : .camarone)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .border(isSelected ? Color.fire : .tundora,
                        width: isSelected ? 2 : 0.23)
                .overlay(SuitImage(suit: card.suit).padding(8))
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
    
    /// Adds the `Card` to the `Deck` or `Hand`, if applicable
    ///
    /// - Precondition: None.
    /// - Postcondition: The `Card` is added to the `Deck` or `Hand`, if applicable.
    /// - Returns: True if the `Card` is added to the `Deck` or `Hand`, else false.
    private func addCard() throws -> Bool {
        
        var addedCard = true
        
        if (dealCard()) {
            
            try modelData.deck.deal(card, to: modelData.hand)
           
        } else if (collectCard()) {
            
            try modelData.deck.collect(card, from: modelData.hand)
            
        } else { // Not selected and Hand is full
        
            addedCard = false
        }
        
        // Published complex types won't update (e.g., add Card to Hand) for
        // some reason if don't register some type of simple primitive variable
        // change.
        modelData.register();
        
        return addedCard
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
