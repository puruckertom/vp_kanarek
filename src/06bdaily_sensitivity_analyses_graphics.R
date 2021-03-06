########### control daily sensitivity plot
# Multiple plot function
#
# ggplot2 objects can be passed in ..., or to plotlist (as a list of ggplot2 objects)
# - cols:   Number of columns in layout
# - layout: A matrix specifying the layout. If present, 'cols' is ignored.
#
# If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
# then plot 1 will go in the upper left, 2 will go in the upper right, and
# 3 will go all the way across the bottom.
#
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  library(ggplot2)
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}


ndays <- length(timearray)

#load control pcc results
load(paste(vpdir_out_control,"tdarray_pccout_control.RData", sep = ""))
dim(tdarray_pccout_control)

colnames(tdarray_pccout_control) <- colnames(inputdata_control2)


date <- 1:ndays
date2 <- seq(as.Date("1989/5/12"), as.Date("1990/4/15"), "days")
date3 <- date2[1:ndays]

#qs = melted_control$value[which(melted_control$variable=="queenstrength")]
#plot control daily sensitivities
pcc_control <- as.data.frame(cbind(date, tdarray_pccout_control[1:ndays,1:dim(tdarray_pccout_control)[2]]))

#tdarray_pccout_control[1:ndays,2:dim(tdarray_pccout_control)[2]]))

cont<- pcc_control%>%
  select(date,queenstrength,wkrdrnratio,drnmitesurvive,wkrmitesurvive,fgrlifespan)#,ForagerMaxProp,totalimmmites)#,
         # pctresistimmmites,RQQueenStrength,drnadultinfest,drnbroodinfest,
         # drnmiteoffspring,wkradultinfest,wkrbroodinfest,wkrmiteoffspring)
# pcc_control <- as.data.frame(cbind(date, tdarray_pccout_control[1:ndays,2:dim(tdarray_pccout_control)[2]]))
# cont<- pcc_control%>%
#   select(date,wkrdrnratio,drnmitesurvive,wkrmitesurvive,fgrlifespan,ForagerMaxProp,totalimmmites,
#          pctresistimmmites,
#          #InitColNectar,InitColPollen,
#          RQQueenStrength,drnadultinfest,drnbroodinfest,
#          drnmiteoffspring,wkradultinfest,wkrbroodinfest,wkrmiteoffspring)
#          #cl4pollen,cl4nectar,cl5pollen,
#          #cl5nectar,cldpollen,cldnectar,ca13pollen,ca13nectar,ca410pollen,ca410nectar,ca1120pollen,
#          #ca1120nectar,ptrips,ntrips,pload,nload)
melted_control = melt(cont, id.vars="date")
coef_filtered<- melted_control%>%
  filter(abs(melted_control$value)>0.001)
library(colorspace)
daily_sensitivity_control <-  ggplot(coef_filtered, aes(x=date, y=value, group=variable)) +
    geom_line(aes(colour=coef_filtered$variable)) +
    scale_colour_manual(values = c(
        "steelblue", "steelblue",   "steelblue",    "magenta",    "limegreen","firebrick3",   "indianred1",
      # wkrdrnratio  drnmitesurvive  wkrmitesurvive fgrlifespan fgrmaxprop  TotalImmMites pctresistimmmites
      
      #   "deeppink",    "gold3",     
      #InitColNectar InitColPollen 
      
      "green",         "tomato"   ,   "tomato"    , "tomato"      , "tomato3"   ,  "tomato3"   ,   "tomato3"  )) +
      #RQQueenStrength drnadultinfest,drnbroodinfest,drnmiteoffspring,wkradultinfest,wkrbroodinfest,wkrmiteoffspring,
      
    # "steelblue","steelblue","goldenrod","deeppink4", "goldenrod3","steelblue","steelblue", "steelblue",
      #cl4pollen   cl4nectar  cl5pollen   cl5nectar   cldpollen     cldnectar   ca13pollen    ca13nectar   
      
    #   "gold4",
      #ca410pollen
      
   #   "steelblue",     "steelblue", "steelblue",       "gold",     "steelblue",       "gold3",     "deeppink")) + 
      #ca410nectar    ca1120pollen    ca1120nectar    ptrips          ntrips           pload           nload  


    guides(fill=FALSE) +  
    xlab("Simulation Day") + 
    ylab("Partial Correlation Coefficient") +
    #ggtitle("Daily Sensitivity (PCC) for Control Scenario") +
    annotate("text", x = 1000, y = 0.92, label = "Control", size=6) +
    theme_bw() +

    theme(legend.position = "none",  axis.title.x=element_blank(), axis.text.x=element_blank())

