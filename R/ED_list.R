function(parm, respl, reference, type, ...)
{
  parmVec[notFixed] <- parm
  #        if (type == "absolute")
  #        {
  #            p <- 100*((parmVec[3] - respl)/(parmVec[3] - parmVec[2]))
  #        } else {
  #            p <- respl
  #        }
  #        if ( (parmVec[1] < 0) && (reference == "control") )
  #        {
  #            p <- 100 - p
  #        }
  p <- EDhelper(parmVec, respl, reference, type)

  tempVal1 <- 100/(100-p)
  tempVal2 <- log(tempVal1^(1/parmVec[5]) - 1)
  lEDp <- parmVec[4] + tempVal2 / parmVec[1]
  if (type=="relative"){

    lEDder <-
      c(-tempVal2/(parmVec[1]^2),
        0, 0, 1,
        tempVal1^(1/parmVec[5]-1)/(parmVec[1]*parmVec[5]*(tempVal1^(1/parmVec[5]-1))))
  }else{

    ## ask Yan for her derivative derivation--change 0,0 part
    lEDder <-
      c(-tempVal2/(parmVec[1]^2),
        0, 0, 1,
        tempVal1^(1/parmVec[5]-1)/(parmVec[1]*parmVec[5]*(tempVal1^(1/parmVec[5]-1))))
  }


  return(list(lEDp, lEDder[notFixed]))
}
