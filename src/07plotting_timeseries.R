# #plot crunching ###########
# #colony persistence
# cp_control <- rep(NA, nrows)
# cp_level1 <- rep(NA, nrows)
# cp_level2 <- rep(NA, nrows)
# cp_level3 <- rep(NA, nrows)
# cp_level4 <- rep(NA, nrows)
# for (n in 1:nrows){
#   x <- which(tdarray_control[n,1,1:Nsims] > 1000) # queries colony size > 1000 for 1000 simulations at each time point
#   y <- which(tdarray_level1[n,1,1:Nsims] > 1000)
#   z <- which(tdarray_level2[n,1,1:Nsims] > 1000)
#   zz <- which(tdarray_level3[n,1,1:Nsims] > 1000)
#   zzz <- which(tdarray_level4[n,1,1:Nsims] > 1000)
#   cp_control[n] <- length(x)/Nsims #appends vector x with proportion of simulations per time step with Col Size > 0
#   cp_level1[n] <- length(y)/Nsims
#   cp_level2[n] <- length(z)/Nsims
#   cp_level3[n] <- length(zz)/Nsims
#   cp_level4[n] <- length(zzz)/Nsims
# }
# 
# #foragers
# fa_control <- rep(NA, nrows)
# fa_level1 <- rep(NA, nrows)
# fa_level2 <- rep(NA, nrows)
# fa_level3 <- rep(NA, nrows)
# fa_level4 <- rep(NA, nrows)
# for (n in 1:nrows){
#   x <- which(tdarray_control[n,4,1:Nsims] > 50) 
#   y <- which(tdarray_level1[n,4,1:Nsims] > 50)
#   z <- which(tdarray_level2[n,4,1:Nsims] > 50)
#   zz <- which(tdarray_level3[n,4,1:Nsims] > 50)
#   zzz <- which(tdarray_level4[n,4,1:Nsims] > 50)
#   fa_control[n] <- length(x)/Nsims
#   fa_level1[n] <- length(y)/Nsims
#   fa_level2[n] <- length(z)/Nsims
#   fa_level3[n] <- length(zz)/Nsims
#   fa_level4[n] <- length(zzz)/Nsims
# }
# 
# #adult workers
# aw_control <- rep(NA, nrows)
# aw_level1 <- rep(NA, nrows)
# aw_level2 <- rep(NA, nrows)
# aw_level3 <- rep(NA, nrows)
# aw_level4 <- rep(NA, nrows)
# for (n in 1:nrows){
#   x <- which(tdarray_control[n,3,1:Nsims] > 50)
#   y <- which(tdarray_level1[n,3,1:Nsims] > 50)
#   z <- which(tdarray_level2[n,3,1:Nsims] > 50)
#   zz <- which(tdarray_level3[n,3,1:Nsims] > 50)
#   zzz <- which(tdarray_level4[n,3,1:Nsims] > 50)
#   aw_control[n] <- length(x)/Nsims
#   aw_level1[n] <- length(y)/Nsims
#   aw_level2[n] <- length(z)/Nsims
#   aw_level3[n] <- length(zz)/Nsims
#   aw_level4[n] <- length(zzz)/Nsims
# }
# 
# #capped worker brood
# cwb_control <- rep(NA, nrows)
# cwb_level1 <- rep(NA, nrows)
# cwb_level2 <- rep(NA, nrows)
# cwb_level3 <- rep(NA, nrows)
# cwb_level4 <- rep(NA, nrows)
# for (n in 1:nrows){
#   x <- which(tdarray_control[n, 6, 1:Nsims] > 50)
#   y <- which(tdarray_level1[n, 6, 1:Nsims] > 50)
#   z <- which(tdarray_level2[n, 6, 1:Nsims] > 50)
#   zz <- which(tdarray_level3[n, 6, 1:Nsims] > 50)
#   zzz <- which(tdarray_level4[n, 6, 1:Nsims] > 50)
#   cwb_control[n] <- length(x)/Nsims
#   cwb_level1[n] <- length(y)/Nsims
#   cwb_level2[n] <- length(z)/Nsims
#   cwb_level3[n] <- length(zz)/Nsims
#   cwb_level4[n] <- length(zzz)/Nsims
# }
# 
# #worker eggs
# we_control <- rep(NA, nrows)
# we_level1 <- rep(NA, nrows)
# we_level2 <- rep(NA, nrows)
# we_level3 <- rep(NA, nrows)
# we_level4 <- rep(NA, nrows)
# for (n in 1:nrows){
#   x <- which(tdarray_control[n,10,1:Nsims] > 50)
#   y <- which(tdarray_level1[n,10,1:Nsims] > 50)
#   z <- which(tdarray_level2[n,10,1:Nsims] > 50)
#   zz <- which(tdarray_level3[n,10,1:Nsims] > 50)
#   zzz <- which(tdarray_level4[n,10,1:Nsims] > 50)
#   we_control[n] <- length(x)/Nsims
#   we_level1[n] <- length(y)/Nsims
#   we_level2[n] <- length(z)/Nsims
#   we_level3[n] <- length(zz)/Nsims
#   we_level4[n] <- length(zzz)/Nsims
# }
# 
# #drone eggs
# de_control <- rep(NA, nrows)
# de_level1 <- rep(NA, nrows)
# de_level2 <- rep(NA, nrows)
# de_level3 <- rep(NA, nrows)
# de_level4 <- rep(NA, nrows)
# for (n in 1:nrows){
#   x <- which(tdarray_control[n,9,1:Nsims] > 0)
#   y <- which(tdarray_level1[n,9,1:Nsims] > 0)
#   z <- which(tdarray_level2[n,9,1:Nsims] > 0)
#   zz <- which(tdarray_level3[n,9,1:Nsims] > 0)
#   zzz <- which(tdarray_level4[n,9,1:Nsims] > 0)
#   de_control[n] <- length(x)/Nsims
#   de_level1[n] <- length(y)/Nsims
#   de_level2[n] <- length(z)/Nsims
#   de_level3[n] <- length(zz)/Nsims
#   de_level4[n] <- length(zzz)/Nsims
# }
# 
# 
# #free mites
# fm_control <- rep(NA, nrows)
# fm_level1 <- rep(NA, nrows)
# fm_level2 <- rep(NA, nrows)
# fm_level3 <- rep(NA, nrows)
# fm_level4 <- rep(NA, nrows)
# for (n in 1:nrows){
#   x <- which(tdarray_control[n,11,1:Nsims] > 0)
#   y <- which(tdarray_level1[n,11,1:Nsims] > 0)
#   z <- which(tdarray_level2[n,11,1:Nsims] > 0)
#   zz <- which(tdarray_level3[n,11,1:Nsims] > 0)
#   zzz <- which(tdarray_level4[n,11,1:Nsims] > 0)
#   fm_control[n] <- length(x)/Nsims
#   fm_level1[n] <- length(y)/Nsims
#   fm_level2[n] <- length(z)/Nsims
#   fm_level3[n] <- length(zz)/Nsims
#   fm_level4[n] <- length(zzz)/Nsims
# }
# 
# # #dead foragers
# # dfr_con <- rep(NA, nrows)
# # dfr_exp <- rep(NA, nrows)
# # for (n in 1:nrows){
# #   x <- which(tdarray_con[n,1,1:Nsims] > 0) 
# #   y <- which(tdarray_exp[n,1,1:Nsims] > 0) 
# #   dfr_con[n] <- length(x)/Nsims 
# #   dfr_exp[n] <- length(y)/Nsims
# # }
# # 
# # #dead mites
# # dm_con <- rep(NA, nrows)
# # dm_exp <- rep(NA, nrows)
# # for (n in 1:nrows){
# #   x <- which(tdarray_con[n,16,1:Nsims] > 0)
# #   y <- which(tdarray_exp[n,16,1:Nsims] > 0)
# #   dm_con[n] <- length(x)/Nsims
# #   dm_exp[n] <- length(y)/Nsims
# # }
# # 
# #capped drone brood
# cdb_control <- rep(NA, nrows)
# cdb_level1 <- rep(NA, nrows)
# cdb_level2 <- rep(NA,nrows)
# cdb_level3 <- rep(NA,nrows)
# cdb_level4 <- rep(NA,nrows)
# for (n in 1:nrows){
#   x <- which(tdarray_control[n, 5, 1:Nsims] > 50)
#   y <- which(tdarray_level1[n, 5, 1:Nsims] > 50)
#   z <- which(tdarray_level2[n,5,1:Nsims] > 50)
#   zz <- which(tdarray_level3[n,5,1:Nsims] > 50)
#   zzz <- which(tdarray_level4[n,5,1:Nsims] > 50)
#   cdb_control[n] <- length(x)/Nsims
#   cdb_level1[n] <- length(y)/Nsims
#   cdb_level2[n] <- length(z)/Nsims
#   cdb_level3[n] <- length(zz)/Nsims
#   cdb_level4[n] <- length(zzz)/Nsims
# }
# 
# 
# #MC proportions ##########
# pdf(file= paste(vpdir_fig, "fig_1_MCproportions_convsexp.pdf", sep=""), width = 5, height = 9, onefile = TRUE, paper = "USr")
#   #start figures
#   par(mfrow=c(6,1), mar=c(2,4,1,0.5), oma=c(4,2,2,1))
#   plot(timearray, cp_control, type="l", col="blue", ylab = "P(Colony Size) > 1000", ylim=c(0,1), xlab=NA)
#   lines(timearray, cp_level1, type="l", lty = 2, col="red")
#   lines(timearray, cp_level2, type="l", lty = 2, col="black")
#   lines(timearray, cp_level3, type="l", lty = 2, col="green")
#   lines(timearray, cp_level4, type="l", lty = 2, col="orange")
#   plot(timearray, fa_control, type="l", col="blue", ylab= "P(Foragers) > 50", ylim=c(0,1), xlab=NA) 
#   lines(timearray, fa_level1, type="l", lty = 2, col="red")
#   lines(timearray, fa_level2, type="l", lty = 2, col="black")
#   lines(timearray, fa_level3, type="l", lty = 2, col="green")
#   lines(timearray, fa_level4, type="l", lty = 2, col="orange")
#   plot(timearray, aw_control, type="l", col="blue", ylab= "P(Adult Workers) > 50", ylim=c(0,1), xlab=NA) 
#   lines(timearray, aw_level1, type="l", lty = 2, col="red")
#   lines(timearray, aw_level2, type="l", lty = 2, col="black")
#   lines(timearray, aw_level3, type="l", lty = 2, col="green")
#   lines(timearray, aw_level4, type="l", lty = 2, col="orange")
#   plot(timearray, cwb_control, type="l", col="blue", ylab = "P(Capped Worker Brood) > 50", ylim=c(0,1), xlab=NA)
#   lines(timearray, cwb_level1, type="l", lty = 2, col="red")
#   lines(timearray, cwb_level2, type="l", lty = 2, col="black")
#   lines(timearray, cwb_level3, type="l", lty = 2, col="green")
#   lines(timearray, cwb_level4, type="l", lty = 2, col="orange")
#   # plot(timearray, we_control, type="l", col="blue", ylab = "P(Worker Eggs) > 50", ylim=c(0,1), xlab=NA)
#   # lines(timearray, we_level1, type="l", lty = 2, col="red")
#   # lines(timearray, we_level3, type="l", lty = 2, col="black")
#   # lines(timearray, we_level2, type="l", lty = 2, col="green")
#   plot(timearray, cdb_control, type="l", col="blue", ylab= "P(Capped Drone Brood) > 50", ylim=c(0,1), xlab=NA)
#   lines(timearray, cdb_level1, type="l", lty = 2, col="red")
#   lines(timearray, cdb_level2, type="l", lty = 2, col="black")
#   lines(timearray, cdb_level3, type="l", lty = 2, col="green")
#   lines(timearray, cdb_level4, type="l", lty = 2, col="orange")
#   plot(timearray, de_control, type="l", col="blue", ylab = "P(Drone Eggs) > 0", ylim=c(0,1), xlab=NA)
#   lines(timearray, de_level1, type="l", lty = 2, col="red")
#   lines(timearray, de_level2, type="l", lty = 2, col="black")
#   lines(timearray, de_level3, type="l", lty = 2, col="green")
#   lines(timearray, de_level4, type="l", lty = 2, col="orange")
#   # plot(timearray, fm_control, type="l", col="blue", ylab= "P(Free Mites) > 0", ylim=c(0,1), xlab=NA)
#   # lines(timearray, fm_level1, type="l", lty = 2, col="red")
#   # lines(timearray, fm_level3, type="l", lty = 2, col="black")
#   # lines(timearray, fm_level2, type="l", lty = 2, col="green")
#   #plot(timearray, dfr_con, type="l", col="blue", ylab= "P(Dead Foragers) > 0", ylim=c(0,1), xlab=NA) 
#   #lines(timearray, dfr_exp, type="l", lty = 2, col="red")
#   #mtext(text = paste("Fig. 1 Proportion of simulations with values greater than zero"), side = 1, line = 1, outer = T)
# dev.off()
# 
# # png(file= paste(vpdir_fig, "fig_1_MCproportions_convsexp.png", sep=""), width = 7, height = 10, units='in', pointsize=12, res=300)
# # par(mfrow=c(6,1), mar=c(2,4,1,0.5), oma=c(4,2,2,1))
# # plot(timearray, cp_control, type="l", col="blue", ylab = "P(Colony Size) > 1000", ylim=c(0,1), xlab=NA)
# # lines(timearray, cp_level1, type="l", lty = 2, col="red")
# # lines(timearray, cp_level3, type="l", lty = 2, col="black")
# # lines(timearray, cp_level2, type="l", lty = 2, col="green")
# # plot(timearray, fa_control, type="l", col="blue", ylab= "P(Foragers) > 50", ylim=c(0,1), xlab=NA) 
# # lines(timearray, fa_level1, type="l", lty = 2, col="red")
# # lines(timearray, fa_level3, type="l", lty = 2, col="black")
# # lines(timearray, fa_level2, type="l", lty = 2, col="green")
# # plot(timearray, aw_control, type="l", col="blue", ylab= "P(Adult Workers) > 50", ylim=c(0,1), xlab=NA) 
# # lines(timearray, aw_level1, type="l", lty = 2, col="red")
# # lines(timearray, aw_level3, type="l", lty = 2, col="black")
# # lines(timearray, aw_level2, type="l", lty = 2, col="green")
# # plot(timearray, cwb_control, type="l", col="blue", ylab = "P(Capped Worker Brood) > 50", ylim=c(0,1), xlab=NA)
# # lines(timearray, cwb_level1, type="l", lty = 2, col="red")
# # lines(timearray, cwb_level3, type="l", lty = 2, col="black")
# # lines(timearray, cwb_level2, type="l", lty = 2, col="green")
# # plot(timearray, we_control, type="l", col="blue", ylab = "P(Worker Eggs) > 50", ylim=c(0,1), xlab=NA)
# # lines(timearray, we_level1, type="l", lty = 2, col="red")
# # lines(timearray, we_level3, type="l", lty = 2, col="black")
# # lines(timearray, we_level2, type="l", lty = 2, col="green")
# # plot(timearray, de_control, type="l", col="blue", ylab = "P(Drone Eggs) > 0", ylim=c(0,1), xlab=NA)
# # lines(timearray, de_level1, type="l", lty = 2, col="red")
# # lines(timearray, de_level3, type="l", lty = 2, col="black")
# # lines(timearray, de_level2, type="l", lty = 2, col="green")
# # dev.off()

