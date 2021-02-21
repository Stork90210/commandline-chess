Thoughts about Commandline chess

CLASSES

Chessboard

  variables
    @board = Array in array, 8x8. Not really a need to make the size modular. But for exercise purposes maybe nice.
    @height = Height of board, equals number of rows
    @width = Width of board, equals number of cols

  methods
    generate board --> Takes width and heigth and generates array of array
    setup_board --> Generate chesspieces, and puts them on board in starting position
    draw_board --> Outputs board to commandline

Player

  variables
    @name
    @color

  methods
    get_move


Piece

  variables
    @name
    @token
    @hasmoved?
    @position
    @directions --> Possible directions a piece can move
    @valid_moves --> Array of all valid moves



Maybe use inheritance for subpieces? Or too messy?

Game

  variables

  methods
    welcome
    gameloop
    end
    cls
    
    

