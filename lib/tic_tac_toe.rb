# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  
  [0,4,8],
  [6,4,2],
  
  [0,3,6],
  [1,4,7],
  [2,5,8]
  ]
  
def won?(board)
  WIN_COMBINATIONS.each do |positions|
    if ( (board[positions[0]] == board[positions[1]]) && (board[positions[2]] == board[positions[1]]) )
      if board[positions[0]] == "X" || board[positions[0]] == "O"
        return positions
      end
    end
  end
  return false 
end

def full?(board)
  board.each do |pos|
    if(pos != "X" && pos != "O")
      return false 
    end
  end
  return true 
end

def draw?(board)
  if(won?(board))
    return false
  end
  return full?(board)
end

def over?(board)
  return draw?(board) || won?(board)
end
  
def winner(board)
  if(won?(board))
    return board[won?(board)[0]]
  end
  return nil 
end
  
def current_player(board)
  count = 0 
  board.each do |pos|
    if pos.upcase == "X" || pos.upcase == "O"
      count += 1 
    end 
  end
  count = count % 2 
  if count == 0 
    return "X"
  else
    return "O"
  end 
end

def turn_count board 
  count = 0 
  board.each do |pos|
    if pos.upcase == "X" || pos.upcase == "O"
      count += 1 
    end 
  end
  return count 
end
# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

# Define your play method below
def play(board)
  if(!over?(board))
    current_turn = 0 
  while current_turn < 9 
    turn(board)
      if(over?(board))
        break
      end
    current_turn+=1 
    end
  end
  if !won?(board)
    puts "Cat's Game!"
  else 
    puts "Congratulations #{winner(board)}!"
  end
   
end 
  