pdf(file= paste(vpdir_fig, "daily_sensitivity_control.pdf", sep=""), width = 8, height = 6)
  daily_sensitivity_control
dev.off()
#__________________________________________________________________________________________
## level1 daily sensitivity plot
#load level1 pcc results
load(paste(vpdir_out_level1,"tdarray_pccout_level1.RData", sep = ""))
dim(tdarray_pccout_level1)

colnames(tdarray_pccout_level1) <- colnames(inputdata_control2)


date <- 1:ndays
date2 <- seq(as.Date("1989/5/12"), as.Date("1990/4/15"), "days")
date3 <- date2[1:ndays]

#qs = melted_level1$value[which(melted_level1$variable=="queenstrength")]
#plot level1 daily sensitivities
pcc_level1 <- as.data.frame(cbind(date, tdarray_pccout_level1[1:ndays,1:dim(tdarray_pccout_level1)[2]]))
level1<- pcc_level1%>%
  select(date,queenstrength,wkrdrnratio,drnmitesurvive,wkrmitesurvive,fgrlifespan)#,ForagerMaxProp,totalimmmites)#,
# pctresistimmmites,RQQueenStrength,drnadultinfest,drnbroodinfest,
# drnmiteoffspring,wkradultinfest,wkrbroodinfest,wkrmiteoffspring)
# pcc_level1 <- as.data.frame(cbind(date, tdarray_pccout_level1[1:ndays,2:dim(tdarray_pccout_level1)[2]]))
# level1<- pcc_level1%>%
#   select(date,wkrdrnratio,drnmitesurvive,wkrmitesurvive,fgrlifespan,ForagerMaxProp,totalimmmites,
#          pctresistimmmites,
#          #InitColNectar,InitColPollen,
#          RQQueenStrength,drnadultinfest,drnbroodinfest,
#          drnmiteoffspring,wkradultinfest,wkrbroodinfest,wkrmiteoffspring)
#          #cl4pollen,cl4nectar,cl5pollen,
#          #cl5nectar,cldpollen,cldnectar,ca13pollen,ca13nectar,ca410pollen,ca410nectar,ca1120pollen,
#          #ca1120nectar,ptrips,ntrips,pload,nload)
melted_level1 = melt(level1, id.vars="date")
coef_filtered<- melted_level1%>%
  filter(abs(melted_level1$value)>0.001)
library(colorspace)
daily_sensitivity_level1 <-  ggplot(coef_filtered, aes(x=date, y=value, group=variable)) +
  geom_line(aes(colour=coef_filtered$variable)) +
  scale_colour_manual(values = c(
    "steelblue", "steelblue",   "steelblue",    "magenta",    "limegreen","firebrick3",   "indianred1",
    # wkrdrnratio  drnmitesurvive  wkrmitesurvive fgrlifespan fgrmaxprop  TotalImmMites pctresistimmmites
    
    #   "deeppink",    "gold3",     
    #InitColNectar InitColPollen 
    
    "green",         "tomato"   ,   "tomato"    , "tomato"      , "tomato3"   ,  "tomato3"   ,   "tomato3"  )) +
  #RQQueenStrength drnadultinfest,drnbroodinfest,drnmiteoffspring,wkradultinfest,wkrbroodinfest,wkrmiteoffspring,
  
  # "steelblue","steelblue","goldenrod","deeppink4", "goldenrod3","steelblue","steelblue", "steelblue",
  #cl4pollen   cl4nectar  cl5pollen   cl5nectar   cldpollen     cldnectar   ca13pollen    ca13nectar   
  
  #   "gold4",
  #ca410pollen
  
  #   "steelblue",     "steelblue", "steelblue",       "gold",     "steelblue",       "gold3",     "deeppink")) + 
  #ca410nectar    ca1120pollen    ca1120nectar    ptrips          ntrips           pload           nload  
  

guides(fill=FALSE) +  
  xlab("Simulation Day") + 
  ylab("Partial Correlation Coefficient") +
  #ggtitle("Daily Sensitivity (PCC) for level1 Scenario") +
  annotate("text", x = 1000, y = 0.92, label = "level1", size=6) +
  theme_bw() +
  
  theme(legend.position = "none",  axis.title.x=element_blank(), axis.text.x=element_blank())

pdf(file= paste(vpdir_fig, "daily_sensitivity_level1.pdf", sep=""), width = 8, height = 6)
daily_sensitivity_level1
dev.off()
#__________________________________________________________________________________________
## level2 daily sensitivity plot
#load level2 pcc results
load(paste(vpdir_out_level2,"tdarray_pccout_level2.RData", sep = ""))
dim(tdarray_pccout_level2)

