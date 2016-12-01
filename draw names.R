names <- c("Jonathan", "Julia", "Lauren", "JD", "Hilary", "Scott", "Hannah")
couple_index <- c(1, 1, 2, 2, 3, 4, 5)

data <- data.frame(names, couple_index)

draw_names <- function(data){
  solution <- TRUE
  while(solution){
    permuted_family <- data[sample(nrow(data)),]
    permuted_family2 <- rbind(permuted_family, permuted_family[1,])
    giving_to_spouse <- vector()
    for(i in 1:nrow(permuted_family)){
      couple_index_dif <- abs(permuted_family[i,]$couple_index - permuted_family[i + 1,]$couple_index)
      giving_to_spouse <- c(giving_to_spouse, couple_index_dif)
    }
    if(min(giving_to_spouse, na.rm = TRUE) == 0){
      solution <- TRUE
    } else {
      break
    }
  }
  return(permuted_family)
}

draw_names(data)