#time series plotting #######

# ("Date","Colony Size","Adult Drones","Adult Workers", "Foragers", "Capped Drone Brood", "Capped Worker Brood",
#  "Drone Larvae", "Worker Larvae", "Drone Eggs", "Worker Eggs", "Free Mites", "Drone Brood Mites",
#  "Worker Brood Mites", "Mites/Drone Cell", "Mites/Worker Cell", "Mites Dying", "Proportion Mites Dying",
#  "Colony Pollen (g)", "Pollen Pesticide Concentration", "Colony Nectar", "Nectar Pesticide Concentration",
#  "Dead Drone Larvae", "Dead Worker Larvae", "Dead Drone Adults", "Dead Worker Adults", "Dead Foragers",
#  "Queen Strength", "Average Temperature (celsius)", "Rain")

resvar<- c(1,3,4,6,8,10) #colony size, adult wkr, foragers, capped wkr brood, wkrlarv, wkreggs
resvar_names<- c("Colony Size","Adult Workers", "Foragers", "Capped Worker Brood", "Worker Larvae", "Worker Eggs")

temparray_control <- tdarray_control[1:nrows,resvar,1:Nsims]
temparray_level1 <- tdarray_level1[1:nrows,resvar,1:Nsims]
temparray_level2 <- tdarray_level2[1:nrows,resvar,1:Nsims]
temparray_level3 <- tdarray_level3[1:nrows, resvar, 1:Nsims]
temparray_level4 <- tdarray_level4[1:nrows, resvar, 1:Nsims]
dimnames(temparray_control)<- list(c(as.character(timearray)), c(resvar_names))
dimnames(temparray_level1)<- list(c(as.character(timearray)), c(resvar_names))
dimnames(temparray_level2)<- list(c(as.character(timearray)), c(resvar_names))
dimnames(temparray_level3)<- list(c(as.character(timearray)), c(resvar_names))
dimnames(temparray_level4)<- list(c(as.character(timearray)), c(resvar_names))
tempout_control<- array(data=NA, c(nrows,6,3), dimnames = list(c(as.character(timearray)), 
                                                           c("Colony Size","Adult Workers", "Foragers", "Capped Worker Brood", "Worker Larvae", "Worker Eggs"),
                                                           c("25%","50%","75%")))
