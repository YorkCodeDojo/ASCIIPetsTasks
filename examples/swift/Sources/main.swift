import Foundation

// Define enum for terminal colors
enum TerminalColor: String, CaseIterable {
    case red = "\u{001B}[31m"
    case green = "\u{001B}[32m"
    case yellow = "\u{001B}[33m"
    case blue = "\u{001B}[34m"
    case magenta = "\u{001B}[35m"
    case cyan = "\u{001B}[36m"
    case brightRed = "\u{001B}[91m"
    case brightGreen = "\u{001B}[92m"
    case brightYellow = "\u{001B}[93m"
    case brightBlue = "\u{001B}[94m"
    case brightMagenta = "\u{001B}[95m"
    case brightCyan = "\u{001B}[96m"
    
    static func random() -> TerminalColor {
        return Self.allCases.randomElement()!
    }
}

// Eye representation with custom string interpolation
enum EyeState: String, CaseIterable {
    case open = "@"
    case halfClosed = "-"
    case round = "o"
    case surprised = "*"
    
    static func cycleState(at position: Int) -> EyeState {
        let index = position % Self.allCases.count
        return Self.allCases[index]
    }
}

// ANSI Terminal commands using string extensions
extension String {
    static let clearScreen = "\u{001B}[2J\u{001B}[H"
    static let resetColor = "\u{001B}[0m"
}

// Owl representation struct
struct Owl {
    var position: Int
    var eyeState: EyeState
    var eyeColor: TerminalColor
    
    func draw() {
        print(String.clearScreen, terminator: "")
        
        let padding = String(repeating: " ", count: position)
        let colorCode = eyeColor.rawValue
        let eye = eyeState.rawValue
        let resetCode = String.resetColor
        
        print("""
        \(padding) ___ 
        \(padding)<\(colorCode)\(eye)\(resetCode),\(colorCode)\(eye)\(resetCode)>
        \(padding)[`-']
        \(padding)-"-"-
        """)
    }
}

func animateOwl() {
    // Terminal width to determine animation range
    let terminalWidth = 64
    
    // Animation sequence using Swift's range operations
    for position in 0...terminalWidth {
        let owl = Owl(
            position: position, 
            eyeState: EyeState.cycleState(at: position), 
            eyeColor: TerminalColor.random()
        )
        
        owl.draw()
        
        // Sleep to control animation speed - could use DispatchQueue for more modern code
        usleep(100_000) // Swift numeric literal with underscores for readability
    }
}

animateOwl()