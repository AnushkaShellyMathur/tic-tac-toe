import SwiftUI

struct ContentView: View {
    
    let player: [String] = ["X", "O"]
    @State var turnCount: Int = 0
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    @State var board: [String] = Array(repeating: "", count: 9)
    @State var winner: String = ""
    @State var isDraw: Bool = false
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                if !winner.isEmpty {
                    Text("\(winner) wins!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                } else if isDraw {
                    Text("It's a draw!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                }
                
                // create a grid for tic tac toe
                LazyVGrid(columns: columns) {
                    ForEach(0..<9, id: \.self) { number in
                        Button(action: {
                            if board[number].isEmpty && winner.isEmpty && !isDraw {
                                board[number] = player[turnCount % 2]
                                turnCount += 1
                                print(board)
                                
                                // Check the updated board for winner or draw
                                if checkBoard() {
                                    print("\(winner)")
                                } else if turnCount == 9 && winner.isEmpty {
                                    isDraw = true
                                }
                            }
                        }) {
                            Text(board[number].isEmpty ? "" : board[number])
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 100, height: 100)
                                .background(board[number].isEmpty ? Color.gray.opacity(0.3) : (board[number] == "X" ? Color.red : Color.blue))
                                .cornerRadius(15)
                        }
                        .padding()
                    }
                }
                
                Button(action: {
                    resetGame()
                }) {
                    Text("Reset Game")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
            }
            .navigationTitle("Tic Tac Toe")
        }
        .padding()
    }
    
    func checkBoard() -> Bool {
        // Check rows
        for row in 0..<3 {
            let startIndex = row * 3
            if board[startIndex] != "" && board[startIndex] == board[startIndex + 1] && board[startIndex + 1] == board[startIndex + 2] {
                winner = board[startIndex]
                return true
            }
        }
        
        // Check columns
        for col in 0..<3 {
            if board[col] != "" && board[col] == board[col + 3] && board[col + 3] == board[col + 6] {
                winner = board[col]
                return true
            }
        }
        
        // Check diagonals
        if board[0] != "" && board[0] == board[4] && board[4] == board[8] {
            winner = board[0]
            return true
        }
        if board[2] != "" && board[2] == board[4] && board[4] == board[6] {
            winner = board[2]
            return true
        }
        
        return false
    }
    
    func resetGame() {
        board = Array(repeating: "", count: 9)
        turnCount = 0
        winner = ""
        isDraw = false
    }
}

#Preview {
    ContentView()
}
