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
    
    /// The text to display in message pane.
    private var messageText: String {
        
        modelData.hand.isFull() ? "\(modelData.hand.count)" : "Select hand"
    }
    
    @State private var showButtons = false
    
    /// The content to display.
    var body: some View {

        VStack {
            MessagePaneButton(title: "New Hand")
            Spacer()
            Message(text: messageText)
            Spacer()
            MessagePaneButton(title: "Breakdown")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.redGradient)
        .border(Color.white, width: 0.5)
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
