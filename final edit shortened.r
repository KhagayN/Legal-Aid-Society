##Nicholas Corpuz & Khagay Nagdimov
## Legal Aid Statistical Tool, Graphical User Interface

#------------------------------------------------------------------------------------------------------------------------------
# If running for the first time uncomment:
#install.packages("RGtk2","gtk+")#
#install.packages("MASS")

library(MASS)
library(RGtk2)

# function that will take in rep/s and return a vector with the reps but, with unrepeatable elements 
input_alleles <- function(...) {
  l <- list(...)
  str <- ""
  
  for (i in seq_along(l)) {
    str <- paste(str, l[i], sep = ";")
  }
  
  str = paste0(strsplit(str, '')[[1]][-1], collapse = '')
  
  tmp <- suppressWarnings(as.numeric(unlist(strsplit(str, ";"))))
  tmp <- unique(tmp)
  tmp <- sort(tmp)
  
  ret <- paste(c(tmp), collapse = ";")
  print (ret)
  return (ret)
}



# a one-dimensional collection of values, a.k.a. an array  
header<- c("Suspect Name" , "Locus", "Alleles" , 
           "Suspect Alleles" , "Contributers" , "D/ND" , "Quant" , 
           "REP" , "REP" , "REP")

# a multidimensional array 
headerAndUserInput <- matrix(data = header, 
                             nrow = 2 , 
                             ncol = 10, 
                             byrow = TRUE)
# write the header to the file 
currentDirectory <- getwd()
write.matrix(headerAndUserInput, 
             file = currentDirectory , 
             sep = ",")

#-----------------------------------------------------------------------------------------------------------------------------

saveUserInput <- function( ... ){ 
  # save the user's input for the suspect's name  
  the.label <- suspectName$getText()
  # append the suspect's name to the matrix 
  headerAndUserInput[2 , 1] <- the.label
  
  # save the user's input for the locus number 
  the.locus <-locusName$getText()
  # add the locus number to the matrix
  headerAndUserInput[2 , 2] <- the.locus 
  
  # save suspect's alleles 
  the.suspectsAlleles <- suspectsAllelesName$getText() 
  headerAndUserInput[2 , 4 ] <- the.suspectsAlleles
  
  # save the number of contributors 
  the.contributorsName <-contributorsName$getText()
  headerAndUserInput[2 , 5] <- the.contributorsName
  
  # is it deducible or not?
  the.deducName <- deducName$getText()
  headerAndUserInput[2 , 6] <- the.deducName
  
  # save the quant number into the matrix 
  the.quant <- quantName$getText()
  headerAndUserInput[2 , 7] <- the.quant 
  
  # save rep1, rep2, and rep3 
  the.rep1Name <- rep1Name$getText()
  headerAndUserInput[2 , 8] <- the.rep1Name
  the.rep2Name <- rep2Name$getText()
  headerAndUserInput[2 , 9] <- the.rep2Name
  the.rep3Name <- rep3Name$getText()
  headerAndUserInput[2 , 10] <- the.rep3Name
  
  the.repsUnrepeated <- input_alleles(the.rep1Name , the.rep2Name , the.rep3Name)
  headerAndUserInput[2 , 3] <- the.repsUnrepeated
  
  write.matrix(headerAndUserInput, file = currentDirectory , sep = ",") 
}

#-------------------------------------------------------------------------------------------------------------------------
# create a window
window = gtkWindow()

# add a title
# add a frame for aesthetic purposes 
frame = gtkFrameNew("Specify Computational Constants...")
window$add(frame)

# create and add a new vertical container box 
vbox = gtkVBoxNew(FALSE , 8) 
vbox$setBorderWidth(24)                 #------------------------------VBOX
frame$add(vbox)

#visual interface for inputing "suspectName"
# create a horizontal container 
hbox = gtkHBoxNew(FALSE , 8)
# we packstarted the horizontal box into the vertical box 
vbox$packStart(hbox , FALSE , FALSE , 0)# -----------------------------VBOX 
#-------------------------------------------------------------------------------------------------------------------------
# add a label to the vertical box 
suspectLabel = gtkLabelNewWithMnemonic("_Suspect Name")
hbox$packStart(suspectLabel , FALSE , FALSE , 0) # ----------------------------VBOX

# add an entry in the second column; named "suspectName"
suspectName = gtkEntryNew() # create a new entry for USER INPUT!
suspectName$setWidthChars(20)
suspectLabel$setMnemonicWidget(suspectName)
# pack in the filename object into the horizontal box
hbox$packStart(suspectName , FALSE , FALSE , 0) 
#-------------------------------------------------------------------------------------------------------------------------
#create user input for locus's name 
locusLabel = gtkLabelNewWithMnemonic("_Locus")
hbox$packStart(locusLabel , FALSE , FALSE , 0)
locusName = gtkEntryNew() # handles user input
locusName$setWidthChars(10)
hbox$packStart(locusName , FALSE , FALSE , 0)
#-------------------------------------------------------------------------------------------------------------------------
# offer the user the ability to input the suspect's alleles 
hbox = gtkHBoxNew(FALSE , 8)
vbox$packStart(hbox , FALSE , FALSE , 0)

