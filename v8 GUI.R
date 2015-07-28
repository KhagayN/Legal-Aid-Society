##Nicholas Corpuz & Kevin Ramdass & Khagay Nagdimov
## Legal Aid Statistical Tool, Graphical User Interface

# If running for the first time uncomment:
#install.packages("RGtk2","gtk+")

## first, create blank matrix to be filled by variable values
library("RGtk2")

# format Excel sheet that will store the output of this program
x <-1:10
y<-11:20

# designate matrix size 
blank<-matrix(x,1,10)
blank2<-matrix(y,1,10)

#-------------------------------------------------------------------------------------------------------
# create a window
window = gtkWindow()

# add a title
window["title"] = "Legal Aid Statistical Tool (Beta)"
# add a frame for aesthetic purposes 
frame = gtkFrameNew("Legal Aid Statistical Tool")
window$add(frame)

# create and add a new vertical container box 
vbox = gtkVBoxNew(FALSE , 8) 
vbox$setBorderWidth(24)                 #------------------------------VBOX
frame$add(vbox)

# create buton 
buttonOK <- gtkButtonNewFromStock("gtk-ok")
gSignalConnect(buttonOK , "clicked" , saveUserInput)
vbox$packStart(buttonOK , fill = T)

#visual interface for inputing the name of the suspect "suspectName"
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
#-----------------------------------------------------------------------------------------------------

# visual interface for inputing Quantity of DNA "quantName"

# add a label to the vertical box 
quantLabel = gtkLabelNewWithMnemonic("_Quantity")
hbox$packStart(quantLabel , FALSE , FALSE , 0) # ----------------------------VBOX

# add an entry in the second column; named "Quant"
quantName = gtkEntryNew() # create a new entry for USER INPUT!
quantName$setWidthChars(4)
quantLabel$setMnemonicWidget(quantName)
# pack in the filename object into the horizontal box
hbox$packStart(quantName , FALSE , FALSE , 0) 

#-----------------------------------------------------------------------------------------------------

#visual interface for inputing number of number of contributors to the sample "contributorsName"

# create a horizontal container 
hbox = gtkHBoxNew(FALSE , 8)
# we packstarted the horizontal box into the vertical box 
vbox$packStart(hbox , FALSE , FALSE , 0)# -----------------------------VBOX 

# add a label to the vertical box 
contLabel = gtkLabelNewWithMnemonic("_Contributors")
hbox$packStart(contLabel , FALSE , FALSE , 0)

# add an entry in the second column; named "Cont"
contributorsName = gtkEntryNew() # create a new entry for USER INPUT!
contributorsName$setWidthChars(4)
contLabel$setMnemonicWidget(contributorsName)
# pack in the filename object into the horizontal box
hbox$packStart(contributorsName , FALSE , FALSE , 0) 


#-----------------------------------------------------------------------------------------------------
# visual interface for inputting deducible or non-deducible mixture "deducName"

deducLabel = gtkLabelNewWithMnemonic("_Deducible or _Non-_Deducible")
hbox$packStart(deducLabel , FALSE , FALSE , 0)

deducName = gtkEntryNew()
deducName$setWidthChars(3)
deducLabel$setMnemonicWidget(deducName)
hbox$packStart(deducName , FALSE , FALSE , 0 )

#-----------------------------------------------------------------------------------------------------

# add a horizontal container to display option to input suspect alleles 
hbox = gtkHBoxNew(FALSE , 8) # create a new horizontal box 
vbox$packStart(hbox , FALSE , FALSE , 0) 
label = gtkLabelNewWithMnemonic("Input the Suspect's Alleles") # create a new label 
hbox$packStart(label , expand = FALSE, FALSE , 0) # add that label to the horizontal box

#add a separator
vbox$packStart(gtkHSeparatorNew() , FALSE , FALSE , 0)

#--------------------------------------------------------------------------------------------------------

#sus_D8S1179
hbox =gtkHBoxNew(FALSE, 8)
vbox$packStart(hbox , FALSE , FALSE , 0) 

sus_D8S1179_label = gtkLabelNewWithMnemonic("D8S1179") 
hbox$packStart(sus_D8S1179_label , FALSE, FALSE , 0)

sus_D8S1179 = gtkEntryNew()
sus_D8S1179$setWidthChars(7)
sus_D8S1179_label$setMnemonicWidget(sus_D8S1179)
hbox$packStart(sus_D8S1179 , FALSE , FALSE , 0)

