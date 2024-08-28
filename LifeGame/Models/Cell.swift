//
//  Cell.swift
//  LifeGame
//
//  Created by 𝕄𝕒𝕥𝕧𝕖𝕪 ℙ𝕠𝕕𝕘𝕠𝕣𝕟𝕚𝕪 on 27.08.2024.
//

import Foundation
import SwiftUI

enum CellType: String {
    case dead = "Мёртвая"
    case alive = "Живая"
    case life = "Жизнь"
}

struct Cell: Identifiable {
    let id: UUID = UUID()
    var cellType: CellType
    
    var caption: String {
        switch cellType {
        case .dead:
            "или прикидывается"
        case .alive:
            "и шевелится!"
        case .life:
            "Ку-ку!"
        }
    }
    
    var image: String {
        switch cellType {
        case .dead:
            "\u{1F480}"
        case .alive:
            "\u{1F4A5}"
        case .life:
            "\u{1F423}"
        }
    }
    
    var color: Gradient {
        switch cellType {
        case .dead:
            Gradient(colors: [Color(red: 17/255, green: 103/255, blue: 138/255), Color(red: 175/255, green: 253/255, blue: 179/255)])
        case .alive:
            Gradient(colors: [Color(red: 1, green: 184/255, blue: 0/255), Color(red: 255/255, green: 247/255, blue: 175/255)])
        case .life:
            Gradient(colors: [Color(red: 174/255, green: 2/255, blue: 255/255), Color(red: 255/255, green: 175/255, blue: 234/255)])
        }
    }
    
    init(cellType: CellType) {
        self.cellType = cellType
    }
}

