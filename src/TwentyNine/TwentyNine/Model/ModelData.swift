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
    
    /// Retrieves the next `CardGrid` from the `Deck`.
    ///
    /// - Precondition: The `Deck`'s count must be >= 4.
    /// - Postcondition: The next four `Card`s are dealt from the `Deck` if its count >= 4.
    /// - Returns: The `Deck`'s next `CardGrid`, or `nil` if `Deck`'s count is not >= 4.
    internal func getNextGrid() -> CardGrid? {
    
        var grid: CardGrid?
        
        if (deck.count >= 4) {

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
            
            grid = CardGrid(rows: [topRow, bottomRow])
        }
    
        return grid
    }
}