#--------------------------------------------------------------------------------------------------------

#sus_D21S11

sus_D21S11_label = gtkLabelNewWithMnemonic("D21S11") # create a new label 
hbox$packStart(sus_D21S11_label , FALSE, FALSE , 0)

sus_D21S11 = gtkEntryNew()
sus_D21S11$setWidthChars(7)
sus_D21S11_label$setMnemonicWidget(sus_D21S11)

hbox$packStart(sus_D21S11 , FALSE , FALSE , 0)

#--------------------------------------------------------------------------------------------------------


#sus_D7S820
sus_D7S820_label = gtkLabelNewWithMnemonic("D7S820") # create a new label 
hbox$packStart(sus_D7S820_label , FALSE, FALSE , 0)

sus_D7S820 = gtkEntryNew()
sus_D7S820$setWidthChars(7)
sus_D7S820_label$setMnemonicWidget(sus_D7S820)

hbox$packStart(sus_D7S820 , FALSE , FALSE , 0)

#--------------------------------------------------------------------------------------------------------


#sus_CSF1P0
sus_CSF1P0_label = gtkLabelNewWithMnemonic("CSF1P0") # create a new label 
hbox$packStart(sus_CSF1P0_label , FALSE, FALSE , 0)

sus_CSF1P0 = gtkEntryNew()
sus_CSF1P0$setWidthChars(7)
sus_CSF1P0_label$setMnemonicWidget(sus_CSF1P0)

hbox$packStart(sus_CSF1P0 , FALSE , FALSE , 0)


#--------------------------------------------------------------------------------------------------------

#sus_D3S1358
sus_D3S1358_label = gtkLabelNewWithMnemonic("D3S1358") # create a new label 
hbox$packStart(sus_D3S1358_label , FALSE, FALSE , 0)

sus_D3S1358 = gtkEntryNew()
sus_D3S1358$setWidthChars(7)
sus_D3S1358_label$setMnemonicWidget(sus_D3S1358)

hbox$packStart(sus_D3S1358 , FALSE , FALSE , 0)


#--------------------------------------------------------------------------------------------------------

#sus_TH01
sus_TH01_label = gtkLabelNewWithMnemonic("TH01") # create a new label 
hbox$packStart(sus_TH01_label , FALSE, FALSE , 0)

sus_TH01 = gtkEntryNew()
sus_TH01$setWidthChars(7)
sus_TH01_label$setMnemonicWidget(sus_TH01)

hbox$packStart(sus_TH01 , FALSE , FALSE , 0)

#-------------------------------------------------------------------------------------------------------

#sus_D13S317
sus_D13S317_label = gtkLabelNewWithMnemonic("D13S317") # create a new label 
hbox$packStart(sus_D13S317_label , FALSE, FALSE , 0)

sus_D13S317 = gtkEntryNew()
sus_D13S317$setWidthChars(7)
sus_D13S317_label$setMnemonicWidget(sus_D13S317)

hbox$packStart(sus_D13S317 , FALSE , FALSE , 0)

#-------------------------------------------------------------------------------------------------------

#sus_D16S539
sus_D16S539_label = gtkLabelNewWithMnemonic("D16S539") # create a new label 
hbox$packStart(sus_D16S539_label , FALSE, FALSE , 0)

sus_D16S539 = gtkEntryNew()
sus_D16S539$setWidthChars(7)
sus_D16S539_label$setMnemonicWidget(sus_D16S539)

hbox$packStart(sus_D16S539 , FALSE , FALSE , 0)

#-------------------------------------------------------------------------------------------------------

#sus_D2S1138
sus_D2S1138_label = gtkLabelNewWithMnemonic("D2S1138") # create a new label 
hbox$packStart(sus_D2S1138_label , FALSE, FALSE , 0)

sus_D2S1138 = gtkEntryNew()
sus_D2S1138$setWidthChars(7)
sus_D2S1138_label$setMnemonicWidget(sus_D2S1138)

hbox$packStart(sus_D2S1138 , FALSE , FALSE , 0)

#-------------------------------------------------------------------------------------------------------

#sus_D19S433
sus_D19S433_label = gtkLabelNewWithMnemonic("D19S433") # create a new label 
hbox$packStart(sus_D19S433_label , FALSE, FALSE , 0)

