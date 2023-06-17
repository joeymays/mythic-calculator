# Mythic Calculator
# Doesnt cover case where time bonus is +- 40%

base.scores <- data.frame(
    level = c(2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 
              12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 
              25, 26, 27), 
    base.score = c(40, 45, 50, 55, 60, 75, 80, 85, 90, 
                   97, 104, 111, 128, 135, 142, 149, 153, 163, 170, 
                   177, 184, 191, 198, 205, 212, 219))


calcScore <- function(level,  time.bonus){
    # time.bonus expressed as percentage e.g. 1.0 for percentage under time, -15.2 for percentage over time
    
    base.score <- base.scores$base.score[match(level, base.scores$level)]
    
    if(time.bonus < 0){
        score.bonus <- (time.bonus * 0.125) - 5.0
    } else {
        score.bonus <- time.bonus * 0.125
    }
    
    final.score <- score.bonus + base.score
    
    return(final.score)
}

mythicRatings <- function(score1, score2){
    
    if(score1 >= score2){
        rating1 <- score1 * 1.5
        rating2 <- score2 * 0.5
    } else {
        rating1 <- score1 * 0.5
        rating2 <- score2 * 1.5
    }
    
    return(c(rating1, rating2))
}

sumMythicRatings <- function(score1, score2){
    round(sum(mythicRatings(score1, score2)),1)
}

