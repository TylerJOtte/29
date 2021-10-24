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
    @Published var deck: PlayingCardDeck
    
    /// The user's `Hand`.
    @Published var hand: CribbageHand
    
    /// The `PlayingCardDeck`'s `CardGrids` to display.
    private let cardGrids: [CardGrid]
    
    /// True if register change, else false
    @Published internal var register: String = "Register"
    
    //=========================================================================//
    //                               CONSTRUCTORS                              //
    //=========================================================================//
    
    /// Creates a default `ModelData`.
    ///
    /// - Precondition: None.
    /// - Postcondition:
    ///   - The `Deck` contains 52 `PlayingCard`s without `Joker`s, sorted by ascending `Rank`.
    ///   - The `Hand` is empty.
    ///   - The `CardGrid`s contain 13 elements, one for each `Rank`.
    internal init() {

        let deck = PlayingCardDeck()
        var cardGrids: [CardGrid] = []
        
        deck.sortByRank()
        
        for _ in stride(from: 0, to: deck.count, by: 4) {

            let cards = try! deck.getNextCard(4)
            
            let buttons = cards.map{CardButton(card: $0)}
            let topRow = CardRow(buttons: [buttons[0], buttons[1]])
            let bottomRow = CardRow(buttons: [buttons[2], buttons[3]])

            cardGrids.append(CardGrid(rows: [topRow, bottomRow]))
        }
        
        self.deck = deck
        self.hand = CribbageHand()
        self.cardGrids = cardGrids
    }
    
    //=========================================================================//
    //                                  GETTERS                                //
    //=========================================================================//
    
    /// Retrieves the index of the given `Rank`'s respective `CardGrid` in the `CardGrid`collection.
    ///
    /// - Precondition:
    ///   - The given `Rank` must be a standard `PlayingCard Rank`.
    ///   - The `CardGrid` collection must contain a `CardGrid` with the given `Rank`.
    /// - Postcondition: None.
    /// - Parameter rank: The `Rank` to get `CardGrid` for.
    /// - Returns: The index of the given `Rank`'s respective `CardGrid`.
    private func getCardGridIndex(for rank: Rank) -> Int {
        
//        assert(rank.isStandardPlayingCardRank())
//        assert(cardGrids.contains(rank))
        
        return cardGrids.firstIndex(where: {$0.rank == rank})!
    }
    
    /// Retrieves a `CardGrid` collection from the given start `Rank` to the specifed end `Rank`.
    ///
    /// - Precondition:
    ///   - The given `Rank`s must be standard `PlayingCard Rank`s.
    ///   - The given start `Rank` must precede or equal the specifed end `Rank`.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - startRank: The first `Rank` to get `CardGrid` for.
    ///   - endRank: The last `Rank` to get `CardGrid` for.
    /// - Returns: An `Array` of `CardGrid`s for the given range.
    internal func getCardGrids(from startRank: Rank, to endRank: Rank) ->
        [CardGrid] {
        
//        assert(startRank.rawValue <= endRank.rawValue)
            
        let startIndex = getCardGridIndex(for: startRank)
        let endIndex = getCardGridIndex(for: endRank)
        
        return Array(cardGrids[startIndex...endIndex])
    }
}