sus_D19S433 = gtkEntryNew()
sus_D19S433$setWidthChars(7)
sus_D19S433_label$setMnemonicWidget(sus_D19S433)

hbox$packStart(sus_D19S433 , FALSE , FALSE , 0)

#-------------------------------------------------------------------------------------------------------

#sus_vWA
sus_vWA_label = gtkLabelNewWithMnemonic("vWA") # create a new label 
hbox$packStart(sus_vWA_label , FALSE, FALSE , 0)

sus_vWA = gtkEntryNew()
sus_vWA$setWidthChars(7)
sus_vWA_label$setMnemonicWidget(sus_vWA)

hbox$packStart(sus_vWA , FALSE , FALSE , 0)

#-------------------------------------------------------------------------------------------------------

#sus_TPOX
sus_TPOX_label = gtkLabelNewWithMnemonic("TPOX") # create a new label 
hbox$packStart(sus_TPOX_label , FALSE, FALSE , 0)

sus_TPOX = gtkEntryNew()
sus_TPOX$setWidthChars(7)
sus_TPOX_label$setMnemonicWidget(sus_TPOX)

hbox$packStart(sus_TPOX , FALSE , FALSE , 0)

#-------------------------------------------------------------------------------------------------------

#sus_D18S51
sus_D18S51_label = gtkLabelNewWithMnemonic("D18S51") # create a new label 
hbox$packStart(sus_D18S51_label , FALSE, FALSE , 0)

sus_D18S51 = gtkEntryNew()
sus_D18S51$setWidthChars(7)
sus_D18S51_label$setMnemonicWidget(sus_D18S51)

hbox$packStart(sus_D18S51 , FALSE , FALSE , 0)

#-------------------------------------------------------------------------------------------------------


#sus_D5S818
sus_D5S818_label = gtkLabelNewWithMnemonic("D5S818") # create a new label 
hbox$packStart(sus_D5S818_label , FALSE, FALSE , 0)

sus_D5S818 = gtkEntryNew()
sus_D5S818$setWidthChars(7)
sus_D5S818_label$setMnemonicWidget(sus_D5S818)

hbox$packStart(sus_D5S818 , FALSE , FALSE , 0)

#-------------------------------------------------------------------------------------------------------

#sus_FGA
sus_FGA_label = gtkLabelNewWithMnemonic("FGA") # create a new label 
hbox$packStart(sus_FGA_label , FALSE, FALSE , 0)

sus_FGA = gtkEntryNew()
sus_FGA$setWidthChars(7)
sus_FGA_label$setMnemonicWidget(sus_FGA)

hbox$packStart(sus_FGA , FALSE , FALSE , 0)


#----------------------------------------------------------------------------------------

# add a horizontal container to display option to input suspect alleles 
hbox = gtkHBoxNew(FALSE , 8) # create a new horizontal box 
vbox$packStart(hbox, FALSE, FALSE, 0)

label = gtkLabelNewWithMnemonic("Input observed allele's seperated by a semicolon. If no allele's observed input: N/ NEG. If no rep input: INC") # create a new label 
hbox$packStart(label , expand = FALSE, FALSE , 0) # add that label to the horizontal box

#add a separator
vbox$packStart(gtkHSeparatorNew() , FALSE , FALSE , 0)


#--------------------------------------------------------------------------------------------------------

#rep1_D8S1179

hbox =gtkHBoxNew(FALSE, 8)
vbox$packStart(hbox , FALSE , FALSE , 0) 

rep1_D8S1179_label = gtkLabelNewWithMnemonic("_REP1") 
hbox$packStart(rep1_D8S1179_label , FALSE, FALSE , 0)

hbox = gtkHBoxNew(FALSE , 8)
vbox$packStart(hbox, FALSE , FALSE , 0)

rep1_D8S1179 = gtkEntryNew()
rep1_D8S1179$setWidthChars(15)
rep1_D8S1179$setMnemonicWidget(rep1_D8S1179)
hbox$packStart(rep1_D8S1179 , FALSE , FALSE , 0)


#--------------------------------------------------------------------------------------------------------

#rep1_D21S11
rep1_D21S11 = gtkEntryNew()
rep1_D21S11$setWidthChars(15)
hbox$packStart(rep1_D21S11 , FALSE , FALSE , 0) 

#--------------------------------------------------------------------------------------------------------

