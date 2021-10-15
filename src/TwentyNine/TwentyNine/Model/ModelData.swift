//=============================================================================//
//                                                                             //
//  ModelData.swift                                                            //
//  29                                                                         //
//                                                                             //
//  Created by Tyler J. Otte on 10/03/21.                                      //
//-----------------------------------------------------------------------------//
//                                                                             //
// This source file is part of the 29 project.                                 //
//                                                                             //
// Copyright (c) 2021, Tyler J. Otte.                                          //
// Licensed under the GNU Affero General Public License v3.0.                  //
//                                                                             //
// See https://github.com/TylerJOtte/29/LICENSE.txt for more details.          //
//=============================================================================//

import Forge

/// The models' data to use in the app.
final class ModelData: ObservableObject {
    
    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//

    /// The `Deck` of `Card`s to manage.
    @Published var deck: PlayingCardDeck = load()
    
    /// The user's `Hand`.
    @Published var hand: CribbageHand = CribbageHand()
    
    //=========================================================================//
    //                                 LOADERS                                 //
    //=========================================================================//
    
    /// Retrieves a new `PlayingCardDeck`, sorted by `Rank`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Returns: A new `PlayingCardDeck`, sorted by `Rank`.
    private static func load() -> PlayingCardDeck {
        
        let deck = PlayingCardDeck()
        
        deck.sortByRank()
        
        return deck
    }
}
