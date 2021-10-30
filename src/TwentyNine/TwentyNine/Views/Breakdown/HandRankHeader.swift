//=============================================================================//
//                                                                             //
//  BreakdownTitle.swift                                                       //
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


struct BreakdownTitle: View {
    var body: some View {
        HStack(spacing: 0) {
            Text("\(title)\(plural)")
                .frame(width: geometry.size.width * 0.63)
                .padding(.leading, geometry.size.width * 0.18)
                .padding(.vertical)
                .background(Color.black)
            Text("+ \(handRanks.totalPoints)")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.redGradient)
                .border(width: 1, edges: [.leading], color: .white)
        }
        .font(.system(.title2, design: .serif))
        .foregroundColor(Color(hex: "FEFEFE"))
        .border(Color.white, width: 1)
    }
}

struct BreakdownTitle_Previews: PreviewProvider {
    static var previews: some View {
        BreakdownTitle()
    }
}