colnames(tdarray_pccout_level2) <- colnames(inputdata_control2)

#1 or 61
date <- 1:ndays
date2 <- seq(as.Date("1989/5/12"), as.Date("1990/4/15"), "days")
date3 <- date2[1:ndays]

#qs = melted_level2$value[which(melted_level2$variable=="queenstrength")]
#plot level2 daily sensitivities
pcc_level2 <- as.data.frame(cbind(date, tdarray_pccout_level2[1:ndays,2:dim(tdarray_pccout_level2)[2]]))
level2<- pcc_level2%>%
  select(date,queenstrength,wkrdrnratio,drnmitesurvive,wkrmitesurvive,fgrlifespan)#,ForagerMaxProp,totalimmmites)#,
# pctresistimmmites,RQQueenStrength,drnadultinfest,drnbroodinfest,
# drnmiteoffspring,wkradultinfest,wkrbroodinfest,wkrmiteoffspring)
# pcc_level2 <- as.data.frame(cbind(date, tdarray_pccout_level2[1:ndays,2:dim(tdarray_pccout_level2)[2]]))
# level2<- pcc_level2%>%
#   select(date,wkrdrnratio,drnmitesurvive,wkrmitesurvive,fgrlifespan,ForagerMaxProp,totalimmmites,
#          pctresistimmmites,
#          #InitColNectar,InitColPollen,
#          RQQueenStrength,drnadultinfest,drnbroodinfest,
#          drnmiteoffspring,wkradultinfest,wkrbroodinfest,wkrmiteoffspring)
#          #cl4pollen,cl4nectar,cl5pollen,
#          #cl5nectar,cldpollen,cldnectar,ca13pollen,ca13nectar,ca410pollen,ca410nectar,ca1120pollen,
#          #ca1120nectar,ptrips,ntrips,pload,nload)
melted_level2 = melt(level2, id.vars="date")
coef_filtered<- melted_level2%>%
  filter(abs(melted_level2$value)>0.001)
library(colorspace)
daily_sensitivity_level2 <-  ggplot(coef_filtered, aes(x=date, y=value, group=variable)) +
  geom_line(aes(colour=coef_filtered$variable)) +
  scale_colour_manual(values = c(
    "steelblue", "steelblue",   "steelblue",    "magenta",    "limegreen","firebrick3",   "indianred1",
    # wkrdrnratio  drnmitesurvive  wkrmitesurvive fgrlifespan fgrmaxprop  TotalImmMites pctresistimmmites
    
    #   "deeppink",    "gold3",     
    #InitColNectar InitColPollen 
    
    "green",         "tomato"   ,   "tomato"    , "tomato"      , "tomato3"   ,  "tomato3"   ,   "tomato3"  )) +
  #RQQueenStrength drnadultinfest,drnbroodinfest,drnmiteoffspring,wkradultinfest,wkrbroodinfest,wkrmiteoffspring,
  
  # "steelblue","steelblue","goldenrod","deeppink4", "goldenrod3","steelblue","steelblue", "steelblue",
  #cl4pollen   cl4nectar  cl5pollen   cl5nectar   cldpollen     cldnectar   ca13pollen    ca13nectar   
  
  #   "gold4",
  #ca410pollen
  
  #   "steelblue",     "steelblue", "steelblue",       "gold",     "steelblue",       "gold3",     "deeppink")) + 
  #ca410nectar    ca1120pollen    ca1120nectar    ptrips          ntrips           pload           nload  
  

guides(fill=FALSE) +  
  xlab("Simulation Day") + 
  ylab("Partial Correlation Coefficient") +
  #ggtitle("Daily Sensitivity (PCC) for level2 Scenario") +
  annotate("text", x = 1000, y = 0.92, label = "level2", size=6) +
  theme_bw() +
  
  theme(legend.position = "none",  axis.title.x=element_blank(), axis.text.x=element_blank())

pdf(file= paste(vpdir_fig, "daily_sensitivity_level2.pdf", sep=""), width = 8, height = 6)
daily_sensitivity_level2
dev.off()
#__________________________________________________________________________________________
## level3 daily sensitivity plot
#load level3 pcc results
load(paste(vpdir_out_level3,"tdarray_pccout_level3.RData", sep = ""))
dim(tdarray_pccout_level3)

colnames(tdarray_pccout_level3) <- colnames(inputdata_control2)

#1 or 61
date <- 1:ndays
date2 <- seq(as.Date("1989/5/12"), as.Date("1990/4/15"), "days")
date3 <- date2[1:ndays]

