import Foundation

func printOwl(offset: Int, eye: String = "@") {

    print("\u{001B}[2J\u{001B}[H", terminator: "")
    
    let padding = String(repeating: " ", count: offset)
    print("""
    \(padding) ___ 
    \(padding)<\(eye),\(eye)>
    \(padding)[`-']
    \(padding)-"-"-
    """)
}

func animateOwl() {
    // Terminal width to determine animation range
    let terminalWidth = 64
    
    // Different eye states for animation
    let eyeStates = ["@", "-", "o", "*"]
    
    for position in 0...terminalWidth {
        // Cycle through eye states based on position
        let eyeIndex = position % eyeStates.count
        let currentEye = eyeStates[eyeIndex]
        
        printOwl(offset: position, eye: currentEye)
        // Sleep to control animation speed
        usleep(100000) // 100ms delay
    }
}

animateOwl()