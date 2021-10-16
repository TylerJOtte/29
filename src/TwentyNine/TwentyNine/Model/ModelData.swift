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
    
    /// The `CardGrid`s for the `Deck`.
    var deckGrids: [CardGrid] {
    
        var grids: [CardGrid] = []
        
        if (deck.count >= 4) {
         
            for _ in stride(from: 0, to: deck.count - 3, by: 4) {
            
                let cards = try! deck.dealCards(4)
                let heart = cards.first{$0.suit == .hearts}!
                let club = cards.first{$0.suit == .clubs}!
                let spade = cards.first{$0.suit == .spades}!
                let diamond = cards.first{$0.suit == .diamonds}!
                let buttons = [
                    CardButton(card: heart),
                    CardButton(card: club),
                    CardButton(card: spade),
                    CardButton(card: diamond)
                ]
                let topRow = CardRow(buttons: [buttons[0], buttons[1]])
                let bottomRow = CardRow(buttons: [buttons[2], buttons[3]])
                let grid = CardGrid(rows: [topRow, bottomRow])
                
                grids.append(grid)
            }
        }
    
        return grids
    }
    
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
