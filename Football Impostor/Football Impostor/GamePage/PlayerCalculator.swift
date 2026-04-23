struct PlayerCalculatorProps {
    let civilians: Int
    let impostor: Int
    let mrWhite: Int
}

func calculatePlayers(player: Int) -> PlayerCalculatorProps {
    switch player {
    case 4:  return .init(civilians: 3, impostor: 1, mrWhite: 0)
    case 5:  return .init(civilians: 3, impostor: 1, mrWhite: 1)
    case 6:  return .init(civilians: 4, impostor: 1, mrWhite: 1)
    case 7:  return .init(civilians: 4, impostor: 2, mrWhite: 1)
    case 8:  return .init(civilians: 5, impostor: 2, mrWhite: 1)
    case 9:  return .init(civilians: 5, impostor: 3, mrWhite: 1)
    case 10: return .init(civilians: 6, impostor: 3, mrWhite: 1)
    case 11: return .init(civilians: 6, impostor: 3, mrWhite: 2)
    case 12: return .init(civilians: 7, impostor: 3, mrWhite: 2)
    case 13: return .init(civilians: 7, impostor: 4, mrWhite: 2)
    case 14: return .init(civilians: 8, impostor: 4, mrWhite: 2)
    case 15: return .init(civilians: 8, impostor: 5, mrWhite: 2)
    case 16: return .init(civilians: 9, impostor: 5, mrWhite: 2)
    case 17: return .init(civilians: 9, impostor: 5, mrWhite: 3)
    case 18: return .init(civilians: 10, impostor: 5, mrWhite: 3)
    case 19: return .init(civilians: 10, impostor: 6, mrWhite: 3)
    case 20: return .init(civilians: 11, impostor: 6, mrWhite: 3)
    
    default: return .init(civilians: 3, impostor: 1, mrWhite: 0)
    }
}
