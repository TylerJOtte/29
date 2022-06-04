//=============================================================================//
//                                                                             //
//  MessagePaneButton.swift                                                    //
//  29                                                                         //
//                                                                             //
//  Created by Tyler J. Otte on 10/13/21.                                      //
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

/// An action button for the `MessagePane`.
struct MessagePaneButton: View {
    
    /// The models' current data.
    @EnvironmentObject var modelData: ModelData
    
    /// The `Button`'s primary name.
    var title: String

    /// The action to perform on `Button` click.
    var action: (() -> Void?)?
    
    /// The content to display.
    var body: some View {
        
        Button(action: {
            
            if let action = action { action() }
            
        }) {
            Text(title)
            .padding(.all, 5)
            .frame(maxWidth: .infinity)
            .background(Color.whiteGradient)
            .foregroundColor(.black)
            .font(.system(.caption, design: .serif))
            .border(Color.white, width: 0.5)
            .shadow(radius: 5, x: 5, y: 15)
            .opacity(modelData.hand.isFull() ? 1 : 0)
        }
    }
}

/// The `MessagePaneButton`'s preview configuration.
struct MessagePaneButton_Previews: PreviewProvider {
    
    /// The content to display.
    static var previews: some View {
        MessagePaneButton(title: "New Hand")
            .environmentObject(ModelData())
    }
}
