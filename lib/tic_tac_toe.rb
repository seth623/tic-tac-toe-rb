#Current Player
def current_player(board)
  if turn_count(board).even? == true 
    return "X"
  else
    return "O"
  end 
end

#Display Board
def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#Draw?
def draw?(board)
    if full?(board) && !(won?(board))
      puts "Cat's Game!"
      return true  
    end   
end

#Full?
def full?(board)
    !(board.include?(" " || "" || nil)) 
end

#Input to Index
def input_to_index(user_input)
    user_input.to_i - 1
end

#Move
def move(board, index, current_player)
    board[index] = current_player
end

#Over?
def over?(board)
    if won?(board) != false 
      return true
    elsif full?(board) == true
      return true
    elsif draw?(board) == true 
      return true 
    else
      return false
    end  
end

#Position Taken?
def position_taken?(board, location)
    board[location] != " " && board[location] != ""
end

#Play
def play(board)
  until over?(board)
    turn(board)
  end 
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    draw?(board)
  end
end 

#Turn
def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board, index)
      move(board, index, current_player(board))
      display_board(board)
    else
      turn(board)
    end
end

#Turn Count
def turn_count(board)
  board.count{|token| token == "X" || token == "O"}
end

#Valid Move?
def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index)
end

#Win Combinatons
WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], 
  [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [2,4,6] 
]

#Winner
def winner(board)
    #X
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
  
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
  
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return "X"
      end
    end
  
    #O
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
  
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
  
      if position_1 == "O" && position_2 == "O" && position_3 == "O"
        return "O"
      end
    end
  return nil 
end 

#Won?
def won?(board)
    #X
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
  
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
  
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      end
    end
  
    #O
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
  
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
  
      if position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
  return false
end

  