#rep1_D7S820
rep1_D7S820 = gtkEntryNew()
rep1_D7S820$setWidthChars(15)
hbox$packStart(rep1_D7S820 , FALSE , FALSE , 0) 

#--------------------------------------------------------------------------------------------------------

#rep1_CSF1PO
rep1_CSF1PO = gtkEntryNew()
rep1_CSF1PO$setWidthChars(15)
hbox$packStart(rep1_CSF1PO , FALSE , FALSE , 0) 

#--------------------------------------------------------------------------------------------------------


#rep1_D3S1358
rep1_D3S1358 = gtkEntryNew()
rep1_D3S1358$setWidthChars(15)
hbox$packStart(rep1_D3S1358 , FALSE , FALSE , 0) 

#--------------------------------------------------------------------------------------------------------


#rep1_TH01
rep1_TH01 = gtkEntryNew()
rep1_TH01$setWidthChars(15)
hbox$packStart(rep1_TH01 , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------


#rep1_D13S317
rep1_D13S317 = gtkEntryNew()
rep1_D13S317$setWidthChars(15)
hbox$packStart(rep1_D13S317 , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------



#rep1_D16S539
rep1_D16S539 = gtkEntryNew()
rep1_D16S539$setWidthChars(15)
hbox$packStart(rep1_D16S539 , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------


#rep1_D2S1338
rep1_D2S1338 = gtkEntryNew()
rep1_D2S1338$setWidthChars(15)
hbox$packStart(rep1_D2S1338 , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------


#rep1_D19S433
rep1_D19S433 = gtkEntryNew()
rep1_D19S433$setWidthChars(15)
hbox$packStart(rep1_D19S433 , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------


#rep1_vWA
rep1_vWA = gtkEntryNew()
rep1_vWA$setWidthChars(15)
hbox$packStart(rep1_vWA , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------


#rep1_TPOX
rep1_TPOX = gtkEntryNew()
rep1_TPOX$setWidthChars(15)
hbox$packStart(rep1_TPOX , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------


#rep1_D18S51
rep1_D18S51 = gtkEntryNew()
rep1_D18S51$setWidthChars(15)
hbox$packStart(rep1_D18S51 , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------

#rep1_D5S818
rep1_D5S818 = gtkEntryNew()
rep1_D5S818$setWidthChars(15)
hbox$packStart(rep1_D5S818 , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------

#rep1_FGA
rep1_FGA = gtkEntryNew()
rep1_FGA$setWidthChars(15)
hbox$packStart(rep1_FGA , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------

#rep2_D8S1179

hbox =gtkHBoxNew(FALSE, 8)
vbox$packStart(hbox , FALSE , FALSE , 0) 

rep2_D8S1179_label = gtkLabelNewWithMnemonic("REP2") 
hbox$packStart(rep2_D8S1179_label , FALSE, FALSE , 0)

hbox = gtkHBoxNew(FALSE , 8)
vbox$packStart(hbox, FALSE , FALSE , 0)

rep2_D8S1179 = gtkEntryNew()
rep2_D8S1179$setWidthChars(15)
rep2_D8S1179$setMnemonicWidget(rep2_D8S1179)
hbox$packStart(rep2_D8S1179 , FALSE , FALSE , 0)

#--------------------------------------------------------------------------------------------------------

#rep2_D21S11
rep2_D21S11 = gtkEntryNew()
rep2_D21S11$setWidthChars(15)
hbox$packStart(rep2_D21S11 , FALSE , FALSE , 0) 

#--------------------------------------------------------------------------------------------------------

#rep2_D7S820
rep2_D7S820 = gtkEntryNew()
rep2_D7S820$setWidthChars(15)
hbox$packStart(rep2_D7S820 , FALSE , FALSE , 0) 

#--------------------------------------------------------------------------------------------------------

#rep2_CSF1PO
rep2_CSF1PO = gtkEntryNew()
rep2_CSF1PO$setWidthChars(15)
hbox$packStart(rep2_CSF1PO , FALSE , FALSE , 0) 

#--------------------------------------------------------------------------------------------------------


#rep2_D3S1358
rep2_D3S1358 = gtkEntryNew()
rep2_D3S1358$setWidthChars(15)
hbox$packStart(rep2_D3S1358 , FALSE , FALSE , 0) 

#--------------------------------------------------------------------------------------------------------


#rep2_TH01
rep2_TH01 = gtkEntryNew()
rep2_TH01$setWidthChars(15)
hbox$packStart(rep2_TH01 , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------


#rep2_D13S317
rep2_D13S317 = gtkEntryNew()
rep2_D13S317$setWidthChars(15)
hbox$packStart(rep2_D13S317 , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------



#rep2_D16S539
rep2_D16S539 = gtkEntryNew()
rep2_D16S539$setWidthChars(15)
hbox$packStart(rep2_D16S539 , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------


#rep2_D2S1338
rep2_D2S1338 = gtkEntryNew()
rep2_D2S1338$setWidthChars(15)
hbox$packStart(rep2_D2S1338 , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------


#rep2_D19S433
rep2_D19S433 = gtkEntryNew()
rep2_D19S433$setWidthChars(15)
hbox$packStart(rep2_D19S433 , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------


#rep2_vWA
rep2_vWA = gtkEntryNew()
rep2_vWA$setWidthChars(15)
hbox$packStart(rep2_vWA , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------


#rep2_TPOX
rep2_TPOX = gtkEntryNew()
rep2_TPOX$setWidthChars(15)
hbox$packStart(rep2_TPOX , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------


#rep2_D18S51
rep2_D18S51 = gtkEntryNew()
rep2_D18S51$setWidthChars(15)
hbox$packStart(rep2_D18S51 , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------

#rep2_D5S818
rep2_D5S818 = gtkEntryNew()
rep2_D5S818$setWidthChars(15)
hbox$packStart(rep2_D5S818 , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------

#rep2_FGA
rep2_FGA = gtkEntryNew()
rep2_FGA$setWidthChars(15)
hbox$packStart(rep2_FGA , FALSE , FALSE , 0) 


#--------------------------------------------------------------------------------------------------------

#rep3_D8S1179

hbox =gtkHBoxNew(FALSE, 8)
vbox$packStart(hbox , FALSE , FALSE , 0) 

rep3_D8S1179_label = gtkLabelNewWithMnemonic("REP3") 
hbox$packStart(rep3_D8S1179_label , FALSE, FALSE , 0)

hbox = gtkHBoxNew(FALSE , 8)
vbox$packStart(hbox, FALSE , FALSE , 0)

rep3_D8S1179 = gtkEntryNew()
rep3_D8S1179$setWidthChars(15)
rep3_D8S1179$setMnemonicWidget(rep3_D8S1179)
hbox$packStart(rep3_D8S1179 , FALSE , FALSE , 0)

#--------------------------------------------------------------------------------------------------------

#rep3_D21S11
rep3_D21S11 = gtkEntryNew()
rep3_D21S11$setWidthChars(15)
hbox$packStart(rep3_D21S11 , FALSE , FALSE , 0) 

#--------------------------------------------------------------------------------------------------------

#rep3_D7S820
rep3_D7S820 = gtkEntryNew()
rep3_D7S820$setWidthChars(15)
hbox$packStart(rep3_D7S820 , FALSE , FALSE , 0) 

#--------------------------------------------------------------------------------------------------------

#rep3_CSF1PO
rep3_CSF1PO = gtkEntryNew()
rep3_CSF1PO$setWidthChars(15)
hbox$packStart(rep3_CSF1PO , FALSE , FALSE , 0) 

#--------------------------------------------------------------------------------------------------------


#rep3_D3S1358
rep3_D3S1358 = gtkEntryNew()
rep3_D3S1358$setWidthChars(15)
hbox$packStart(rep3_D3S1358 , FALSE , FALSE , 0) 

#--------------------------------------------------------------------------------------------------------


#rep3_TH01
rep3_TH01 = gtkEntryNew()
rep3_TH01$setWidthChars(15)
hbox$packStart(rep3_TH01 , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------


#rep3_D13S317
rep3_D13S317 = gtkEntryNew()
rep3_D13S317$setWidthChars(15)
hbox$packStart(rep3_D13S317 , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------



#rep3_D16S539
rep3_D16S539 = gtkEntryNew()
rep3_D16S539$setWidthChars(15)
hbox$packStart(rep3_D16S539 , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------


#rep3_D2S1338
rep3_D2S1338 = gtkEntryNew()
rep3_D2S1338$setWidthChars(15)
hbox$packStart(rep3_D2S1338 , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------


#rep3_D19S433
rep3_D19S433 = gtkEntryNew()
rep3_D19S433$setWidthChars(15)
hbox$packStart(rep3_D19S433 , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------


#rep3_vWA
rep3_vWA = gtkEntryNew()
rep3_vWA$setWidthChars(15)
hbox$packStart(rep3_vWA , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------


#rep3_TPOX
rep3_TPOX = gtkEntryNew()
rep3_TPOX$setWidthChars(15)
hbox$packStart(rep3_TPOX , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------


#rep3_D18S51
rep3_D18S51 = gtkEntryNew()
rep3_D18S51$setWidthChars(15)
hbox$packStart(rep3_D18S51 , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------

#rep3_D5S818
rep3_D5S818 = gtkEntryNew()
rep3_D5S818$setWidthChars(15)
hbox$packStart(rep3_D5S818 , FALSE , FALSE , 0) 

#---------------------------------------------------------------------------------

#rep3_FGA
rep3_FGA = gtkEntryNew()
rep3_FGA$setWidthChars(15)
hbox$packStart(rep3_FGA , FALSE , FALSE , 0) 

#-------------------------------------------------------------------------------------------------------

#sample to replace individual values in each matrix
blank[1] <-"Suspect Name"
blank[2] <- "Locus"
blank[3] <- "Alleles"
blank[4] <- "Suspect Alleles"
blank[5] <- "Contributors"
blank[6] <- "D/ND"
blank[7] <- "Quant"
blank[8:10] <- "REP"

#Prefill blank2; 8:10 with -1 for logical calculations
blank2[8:10] <--1

#rep_erase <- function(...) {
  #if(blank2[9] == -1) {
   # blank[9:10] <- ""
    #blank2[9:10] <- ""
  #}
  #if (blank2[10] == -1) {
    #blank[10] <- ""
    #blank2[10] <- ""
  #}
#}

#rep_erase(blank2)
#-------------------------------------------------------------------------------------------------------



#Function to determine the reps unrepeated "the.repsUnrepeated"
# "function that will take in rep/s and return a vector with the reps but, with unrepeatable elements" 


#input_alleles <- function(...) {
#  l <- list(...)
# str <- ""  
#for (i in seq_along(l)) {
# str <- paste(str, l[i], sep = ";")
#}

#str = paste0(strsplit(str, '')[[1]][-1], collapse = '')

#tmp <- suppressWarnings(as.numeric(unlist(strsplit(str, ";"))))
#tmp <- unique(tmp)
#tmp <- sort(tmp)

#ret <- paste(c(tmp), collapse = ";")
#if (ret == "") {
# ret <- "-1"
#}
#return (ret)

#the.repsUnrepeated <- input_alleles(the.rep1Name , the.rep2Name , the.rep3Name)

#-------------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------------------------

saveUserInput <- function( ... ){
  # save the user's input 
  
  
  blank2[1] <- suspectName$getText()
  blank2[2] <- "D8S1179"
  blank2[4] <- sus_D8S1179$getText() 
  blank[5] <- contributorsName$getText() 
  
  
  # Combine the two blank matrices together
  blank3<-c(blank,blank2)
  
  #write the final matrix to the specified place as the correct size and format
  write(blank3, file ="C:/Users/KNagdimov@legal-aid.org/Desktop/DataEntry.csv", ncolumns = 10, append =T, sep =",")
  
}


#-------------------------------------------------------------------------------------------------------



## Debug to quit gracefully
#little Idea how this works


if(FALSE) {
  
  
  buttonOK = gtkButtonNewFromStock("gtk-ok")
  gSignalConnect(buttonOK , "clicked" , performStatistics)
  the.buttons$packStart(buttonOK , fill = F)
  buttonCancel = gtkButtonNewFromStock("gtk-close")
  gSignalConnect(buttonCancel , "clicked" , window$destroy)
  the.buttons$packStart(buttonCancel , fill = F)
  
  dialog = gtkDialogNewWithButtons("Might be helpful 
                                   for lazy students" , window , 
                                   "modal" , "gtk-ok" , GtkResponse["ok"]
                                   , "gtk-quit" , 
                                   GtkResponseType["cancel"])
  
  response = dialog$run()
  # Return to previous window
  if (response == GtkReponseType["ok"]) {
    dialog$destroy()
  }
  
  # Quit all windows 
  if (response == GtkResponseType["cancel"]) {
    dialog$destroy()
    window$destroy()
  }
}











