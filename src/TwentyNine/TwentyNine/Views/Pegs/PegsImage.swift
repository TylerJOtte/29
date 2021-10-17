//=============================================================================//
//                                                                             //
//  PegsImage.swift                                                            //
//  29                                                                         //
//                                                                             //
//  Created by Tyler J. Otte on 10/15/21.                                      //
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

/// An `ImageView` for a pegs depiction.
struct PegsImage: View {

    /// The content to display
    var body: some View {
    
        Image("Pegs")
            .resizable()
            .border(Color.black, width: 0.5)
    }
}

/// The `PegsImage`'s preview configuration.
struct PegsImage_Previews: PreviewProvider {
    
    /// The content to display.
    static var previews: some View {
        PegsImage()
    }
}