tempout_level1<- array(data=NA, c(nrows,6,3), dimnames = list(c(as.character(timearray)), 
                                                           c("Colony Size","Adult Workers", "Foragers", "Capped Worker Brood", "Worker Larvae", "Worker Eggs"), 
                                                           c("25%","50%","75%")))
tempout_level2<- array(data=NA, c(nrows,6,3), dimnames = list(c(as.character(timearray)), 
                                                              c("Colony Size","Adult Workers", "Foragers", "Capped Worker Brood", "Worker Larvae", "Worker Eggs"), 
                                                              c("25%","50%","75%")))
tempout_level3<- array(data=NA, c(nrows,6,3), dimnames = list(c(as.character(timearray)), 
                                                              c("Colony Size","Adult Workers", "Foragers", "Capped Worker Brood", "Worker Larvae", "Worker Eggs"), 
                                                              c("25%","50%","75%")))
tempout_level4<- array(data=NA, c(nrows,6,3), dimnames = list(c(as.character(timearray)), 
                                                              c("Colony Size","Adult Workers", "Foragers", "Capped Worker Brood", "Worker Larvae", "Worker Eggs"), 
                                                              c("25%","50%","75%")))
for (r in 1:6){
  for (t in 1:nrows){
    p<- quantile(temparray_control[t, r, 1:Nsims])
    z<- quantile(temparray_level1[t, r, 1:Nsims])
    q<- quantile(temparray_level2[t, r, 1:Nsims])
    n<- quantile(temparray_level3[t,r,1:Nsims])
    k<- quantile(temparray_level4[t,r,1:Nsims])
    for (s in 1:3){
      quant_control<- c(p[[2]], p[[3]], p[[4]])
      quant_level1<- c(z[[2]], z[[3]], z[[4]])
      quant_level2<- c(q[[2]],q[[3]],q[[4]])
      quant_level3<- c(n[[2]],n[[3]],n[[4]])
      quant_level4<- c(k[[2]],k[[3]],k[[4]])
      tempout_control[t,r,s]<- quant_control[s]
      tempout_level1[t,r,s]<- quant_level1[s]
      tempout_level2[t,r,s]<- quant_level2[s]
      tempout_level3[t,r,s]<- quant_level3[s]
      tempout_level4[t,r,s]<- quant_level4[s]
    }
  }
}

