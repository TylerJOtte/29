//=============================================================================//
//                                                                             //
//  MessagePane.swift                                                          //
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

/// A user message pane.
struct MessagePane: View {
    
    /// The models' current data.
    @EnvironmentObject var modelData: ModelData
    
    /// True if show action `Button`s, else false.
    @State private var showButtons = false
    
    /// The content to display.
    var body: some View {

        VStack {
            MessagePaneButton(title: "New Hand")
            Spacer()
            Message(text: modelData.hand.isFull() ? "\(modelData.hand.getScore().points)" : "Select hand")
            Spacer()
            MessagePaneButton(title: "Breakdown")
        }
        .background(Color.redGradient)
        .border(Color.black, width: 0.5)
        .clipped()
    }
}

/// The `MessagePane`'s preview configuration.
struct MessagePane_Previews: PreviewProvider {
    
    /// The content to display.
    static var previews: some View {
        MessagePane()
            .environmentObject(ModelData())
    }
}
