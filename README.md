# tic-tac-toe
Classic game of tic tac toe implemented in SwiftUI. <br /> 

## Variables
1. let player: ["X", "O"] 
2. @State var turnCount => Keeps a track of the current turn
3. @State var board => empty array to store in which index the current player stores their turn
4. @State var winner
5. @State var isDraw

## Functions & views implemented
1. var body => returns the main view and board implemented through LazyVGrid
2. func checkBoard() => returns the boolean value whether winner is found
3. func resetGame() => sets the board back to empty array and refreshes button view