suspectsAllelesLabel = gtkLabelNewWithMnemonic("_Suspect's Alleles (Please separate by semicolon)")
hbox$packStart(suspectsAllelesLabel , FALSE , FALSE , 0 )

suspectsAllelesName = gtkEntryNew() 
gtkEntryNew$setWidthChars(15)
suspectsAllelesName$setMnemonicWidget(suspectsAllelesName)
hbox$packStart(suspectsAllelesName)

#-------------------------------------------------------------------------------------------------------------------------
# add the quant

quantLabel = gtkLabelNewWithMnemonic("_Quantitation")
hbox$packStart(quantLabel , FALSE , FALSE , 0) # ----------------------------VBOX

# add an entry in the second column; named "Quant"
quantName = gtkEntryNew() # create a new entry for USER INPUT!
quantName$setWidthChars(10)
quantLabel$setMnemonicWidget(quantName)
# pack filename object into the horizontal box
hbox$packStart(quantName , FALSE , FALSE , 0) 
#-------------------------------------------------------------------------------------------------------------------------

# contributors 
hbox = gtkHBoxNew(FALSE , 8)
vbox$packStart(hbox , FALSE , FALSE , 0)

contributorsLabel = gtkLabelNewWithMnemonic("_Contributors")
hbox$packStart(contributorsLabel , FALSE , FALSE , 0) 

contributorsName = gtkEntryNew() 
gtkEntryNew$setWidthChars(5)
contributorsLabel$setMnemonicWidget(contributorsName)
hbox$packStart(contributorsName , FALSE , FALSE , 0) 
#-------------------------------------------------------------------------------------------------------------------------

# deducible or non-deducible 
deducLabel = gtkLabelNewWithMnemonic("_Deducible or Nondeducible")
hbox$packStart(deducLabel , FALSE , FALSE , 0)

deducName = gtkEntryNew()
deducName$setWidthChars(5)
deducLabel$setMnemonicWidget(deducName)
hbox$packStart(deducName , FALSE , FALSE , 0 )
#-------------------------------------------------------------------------------------------------------------------------

# REP 1 

# start on a new row 
hbox = gtkHBoxNew(FALSE , 8) 
vbox$packStart(hbox , FALSE , FALSE , 0) 
# create label
rep1Label = gtkLabelNewWithMnemonic("_Rep1 (Please separate by semicolons)")
hbox$packStart(rep1Label , FALSE , FALSE , 0)
# create an area for user input 
rep1Name = gtkEntryNew()
rep1Name$setWidthChars(65)
rep1Label$setMnemonicWidget(rep1Name)
#connect label to widet 
rep1Label$setMnemonicWidget(rep1Name)
hbox$packStart(rep1Name , FALSE , FALSE , 0)
#-------------------------------------------------------------------------------------------------------------------------

# REP 2 

# start on a new row
hbox = gtkHBoxNew(FALSE , 8)
vbox$packStart(hbox , FALSE , FALSE , 0)
# create a new label 
rep2Label = gtkLabelNewWithMnemonic("_Rep2 (Please separate by semicolons)")
hbox$packStart(rep2Label , FALSE , FALSE , 0)
# create box for user input
rep2Name = gtkEntryNew()
rep2Name$setWidthChars(65)
rep2Label$setMnemonicWidget(rep2Name)
hbox$packStart(rep2Name , FALSE , FALSE , 0)
# connect label with widget 
#-------------------------------------------------------------------------------------------------------------------------

# REP 3

# start on a new row
hbox = gtkHBox(FALSE , 8)
vbox$packStart(hbox , FALSE , FALSE , 0)
# create label for rep3 
rep3Label = gtkLabelNewWithMnemonic("_Rep3 (Please separate by semicolons)")
hbox$packStart(rep3Label , FALSE , FALSE , 0)
# create widget for user input
rep3Name = gtkEntryNew()
rep3Name$setWidthChars(65)
rep3Label$setMnemonicWidget(rep3Name)
hbox$packStart(rep3Name , FALSE , FALSE , 0)

#-------------------------------------------------------------------------------------------------------------------------
# once user click the "ok" button, a function that will write to the file will be called 
buttonOK <- gtkButtonNewFromStock("gtk-ok")
gSignalConnect(buttonOK , "clicked" , saveUserInput)
vbox$packStart(buttonOK , fill = F)
#-------------------------------------------------------------------------------------------------------------------------




