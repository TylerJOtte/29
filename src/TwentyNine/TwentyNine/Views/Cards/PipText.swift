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
struct PipText: View {
    
    /// The pip to display.
    var pip: String

    /// The font color.
    var foregroundColor: Color = .white

    // The content to display.
    var body: some View {
        Text(pip)
            .font(.system(size: 1000, design: .serif))
            .foregroundColor(foregroundColor)
            .shadow(radius: 5, x: 5, y: 15)
            .minimumScaleFactor(0.01)
    }
}

/// The `PipText`'s preview configuration.
struct PipText_Previews: PreviewProvider {
    
    /// The content to display.
    static var previews: some View {
        PipText(pip: try! Ace(of: .hearts).pip)
            .environmentObject(ModelData())

    }
}
