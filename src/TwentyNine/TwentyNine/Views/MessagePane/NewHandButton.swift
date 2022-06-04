//=============================================================================//
//                                                                             //
//  NewHandButton.swift                                                        //
//  29                                                                         //
//                                                                             //
//  Created by Tyler J. Otte on 05/28/22.                                      //
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
import SwiftUI

/// A `Button` for creating a new `Hand`.
struct NewHandButton: View {
    
    /// The models' current data.
    @EnvironmentObject var modelData: ModelData
    
    /// The content to display.
    var body: some View {
        MessagePaneButton(title: "New Hand", action: modelData.clearHand)
    }
}

/// The `NewHandButton`'s preview configuration.
struct NewHandButton_Previews: PreviewProvider {
    
    /// The content to display.
    static var previews: some View {
        NewHandButton()
            .environmentObject(ModelData())
    }
}
