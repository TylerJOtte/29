//=============================================================================//
//                                                                             //
//  CollectionExtension.swift                                                  //
//  29                                                                         //
//                                                                             //
//  Created by Tyler J. Otte on 10/23/21.                                      //
//-----------------------------------------------------------------------------//
//                                                                             //
// This source file is part of the 29 project.                                 //
//                                                                             //
// Copyright (c) 2021, Tyler J. Otte.                                          //
// Licensed under the GNU Affero General Public License v3.0.                  //
//                                                                             //
// See https://github.com/TylerJOtte/29/LICENSE.txt for more details.          //
//=============================================================================//

import Foundation
import Forge

/// An extension for a `CardGrid Collection`.
internal extension Collection where Element == CardGrid {
    
    /// Determines if the `Collection` contains a `CardGrid` with the given `Rank`.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameter rank: The `Rank` of the `CardGrid` to search for.
    /// - Returns: True if contains a `CardGrid` with the given `Rank`, else false.
    func contains(_ rank: Rank) -> Bool {
        
        return contains(where: {$0.rank == rank})
    }
}
