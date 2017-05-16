# Online learning Example through R, P, S 
# The following is to aid in the understanding of probabilities on a ML learning application 

#### Utility Functions####
#Initial Variables
RockPaperScisscors <- c("Rock","Paper","Scissors")



userEntry <- function()
{ 
  n <- readline(prompt="Enter an option (1- Rock, 2 - Paper, 3 - Scissors: ")
  as.integer(n)
}

printWinner <- function(player1, player2, winningType)
{ 
  if(player1 == winningType) 
  {res <- paste0("Computer (",convertToGame(player1),") Wins Over ",convertToGame(player2))
  }
  else 
  {
    res <- paste0("Human (",convertToGame(player2),") Wins Over ",convertToGame(player1))
  }
  res
}

tallyScore <- function(player1, player2, winningType, score)
{ 
  if(player1 == winningType) 
  {
    score$Score[2] <- score$Score[2] + 1
  }
  if(player2 == winningType) 
  {
    score$Score[1] <- score$Score[1] + 1
  }
  if(winningType == 0)
  {
    score$Score[3] <- score$Score[3] + 1
  }
  
  score
}

convertToGame <- function(type)
{
  as.character(RockPaperScisscors[type])
}

# 1- Rock, 
# 2 - Paper, 
# 3 - Scissors

updateWeights <- function(wts, winner)
{
  weights <- wts
  for(i in 1:3)
  {
    if(as.numeric(winner) == 1 ) 
    {weights[2] <- as.numeric(weights[2]) + 1
    weights[3] <- as.numeric(weights[3]) + 1}
    if(as.numeric(winner) == 2 ) 
      {weights[3] <- as.numeric(weights[3]) + 1
      weights[1] <- as.numeric(weights[1]) + 1}
    if(as.numeric(winner) == 3 ) 
      {weights[1] <- as.numeric(weights[1]) + 1
      weights[2] <- as.numeric(weights[2]) + 1}
  }
  
#  if(sum(weights) == 20) weights[which(a==max(a))] <- which(a==max(a)) - 1 
  weights
}

printScore <- function(human, computer, tied)
{
  rounds <- sum(human+computer+0)
  print(paste("Human: ", human,"(",round((human/rounds)*100,2),"%) / Computer: ",computer,"(",round((computer/rounds)*100,2),"%) / Tied: ",tied))
}