#qs = melted_level3$value[which(melted_level3$variable=="queenstrength")]
#plot level3 daily sensitivities
pcc_level3 <- as.data.frame(cbind(date, tdarray_pccout_level3[1:ndays,2:dim(tdarray_pccout_level3)[2]]))
level3<- pcc_level3%>%
  select(date,queenstrength,wkrdrnratio,drnmitesurvive,wkrmitesurvive,fgrlifespan)#,ForagerMaxProp,totalimmmites)#,
# pctresistimmmites,RQQueenStrength,drnadultinfest,drnbroodinfest,
# drnmiteoffspring,wkradultinfest,wkrbroodinfest,wkrmiteoffspring)
# pcc_level3 <- as.data.frame(cbind(date, tdarray_pccout_level3[1:ndays,2:dim(tdarray_pccout_level3)[2]]))
# level3<- pcc_level3%>%
#   select(date,wkrdrnratio,drnmitesurvive,wkrmitesurvive,fgrlifespan,ForagerMaxProp,totalimmmites,
#          pctresistimmmites,
#          #InitColNectar,InitColPollen,
#          RQQueenStrength,drnadultinfest,drnbroodinfest,
#          drnmiteoffspring,wkradultinfest,wkrbroodinfest,wkrmiteoffspring)
#          #cl4pollen,cl4nectar,cl5pollen,
#          #cl5nectar,cldpollen,cldnectar,ca13pollen,ca13nectar,ca410pollen,ca410nectar,ca1120pollen,
#          #ca1120nectar,ptrips,ntrips,pload,nload)
melted_level3 = melt(level3, id.vars="date")
coef_filtered<- melted_level3%>%
  filter(abs(melted_level3$value)>0.001)
library(colorspace)
daily_sensitivity_level3 <-  ggplot(coef_filtered, aes(x=date, y=value, group=variable)) +
  geom_line(aes(colour=coef_filtered$variable)) +
  scale_colour_manual(values = c(
    "steelblue", "steelblue",   "steelblue",    "magenta",    "limegreen","firebrick3",   "indianred1",
    # wkrdrnratio  drnmitesurvive  wkrmitesurvive fgrlifespan fgrmaxprop  TotalImmMites pctresistimmmites
    
    #   "deeppink",    "gold3",     
    #InitColNectar InitColPollen 
    
    "green",         "tomato"   ,   "tomato"    , "tomato"      , "tomato3"   ,  "tomato3"   ,   "tomato3"  )) +
  #RQQueenStrength drnadultinfest,drnbroodinfest,drnmiteoffspring,wkradultinfest,wkrbroodinfest,wkrmiteoffspring,
  
  # "steelblue","steelblue","goldenrod","deeppink4", "goldenrod3","steelblue","steelblue", "steelblue",
  #cl4pollen   cl4nectar  cl5pollen   cl5nectar   cldpollen     cldnectar   ca13pollen    ca13nectar   
  
  #   "gold4",
  #ca410pollen
  
  #   "steelblue",     "steelblue", "steelblue",       "gold",     "steelblue",       "gold3",     "deeppink")) + 
  #ca410nectar    ca1120pollen    ca1120nectar    ptrips          ntrips           pload           nload  
  

guides(fill=FALSE) +  
  xlab("Simulation Day") + 
  ylab("Partial Correlation Coefficient") +
  #ggtitle("Daily Sensitivity (PCC) for level3 Scenario") +
  annotate("text", x = 1000, y = 0.92, label = "level3", size=6) +
  theme_bw() +
  
  theme(legend.position = "none",  axis.title.x=element_blank(), axis.text.x=element_blank())

pdf(file= paste(vpdir_fig, "daily_sensitivity_level3.pdf", sep=""), width = 8, height = 6)
daily_sensitivity_level3
dev.off()
#__________________________________________________________________________________________
## level4 daily sensitivity plot
#load level4 pcc results
load(paste(vpdir_out_level4,"tdarray_pccout_level4.RData", sep = ""))
dim(tdarray_pccout_level4)

colnames(tdarray_pccout_level4) <- colnames(inputdata_control2)

#1 or 61
date <- 1:ndays
date2 <- seq(as.Date("1989/5/12"), as.Date("1990/4/15"), "days")
date3 <- date2[1:ndays]

#qs = melted_level4$value[which(melted_level4$variable=="queenstrength")]
#plot level4 daily sensitivities
pcc_level4 <- as.data.frame(cbind(date, tdarray_pccout_level4[1:ndays,2:dim(tdarray_pccout_level4)[2]]))
level4<- pcc_level4%>%
  select(date,queenstrength,wkrdrnratio,drnmitesurvive,wkrmitesurvive,fgrlifespan)#,ForagerMaxProp,totalimmmites)#,
