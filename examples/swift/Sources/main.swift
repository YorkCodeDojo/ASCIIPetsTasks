import Foundation

func printOwl(offset: Int, eye: String = "@", eyeColor: String = "\u{001B}[0m") {

    print("\u{001B}[2J\u{001B}[H", terminator: "")
    
    let padding = String(repeating: " ", count: offset)
    print("""
    \(padding) ___ 
    \(padding)<\(eyeColor)\(eye)\u{001B}[0m,\(eyeColor)\(eye)\u{001B}[0m>
    \(padding)[`-']
    \(padding)-"-"-
    """)
}

func animateOwl() {
    // Terminal width to determine animation range
    let terminalWidth = 64
    
    // Different eye states for animation
    let eyeStates = ["@", "-", "o", "*"]
    
    // ANSI color codes for terminal
    let colors = [
        "\u{001B}[31m", // Red
        "\u{001B}[32m", // Green
        "\u{001B}[33m", // Yellow
        "\u{001B}[34m", // Blue
        "\u{001B}[35m", // Magenta
        "\u{001B}[36m", // Cyan
        "\u{001B}[91m", // Bright Red
        "\u{001B}[92m", // Bright Green
        "\u{001B}[93m", // Bright Yellow
        "\u{001B}[94m", // Bright Blue
        "\u{001B}[95m", // Bright Magenta
        "\u{001B}[96m"  // Bright Cyan
    ]
    
    for position in 0...terminalWidth {
        // Cycle through eye states based on position
        let eyeIndex = position % eyeStates.count
        let currentEye = eyeStates[eyeIndex]
        
        // Select a random color for the eyes
        let randomColorIndex = Int.random(in: 0..<colors.count)
        let eyeColor = colors[randomColorIndex]
        
        printOwl(offset: position, eye: currentEye, eyeColor: eyeColor)
        // Sleep to control animation speed
        usleep(100000) // 100ms delay
    }
}

animateOwl()