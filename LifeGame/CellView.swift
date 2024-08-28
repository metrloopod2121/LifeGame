//
//  CellView.swift
//  LifeGame
//
//  Created by 𝕄𝕒𝕥𝕧𝕖𝕪 ℙ𝕠𝕕𝕘𝕠𝕣𝕟𝕚𝕪 on 27.08.2024.
//

import Foundation
import SwiftUI

struct CellView: View {
    @Binding var cell: Cell
    
    var cellIcon: some View {
        ZStack(alignment: .center) {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundStyle(cell.color)
            Text(cell.image)
        }
    }
    
    var body: some View {
        HStack {
            cellIcon
                .padding(.leading, 20)
            VStack(alignment: .leading) {
                Text(cell.cellType.rawValue)
                    .font(.title2)
                Text(cell.caption)
                    .font(.title3)
            }
            .padding(.horizontal, 10)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 70)
        .background(.white)
        .cornerRadius(20)
    }
}

#Preview {
    ContentView()
}



