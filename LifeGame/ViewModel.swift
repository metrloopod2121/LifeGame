//
//  ViewModel.swift
//  LifeGame
//
//  Created by 𝕄𝕒𝕥𝕧𝕖𝕪 ℙ𝕠𝕕𝕘𝕠𝕣𝕟𝕚𝕪 on 27.08.2024.
//

import Foundation
import SwiftUI


final class Cells: ObservableObject {
    
    @Published var cellArray: [Cell] = []

    
    private func killCell() {
        var i = cellArray.count-1
        while i > 0 {
            if cellArray[i].cellType == .life {
                cellArray[i].cellType = .dead
                i = -1
            }
            i -= 1
        }
    }
    
    private func checkCountOfDeadCells() {
        let size = cellArray.count
        var i = size-1
        if size > 3 {
            if cellArray[size-1].cellType == .dead && cellArray[size-2].cellType == .dead &&
                cellArray[size-3].cellType == .dead {
                killCell()
            }
        }
        
    }
    
    private func generateCell() {
        let randomNumber = Int.random(in: 2..<4)
        if randomNumber % 2 == 1 {
            let newCell = Cell(cellType: .alive)
            cellArray.append(newCell)
        } else {
            let newCell = Cell(cellType: .dead)
            cellArray.append(newCell)
        }
    }
    
    func addCell() {
        let size = cellArray.count
        if size < 3 {
            generateCell()
        } else {
            if cellArray[size-1].cellType == .alive &&
                cellArray[size-2].cellType == .alive &&
                cellArray[size-3].cellType == .alive {
                cellArray.append(Cell(cellType: .life))
            } else {
                generateCell()
            }
        }
        checkCountOfDeadCells()
    }
}

#Preview {
    ContentView()
}
