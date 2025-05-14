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
    
    for position in 0...terminalWidth {
        printOwl(offset: position)
        // Sleep to control animation speed
        usleep(100000) // 100ms delay
    }
}

animateOwl()