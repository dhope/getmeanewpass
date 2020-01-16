
#' Get a new password
#'
#' @param lengthPass The number of words in your password. Default is 6
#' @param type The type of passphrase list to generate. The default is "EFF". You can select from "Harry Potter", "Star Trek", "Game of Thrones", "Star Wars"
#' @param nInt The number of integers to include. You can turn them into a special character on your own.
#' @importFrom stats runif
#' @importFrom utils read.table
#'
#' @return a new password for you
#' @export
#'
#' @examples get_me_a_new_password(5, "Harry Potter")
get_me_a_new_password <- function(lengthPass = 6, type = "EFF", nInt = 2) {

  pass <- rep(-99, length = lengthPass + nInt)

  namefile <- switch(type,
                     "EFF" = "eff_large_wordlist.txt",
                     "Harry Potter" = "harrypotter_8k_3column-txt.txt",
                     "Star Trek" = "memory-alpha_8k_2018.txt",
                     "Game of Thrones" = "passDice.txt",
                     "Star Wars" = "starwars_8k_2018.txt"
                     )

  nskip <-  ifelse(type== "EFF", 0,10)
  sep_ <- ifelse(type== "EFF", "","-")
  set.seed(Sys.time())
  pass[sample(1:(lengthPass + nInt),nInt, replace = F)] <- sample(0:9,nInt, replace = T)

  seeds_ <- sample(1:1E9,(lengthPass + nInt), replace = T)

  t <- utils::read.table(system.file("extdata",package = "getmeanewpass", namefile), skip = 10, stringsAsFactors = F)




  for (i in 1:(lengthPass + nInt)) {
    if(pass[[i]] == (-99)){
      set.seed(seeds_[i])
    if(type == "EFF"){
      r1 <-paste0(
        as.integer(runif(n = 1, 1, 6)), sep_,
        as.integer(runif(n = 1, 1, 6)), sep_,
        as.integer(runif(n = 1, 1, 6)), sep_,
        as.integer(runif(n = 1, 1, 6)), sep_,
        as.integer(runif(n = 1, 1, 6))
      )
    }
    else{
    r1 <-
      paste0(
        as.integer(runif(n = 1, 1, 20)), sep_,
        as.integer(runif(n = 1, 1, 20)), sep_,
        as.integer(runif(n = 1, 1, 20))
      )
    }
    pass[[i]] <- as.character(t[t$V1 == r1, 2])
    }
    else{next}
  }

  # for (j in c(1, lengthPass + 2)) {
  #   # set.seed(as.integer(Sys.time()))
  #   pass[[j]] <- as.integer(runif(n = 1, 1, 10)) - 1
  # }

  print(stringr::str_c(pass, collapse = "-"))
}


