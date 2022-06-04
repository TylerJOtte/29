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
    
    var handCardGrids: [CardGrid] = []
    
    @Published var game: CribbageGame
    
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

        let game = CribbageGame()
        let deck = PlayingCardDeck()
        var cardGrids: [CardGrid] = []
        
        deck.sort()
        
        for _ in stride(from: 0, to: deck.count, by: 4) {

            let cards = try! deck.getNextCard(4)
            
            let buttons = cards.map{CardButton(card: $0 )}
            let topRow = CardRow(buttons: [buttons[0], buttons[1]])
            let bottomRow = CardRow(buttons: [buttons[2], buttons[3]])

            cardGrids.append(CardGrid(rows: [topRow, bottomRow]))
        }
        
        self.deck = deck
        self.hand = CribbageHand()
        self.cardGrids = cardGrids
        self.game = game
    }
    
    //=========================================================================//
    //                                 TESTERS                                 //
    //=========================================================================//
    
    /// Determines if the `Deck` should deal the given `Card` to the `Hand`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter card: The `Card` to test.
    /// - Returns: True if the `Deck` should deal the given `Card` to the `Hand`, else false.
    private func deal(_ card: PlayingCard) -> Bool {
        
        return !hand.contains(card) && !hand.isFull()
    }
    
    /// Determines if the `Deck` should collect the given `Card` from the `Hand`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter card: The `Card` to test.
    /// - Returns: True if the `Deck` should collect the given `Card` from the `Hand`.
    private func collect(_ card: PlayingCard) -> Bool {
        
        return !deck.contains(card) && !deck.isFull()
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
        
        assert(rank.isStandardPlayingCardRank())
        assert(cardGrids.contains(rank))
        
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

        let startIndex = getCardGridIndex(for: startRank)
        let endIndex = getCardGridIndex(for: endRank)
        
        return Array(cardGrids[startIndex...endIndex])
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
    internal func getCardGrids(for cards: [PlayingCard]) -> [CardGrid] {
        
        return cards.map{card in cardGrids.first(where: {$0.rank == card.rank})!}
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
    internal func getCardGrid(for card: PlayingCard) -> CardGrid {
        
        return cardGrids.first(where: {$0.rank! == card.rank})!
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
    internal func getCardGrid(for rank: Rank) -> CardGrid {
        
        return cardGrids.first(where: {$0.rank! == rank})!
    }
    
    //=========================================================================//
    //                                 ADDERS                                  //
    //=========================================================================//
    
    /// Adds the given `Card` to the `Deck` or `Hand` as applicable.
    ///
    /// - Precondition: None.
    /// - Postcondition: The given `Card` is added to the `Deck` or `Hand` as applicable.
    /// - Parameter card: The `Card` to add to `Deck` or `Hand`.
    internal func add(_ card: PlayingCard) throws {
        
        if (deal(card)) {
            
            try deck.deal(card, to: hand)
           
        } else if (collect(card)) {
            
            try deck.collect(card, from: hand)
            
        } else {
        
            // Do nothing
        }
        
        objectWillChange.send()
    }
    
    //=========================================================================//
    //                                 REMOVERS                                //
    //=========================================================================//
    
    /// Removes all `Card`s from the `Hand`, and adds them back into the `Deck`.
    ///
    /// - Precondition:
    ///   - The `Deck` cannot be full.
    ///   - The `Deck` must not contain any of the `Hand`'s `Card`s.
    /// - Postcondition:
    ///   - The `Deck` contains all of the `Hand`'s `Card`s.
    ///   - The `Hand` is empty.
    internal func clearHand() {
        
        do {
            
            try deck.collect(hand)
            objectWillChange.send()
        }
        catch ElementsError.isFull {
            
            print("The deck is full.")
        }
        catch ElementsError.invalidDuplicateCount {
            
            print("The deck already contains 1+ cards in the hand.")
        }
        catch {
            
            print("Error. Failed to clear hand.")
            print(error)
        }
    }
}
