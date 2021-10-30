//=============================================================================//
//                                                                             //
//  HandRankTitle.swift                                                        //
//  29                                                                         //
//                                                                             //
//  Created by Tyler J. Otte on 10/27/21.                                      //
//-----------------------------------------------------------------------------//
//                                                                             //
// This source file is part of the 29 project.                                 //
//                                                                             //
// Copyright (c) 2021, Tyler J. Otte.                                          //
// Licensed under the GNU Affero General Public License v3.0.                  //
//                                                                             //
// See https://github.com/TylerJOtte/29/LICENSE.txt for more details.          //
//=============================================================================//

import SwiftUI
import Forge

/// A `HandRank`'s title.
struct HandRankTitle: View {
    
    /// The `HandRank` to display title for.
    var rank: Rank
    
    /// The content to display.
    var body: some View {

        Text(rank.title.plural)
            .frame(maxWidth: .infinity)
            .padding()
            .font(.system(.title2, design: .serif))
            .background(Color.black)
            .foregroundColor(.white)
            .border(.white, width: 0.5)
    }
}

/// The `HandRankTitle`'s preview configuration.
struct HandRankTitle_Previews: PreviewProvider {
    
    /// The content to display.
    static var previews: some View {
        HandRankTitle(rank: Rank.fourOfAKind)
    }
}