#create PDF timeseries
pdf(file= paste(vpdir_fig, "fig_quantile_timeseries.pdf", sep=""), width = 8.5, height = 11, onefile = TRUE, paper = "USr")
#start figures
#time series plots
par(mfrow=c(6,5), mar=c(2, 4, 2, 0.5), oma= c(3,2,2,6.5))

for (r in 1:6){
  plot(timearray, tempout_control[,r,2], type = "l", ylim = c(0,max(tempout_control[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "Control")
  lines(timearray, tempout_control[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_control[,r,3], type = "l", lty= 4, col = "blue")
  
  plot(timearray, tempout_level1[,r,2], type = "l", ylim = c(0,max(tempout_level1[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "level1")
  lines(timearray, tempout_level1[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_level1[,r,3], type = "l", lty= 4, col = "blue")
  
  plot(timearray, tempout_level2[,r,2], type = "l", ylim = c(0,max(tempout_level2[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "level2")
  lines(timearray, tempout_level2[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_level2[,r,3], type = "l", lty= 4, col = "blue")
  
  plot(timearray, tempout_level3[,r,2], type = "l", ylim = c(0,max(tempout_level3[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "level3")
  lines(timearray, tempout_level3[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_level3[,r,3], type = "l", lty= 4, col = "blue")
  
  plot(timearray, tempout_level4[,r,2], type = "l", ylim = c(0,max(tempout_level4[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "level4")
  lines(timearray, tempout_level4[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_level4[,r,3], type = "l", lty= 4, col = "blue")
}
#mtext(text = paste("Fig. 14 Time series plots of lower, middle, and upper quartiles."), side = 1, line = 1, outer = T)
dev.off()
# 
#create PDF timeseries
pdf(file= paste(vpdir_fig, "fig_quantile_timeseries_simple.pdf", sep=""), width = 8.5, height = 11, onefile = TRUE, paper = "USr")
#start figures
#time series plots
#par(mfrow=c(1,5))#, mar=c(2, 4, 2, 0.5), oma= c(3,2,2,6.5))

for (r in 1:1){
  plot(timearray, tempout_control[,r,2], type = "l", ylim = c(0,max(tempout_control[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "Control")
  lines(timearray, tempout_control[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_control[,r,3], type = "l", lty= 4, col = "blue")
  
  plot(timearray, tempout_level1[,r,2], type = "l", ylim = c(0,max(tempout_level1[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "level1")
  lines(timearray, tempout_level1[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_level1[,r,3], type = "l", lty= 4, col = "blue")
  
  plot(timearray, tempout_level2[,r,2], type = "l", ylim = c(0,max(tempout_level2[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "level2")
  lines(timearray, tempout_level2[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_level2[,r,3], type = "l", lty= 4, col = "blue")
  
  plot(timearray, tempout_level3[,r,2], type = "l", ylim = c(0,max(tempout_level3[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "level3")
  lines(timearray, tempout_level3[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_level3[,r,3], type = "l", lty= 4, col = "blue")
  
  plot(timearray, tempout_level4[,r,2], type = "l", ylim = c(0,max(tempout_level4[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "level4")
  lines(timearray, tempout_level4[,r,1], type = "l", lty= 2, col = "red")
  lines(timearray, tempout_level4[,r,3], type = "l", lty= 4, col = "blue")
}
#mtext(text = paste("Fig. 14 Time series plots of lower, middle, and upper quartiles."), side = 1, line = 1, outer = T)
dev.off()
# 
# png(file= paste(vpdir_fig, "fig_quantile_timeseries.png", sep=""), width = 7, height = 7, units='in', pointsize=12, res=300)
# #start figures
# #time series plots
# par(mfrow=c(4,4), mar=c(2, 4, 2, 0.5), oma= c(3,2,2,6.5))
# 
# for (r in 1:4){
#   plot(timearray, tempout_control[,r,2], type = "l", ylim = c(0,max(tempout_control[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "Control")
#   lines(timearray, tempout_control[,r,1], type = "l", lty= 2, col = "red")
#   lines(timearray, tempout_control[,r,3], type = "l", lty= 4, col = "blue")
#   
#   plot(timearray, tempout_level1[,r,2], type = "l", ylim = c(0,max(tempout_level1[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "level1")
#   lines(timearray, tempout_level1[,r,1], type = "l", lty= 2, col = "red")
#   lines(timearray, tempout_level1[,r,3], type = "l", lty= 4, col = "blue")
#   
#   plot(timearray, tempout_level3[,r,2], type = "l", ylim = c(0,max(tempout_level3[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "level3")
#   lines(timearray, tempout_level3[,r,1], type = "l", lty= 2, col = "red")
#   lines(timearray, tempout_level3[,r,3], type = "l", lty= 4, col = "blue")
#   
#   plot(timearray, tempout_level2[,r,2], type = "l", ylim = c(0,max(tempout_level2[,r,3])), ylab= paste(resvar_names[r]), xlab = NA, main= "level2")
#   lines(timearray, tempout_level2[,r,1], type = "l", lty= 2, col = "red")
#   lines(timearray, tempout_level2[,r,3], type = "l", lty= 4, col = "blue")
# }
# #mtext(text = paste("Fig. 14 Time series plots of lower, middle, and upper quartiles."), side = 1, line = 1, outer = T)
# dev.off()
# 