# pctresistimmmites,RQQueenStrength,drnadultinfest,drnbroodinfest,
# drnmiteoffspring,wkradultinfest,wkrbroodinfest,wkrmiteoffspring)
# pcc_level4 <- as.data.frame(cbind(date, tdarray_pccout_level4[1:ndays,2:dim(tdarray_pccout_level4)[2]]))
# level4<- pcc_level4%>%
#   select(date,wkrdrnratio,drnmitesurvive,wkrmitesurvive,fgrlifespan,ForagerMaxProp,totalimmmites,
#          pctresistimmmites,
#          #InitColNectar,InitColPollen,
#          RQQueenStrength,drnadultinfest,drnbroodinfest,
#          drnmiteoffspring,wkradultinfest,wkrbroodinfest,wkrmiteoffspring)
#          #cl4pollen,cl4nectar,cl5pollen,
#          #cl5nectar,cldpollen,cldnectar,ca13pollen,ca13nectar,ca410pollen,ca410nectar,ca1120pollen,
#          #ca1120nectar,ptrips,ntrips,pload,nload)
melted_level4 = melt(level4, id.vars="date")
coef_filtered<- melted_level4%>%
  filter(abs(melted_level4$value)>0.001)
library(colorspace)
daily_sensitivity_level4 <-  ggplot(coef_filtered, aes(x=date, y=value, group=variable)) +
  geom_line(aes(colour=coef_filtered$variable)) +
  scale_colour_manual(values = c(
    "steelblue", "steelblue",   "steelblue",    "magenta",    "limegreen","firebrick3",   "indianred1",
    # wkrdrnratio  drnmitesurvive  wkrmitesurvive fgrlifespan fgrmaxprop  TotalImmMites pctresistimmmites
    
    #   "deeppink",    "gold3",     
    #InitColNectar InitColPollen 
    
    "green",         "tomato"   ,   "tomato"    , "tomato"      , "tomato3"   ,  "tomato3"   ,   "tomato3"  )) +
  #RQQueenStrength drnadultinfest,drnbroodinfest,drnmiteoffspring,wkradultinfest,wkrbroodinfest,wkrmiteoffspring,
  
  # "steelblue","steelblue","goldenrod","deeppink4", "goldenrod3","steelblue","steelblue", "steelblue",
  #cl4pollen   cl4nectar  cl5pollen   cl5nectar   cldpollen     cldnectar   ca13pollen    ca13nectar   
  
  #   "gold4",
  #ca410pollen
  
  #   "steelblue",     "steelblue", "steelblue",       "gold",     "steelblue",       "gold3",     "deeppink")) + 
  #ca410nectar    ca1120pollen    ca1120nectar    ptrips          ntrips           pload           nload  
  

guides(fill=FALSE) +  
  xlab("Simulation Day") + 
  ylab("Partial Correlation Coefficient") +
  #ggtitle("Daily Sensitivity (PCC) for level4 Scenario") +
  annotate("text", x = 1000, y = 0.92, label = "level4", size=6) +
  theme_bw() +
  
  theme(legend.position = "none",  axis.title.x=element_blank(), axis.text.x=element_blank())

pdf(file= paste(vpdir_fig, "daily_sensitivity_level4.pdf", sep=""), width = 8, height = 6)
daily_sensitivity_level4
dev.off()


