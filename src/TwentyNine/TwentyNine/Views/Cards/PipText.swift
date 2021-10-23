//=============================================================================//
//                                                                             //
//  PipText.swift                                                              //
//  29                                                                         //
//                                                                             //
//  Created by Tyler J. Otte on 10/04/21.                                      //
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

/// A `PlayingCard`'s pip `TextView`.
struct PipText: View, Hashable {
    
    /// The pip to display.
    var pip: String
    
    // The content to display.
    var body: some View {
        GeometryReader { geometry in
            Text(pip)
                .font(.system(size: 1000, design: .serif))
                .foregroundColor(Color.white)
                .shadow(radius: 5, x: 5, y: 15)
                .minimumScaleFactor(0.1)
                .frame(
                    minWidth: 0,
                    maxWidth: geometry.size.width,
                    minHeight: 0,
                    maxHeight: geometry.size.height,
                    alignment: .center
                )
        }
    }
}

/// The `PipText`'s preview configuration.
struct Pip_Previews: PreviewProvider {
    
    /// The content to display.
    static var previews: some View {
        PipText(pip: try! ModelData().deck.getNextCard().pip)
    }
}
