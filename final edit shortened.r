##Nicholas Corpuz & Khagay Nagdimov
## Legal Aid Statistical Tool, Graphical User Interface

#------------------------------------------------------------------------------------------------------------------------------
# If running for the first time uncomment:
#install.packages("RGtk2","gtk+")#
#install.packages("MASS")

library(MASS)
library(RGtk2)

# a one-dimensional collection of values, a.k.a. an array  
header<- c("Suspect Name" , "Locus", "Alleles" , 
           "Suspect Alleles" , "Contributers" , "D/ND" , "Quant" , 
           "REP" , "REP" , "REP")

# a multidimensional array 
headerAndUserInput <- matrix(data = header, 
                             nrow = 2 , 
                             ncol = 10, 
                             byrow = TRUE)
write.matrix(headerAndUserInput, 
             file = "C:/Users/KNagdimov@legal-aid.org/Desktop/DataEntry.csv" , 
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
  
  # save the quant number into the matrix 
  the.matrix <-
  
  write.matrix(headerAndUserInput, file = "C:/Users/KNagdimov@legal-aid.org/Desktop/DataEntry.csv" , sep = ",") 
  
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


# add a label to the vertical box 
suspectLabel = gtkLabelNewWithMnemonic("_Suspect Name")
hbox$packStart(suspectLabel , FALSE , FALSE , 0) # ----------------------------VBOX

# add an entry in the second column; named "suspectName"
suspectName = gtkEntryNew() # create a new entry for USER INPUT!
suspectName$setWidthChars(30)
suspectLabel$setMnemonicWidget(suspectName)
# pack in the filename object into the horizontal box
hbox$packStart(suspectName , FALSE , FALSE , 0) 

#create user input for locus's name 
locusLabel = gtkLabelNewWithMnemonic("_Locus")
hbox$packStart(locusLabel , FALSE , FALSE , 0)
locusName = gtkEntryNew() # handles user input
locusName$setWidthChars(30)
hbox$packStart(locusName , FALSE , FALSE , 0)

# add a label to the vertical box 
quantLabel = gtkLabelNewWithMnemonic("_Quant")
hbox$packStart(quantLabel , FALSE , FALSE , 0) # ----------------------------VBOX

# add an entry in the second column; named "Quant"
quantName = gtkEntryNew() # create a new entry for USER INPUT!
quantName$setWidthChars(30)
quantLabel$setMnemonicWidget(quantName)
# pack in the filename object into the horizontal box
hbox$packStart(quantName , FALSE , FALSE , 0) 

# once user click the "ok" button, a function that will write to the file will be called 
buttonOK <- gtkButtonNewFromStock("gtk-ok")
gSignalConnect(buttonOK , "clicked" , saveUserInput)
vbox$packStart(buttonOK , fill = F)