# ########### foliar daily sensitivity plot
# #load foliar pcc results
# load(paste(vpdir_out_foliar,"tdarray_pccout_foliar.RData", sep = ""))
# dim(tdarray_pccout_foliar)
# 
# colnames(tdarray_pccout_foliar) <- colnames(inputdata_foliar)
# colnames(tdarray_pccout_foliar)
# date <- 61:ndays
# 
# #qs = melted_foliar$value[which(melted_foliar$variable=="queenstrength")]
# #plot foliar daily sensitivities
# pcc_foliar <- as.data.frame(cbind(date, tdarray_pccout_foliar[61:ndays,2:dim(tdarray_pccout_foliar)[2]]))
# foliar<- pcc_foliar%>%
#   select(date,wkrdrnratio,drnmitesurvive,wkrmitesurvive,fgrlifespan,ForagerMaxProp,totalimmmites,
#          pctresistimmmites,InitColNectar,InitColPollen,RQQueenStrength,drnadultinfest,drnbroodinfest,
#          drnmiteoffspring,wkradultinfest,wkrbroodinfest,wkrmiteoffspring,adslope,adLD50,adslopec,adLD50c,
#          lslope,lLD50, apprate,halflife.1, cl4pollen,cl4nectar,cl5pollen,
#          cl5nectar,cldpollen,cldnectar,ca13pollen,ca13nectar,ca410pollen,ca410nectar,ca1120pollen,
#          ca1120nectar,ptrips,ntrips,pload,nload)
# melted_foliar = melt(foliar, id.vars="date")
# 
# daily_sensitivity_foliar <- ggplot2(melted_foliar, aes(x=date, y=value, group=variable)) +
#     geom_line(aes(colour=melted_foliar$variable)) +
#     scale_colour_manual(values = c(
#         "steelblue", "steelblue","steelblue",       "blue",    "limegreen" ,"firebrick3",   "indianred1",   "deeppink" ,  "gold3",      
#       #wkrdrnratio,drnmitesurvive,wkrmitesurvive,fgrlifespan,fgrmaxprop,  TotalImmMites pctresistimmmites   InitColNectar,InitColPollen,
# 
#          "green",         "tomato"   ,   "tomato"    , "tomato"      , "tomato3"   ,  "tomato3"   ,   "tomato3"  , "steelblue","steelblue", 
#       #RQQueenStrength, drnadultinfest,drnbroodinfest,drnmiteoffspring,wkradultinfest,wkrbroodinfest,wkrmiteoffspring, adslope,      adLD50
# 
#       "palegreen4", "darkgreen", "steelblue", "steelblue",  "darkorange", "blueviolet",
#       # adslopec    adLD50c     lslope       lLD50             apprate      halflife      
#       
#       "steelblue", "steelblue",   "goldenrod","deeppink4", "goldenrod3","steelblue","steelblue", "steelblue",
#       # cl4pollen    cl4nectar    cl5pollen    cl5nectar       cldpollen       cldnectar      ca13pollen      ca13nectar 
# 
#       "gold4",   "steelblue",     "steelblue", "steelblue", "gold",     "steelblue", "gold3",     "deeppink")) + 
#       # ca410pollen  ca410nectar  ca1120pollen ca1120nectar ptrips      ntrips       pload        nload 
# 
#         guides(fill=FALSE) +  
#     xlab("Simulation Day") + 
#     ylab("Partial Correlation Coefficient") +
#     #ggtitle("Daily Sensitivity (PCC) for Foliar Scenario") +
#     annotate("text", x = 1000, y = 0.92, label = "Foliar", size=6) +
#     theme_bw() +
#     scale_x_discrete(breaks = c(61,426,610,791,1035)) +
#     theme(legend.position = "none",  axis.title.x=element_blank(), axis.text.x=element_blank())
# 
# pdf(file= paste(vpdir_fig, "daily_sensitivity_foliar.pdf", sep=""), width = 8, height = 6)
#   daily_sensitivity_foliar
# dev.off()
# 
# ########### soil daily sensitivity plot
# #load soil pcc results
# load(paste(vpdir_out_soil,"tdarray_pccout_soil.RData", sep = ""))
# dim(tdarray_pccout_soil)
# 
# colnames(tdarray_pccout_soil) <- colnames(inputdata_soil)
# colnames(tdarray_pccout_soil)
# date <- 61:ndays
# 
# #qs = melted_soil$value[which(melted_soil$variable=="queenstrength")]
# #plot soil daily sensitivities
# pcc_soil <- as.data.frame(cbind(date, tdarray_pccout_soil[61:ndays,2:dim(tdarray_pccout_soil)[2]]))
# soil<- pcc_soil%>%
#   select(date,wkrdrnratio,drnmitesurvive,wkrmitesurvive,fgrlifespan,ForagerMaxProp,totalimmmites,
#          pctresistimmmites,InitColNectar,InitColPollen,RQQueenStrength,drnadultinfest,drnbroodinfest,
#          drnmiteoffspring,wkradultinfest,wkrbroodinfest,wkrmiteoffspring,adslope,adLD50,adslopec,adLD50c,
#          lslope,lLD50, kow, koc, apprate,halflife.1, cl4pollen,cl4nectar,cl5pollen,
#          cl5nectar,cldpollen,cldnectar,ca13pollen,ca13nectar,ca410pollen,ca410nectar,ca1120pollen,
#          ca1120nectar,ptrips,ntrips,pload,nload, soilp, soilfoc)
# melted_soil = melt(soil, id.vars="date")
# 
# daily_sensitivity_soil <- ggplot2(melted_soil, aes(x=date, y=value, group=variable)) +
#     geom_line(aes(colour=melted_soil$variable)) +
#     scale_colour_manual(values = c(
#       "steelblue", "steelblue","steelblue",       "blue",    "limegreen" ,"firebrick3",   "indianred1",   "deeppink" ,  "gold3",      
#       #wkrdrnratio,drnmitesurvive,wkrmitesurvive,fgrlifespan,fgrmaxprop,  TotalImmMites pctresistimmmites   InitColNectar,InitColPollen,
#       
#       "green",         "tomato"   ,   "tomato"    , "tomato"      , "tomato3"   ,  "tomato3"   ,   "tomato3"  , "steelblue","steelblue", 
#       #RQQueenStrength, drnadultinfest,drnbroodinfest,drnmiteoffspring,wkradultinfest,wkrbroodinfest,wkrmiteoffspring, adslope,      adLD50
#       
#       "palegreen4", "darkgreen", "steelblue", "steelblue", "steelblue", "steelblue", "darkorange", "blueviolet",
#       # adslopec    adLD50c     lslope       lLD50          kow          koc         apprate      halflife      
#       
#       "steelblue", "steelblue",   "goldenrod","deeppink4", "goldenrod3","steelblue","steelblue", "steelblue",
#       # cl4pollen    cl4nectar    cl5pollen    cl5nectar       cldpollen       cldnectar      ca13pollen      ca13nectar 
#       
#       "gold4",   "steelblue",     "steelblue", "steelblue", "gold",     "steelblue", "gold3",     "deeppink",  "steelblue",   "brown")) + 
#       # ca410pollen  ca410nectar  ca1120pollen ca1120nectar ptrips      ntrips       pload        nload        soilp         soilfoc
#   
#     guides(fill=FALSE) +  
#     xlab("Simulation Day") + 
#     ylab("Partial Correlation Coefficient") +
#     #ggtitle("Daily Sensitivity (PCC) for Soil Scenario") +
#     annotate("text", x = 1000, y = 0.92, label = "Soil", size=6) +
#     theme_bw() +
#     scale_x_discrete(breaks = c(61,426,610,791,1035)) +
#     theme(legend.position = "none",  axis.title.x=element_blank(), axis.text.x=element_blank())
#   
# pdf(file= paste(vpdir_fig, "daily_sensitivity_soil.pdf", sep=""), width = 8, height = 6)
#   daily_sensitivity_soil
# dev.off()
# 
# 
# ########### seed daily sensitivity plot
# #load seed pcc results
# load(paste(vpdir_out_seed,"tdarray_pccout_seed.RData", sep = ""))
# dim(tdarray_pccout_seed)
# 
# colnames(tdarray_pccout_seed) <- colnames(inputdata_seed)
# colnames(tdarray_pccout_seed)
# date <- 61:ndays
# 
# #qs = melted_seed$value[which(melted_seed$variable=="queenstrength")]
# #plot seed daily sensitivities
# pcc_seed <- as.data.frame(cbind(date, tdarray_pccout_seed[61:ndays,2:dim(tdarray_pccout_seed)[2]]))
# seed<- pcc_seed%>%
#   select(date,wkrdrnratio,drnmitesurvive,wkrmitesurvive,fgrlifespan,ForagerMaxProp,totalimmmites,
#          pctresistimmmites,InitColNectar,InitColPollen,RQQueenStrength,drnadultinfest,drnbroodinfest,
#          drnmiteoffspring,wkradultinfest,wkrbroodinfest,wkrmiteoffspring,adslope,adLD50,adslopec,adLD50c,
#          lslope,lLD50, kow, koc, apprate,halflife.1, cl4pollen,cl4nectar,cl5pollen,
#          cl5nectar,cldpollen,cldnectar,ca13pollen,ca13nectar,ca410pollen,ca410nectar,ca1120pollen,
#          ca1120nectar,ptrips,ntrips,pload,nload, seedconc)
# melted_seed = melt(seed, id.vars="date")
# 
# daily_sensitivity_seed <- ggplot2(melted_seed, aes(x=date, y=value, group=variable)) +
#   geom_line(aes(colour=melted_seed$variable)) +
#   scale_colour_manual(values = c(
#     "steelblue", "steelblue","steelblue",       "blue",    "limegreen" ,"firebrick3",   "indianred1",   "deeppink" ,  "gold3",      
#     #wkrdrnratio,drnmitesurvive,wkrmitesurvive,fgrlifespan,fgrmaxprop,  TotalImmMites pctresistimmmites   InitColNectar,InitColPollen,
#     
#     "green",         "tomato"   ,   "tomato"    , "tomato"      , "tomato3"   ,  "tomato3"   ,   "tomato3"  , "steelblue","steelblue", 
#     #RQQueenStrength, drnadultinfest,drnbroodinfest,drnmiteoffspring,wkradultinfest,wkrbroodinfest,wkrmiteoffspring, adslope,      adLD50
#     
#     "palegreen4", "darkgreen", "steelblue", "steelblue", "steelblue", "steelblue", "darkorange", "blueviolet",
#     # adslopec    adLD50c     lslope       lLD50          kow          koc         apprate      halflife      
#     
#     "steelblue", "steelblue",   "goldenrod","deeppink4", "goldenrod3","steelblue","steelblue", "steelblue",
#     # cl4pollen    cl4nectar    cl5pollen    cl5nectar       cldpollen       cldnectar      ca13pollen      ca13nectar 
#     
#     "gold4",   "steelblue",     "steelblue", "steelblue", "gold",     "steelblue", "gold3",     "deeppink",   "brown")) + 
#   # ca410pollen  ca410nectar  ca1120pollen ca1120nectar ptrips      ntrips       pload        nload         seedconc
#     
#   guides(fill=FALSE) +  
#   xlab("Simulation Day") + 
#   ylab("Partial Correlation Coefficient") +
#   #ggtitle("Daily Sensitivity (PCC) for Seed Scenario") +
#   annotate("text", x = 1000, y = 0.92, label = "Seed", size=6) +
#   theme_bw() +
#   #august 9 is day 221, +366 (leap year) = 587
#   scale_x_discrete(breaks = c(61,426,610,791,1035), labels = c("3/1/1988","3/1/1989","9/1/1989","3/1/1990","10/31/1990")) +
#   theme(legend.position = "none")
# 
# pdf(file= paste(vpdir_fig, "daily_sensitivity_seed.pdf", sep=""), width = 8, height = 6)
#   daily_sensitivity_seed
# dev.off()
# 
# ######plot all 4 together
# pdf(file= paste(vpdir_fig, "daily_sensitivity_combined.pdf", sep=""), width = 7, height = 10)
#   multiplot(daily_sensitivity_control, daily_sensitivity_foliar, daily_sensitivity_soil, daily_sensitivity_seed, cols=1)
# dev.off()
# 
# png(file= paste(vpdir_fig, "daily_sensitivity_combined.png", sep=""), width = 7, height = 10, units='in', pointsize=12, res=300)
#   multiplot(daily_sensitivity_control, daily_sensitivity_foliar, daily_sensitivity_soil, daily_sensitivity_seed, cols=1)
# dev.off()
# 
# #create custom legend
# # dummy data
# set.seed(45)
# sens_colors <- c("firebrick3",  "blue", "limegreen",    "firebrick", 
#                  "palegreen4", "darkgreen", "darkorange", "blueviolet",
#                  "goldenrod","deeppink4", "goldenrod3",
#                  "gold4", "gold", "gold3", "deeppink",   
#                  "brown",  "steelblue")
# sens_vars_levels <- c("queenstrength","fgrlifespan", "ForagerMaxProp", "RQQueenStrength",
#                       "adslopec", "adLD50c", "halflife", "apprate",
#                       "cl5pollen", "cl5nectar", "cldpollen", 
#                       "ca410pollen", "ptrips", "pload", "nload",
#                       "soilfoc", "others")
# sens_vars_labels <- c("Queen Strength","Forager Lifespan", "Forager Max Proportion","ReQueen Strength",
#                "adslopec", "adLD50c", "Half-life", "Application rate",
#                "cl5pollen", "cl5nectar", "cldpollen", 
#                "ca410pollen", "Pollen trips", "Pollen load", "Nectar load",
#                "Soil foc", "All others")
# sens_colors_list <- rep(sens_colors, each=5)
# order_list <- rep(1:17,each=5)
# Variables <- rep(sens_vars_levels, each=5)
# df <- data.frame(x=rep(1:5, 17), val=sample(1:100, 85), 
#                  variable=rep(sens_vars_levels, each=5), order_list2 = order_list)
# #reorder factor for labeling
# df$variable <- factor(df$variable, levels=sens_vars_levels, labels=sens_vars_labels)
# 
# # plot
# png(file= paste(vpdir_fig, "daily_bs_legend.png", sep=""), width = 6, height = 6, units='in', pointsize=12, res=300)
#   ggplot2(data = df, aes(x=x, y=val, colour=variable)) + 
#     geom_line() +
#     scale_color_manual(values=sens_colors) +
#     theme_bw()
# dev.off()
# 

  


