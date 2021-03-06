#create input distributions
weather_file<- rep(paste(vrp_weather, sep = ""), Nsims)
sim_start<- rep(paste(simstart, sep = ""), Nsims)
sim_end<- rep(paste(simend, sep = ""), Nsims)
inputdf<- data.frame(weather_file, sim_start, sim_end)
##initial parameter distributions
##overwrites defaults in vrp file
#_______________________________________________________________________________________________________________

NecPolEnable <- rep("true", Nsims) ; inputdf <- cbind(inputdf, NecPolEnable) #NecPolcontaminationEnabled

npcontamination_input1 <- paste(vpdir_input, necpolfile_level1, sep="")
npcontamination_input2 <- paste(vpdir_input, necpolfile_level2, sep="")
npcontamination_input3 <- paste(vpdir_input, necpolfile_level3, sep="")
npcontamination_input4 <- paste(vpdir_input, necpolfile_level4, sep="")

necpol_file_level1 <- rep(npcontamination_input1, Nsims) ; inputdf <- cbind(inputdf, necpol_file_level1)
necpol_file_level2 <- rep(npcontamination_input2, Nsims) ; inputdf <- cbind(inputdf, necpol_file_level2)
necpol_file_level3 <- rep(npcontamination_input3, Nsims) ; inputdf <- cbind(inputdf, necpol_file_level3)
necpol_file_level4 <- rep(npcontamination_input4, Nsims) ; inputdf <- cbind(inputdf, necpol_file_level4)

#===============================================================================================================

##base tab of https://docs.google.com/spreadsheets/d/1SG1aceXAoWoxFPag52y09zaYtvnkYH4gXVp9LXj1Yxw/edit#gid=0
 queenstrength<- runif(Nsims, 3, 3) ; inputdf <- cbind(inputdf, queenstrength) #ICQueenStrength
# wkrdrnratio <- runif(Nsims, 1, 5) ; inputdf <- cbind(inputdf, wkrdrnratio) #RQWkrDrnRatio
# drnmitesurvive <- runif(Nsims, 0, 100) ; inputdf <- cbind(inputdf, drnmitesurvive) #ICDroneMiteSurvivorship
# wkrmitesurvive<- runif(Nsims, 0, 100) ; inputdf <- cbind(inputdf, wkrmitesurvive) #ICWorkerMiteSurvivorship
# fgrlifespan <- runif(Nsims, 4, 16) ; inputdf <- cbind(inputdf, fgrlifespan) #ICForagerLifespan
# ForagerMaxProp <- runif(Nsims, 0, 1); inputdf <- cbind(inputdf, ForagerMaxProp) #IC active forager proportion
# immtype <- c("Polynomial", "Cosine", "Sine", "Exponential", "Tangent", "Logarithmic")
# miteimmtype <- sample(immtype, size=Nsims, replace=T) ; inputdf <- cbind(inputdf, miteimmtype) #ImmType
# totalimmmites <- runif(Nsims, 0, 1000) ; inputdf <- cbind(inputdf, totalimmmites) #TotalImmMites
# pctresistimmmites <- runif(Nsims, 0, 100) ; inputdf <- cbind(inputdf, pctresistimmmites) #PctImmMitesResistant


#InitColNectar<- runif(Nsims, 100, 8000) ; inputdf <- cbind(inputdf, InitColNectar)
#InitColPollen<- runif(Nsims, 100, 8000) ; inputdf <- cbind(inputdf, InitColPollen)
#SupPollenEnable= Supplemental pollen feeding
#SupPollenAmount=
#SupPollenBegin=
#SupPollenEnd=
#SupNectarEnable= supplemental nectar feeding
#SupNectarAmount=
#SupNectarBegin=
#SupNectarEnd=

##Requeening
#eggdelay <- runif(Nsims, 0, 50) ; inputdf <- cbind(inputdf, eggdelay) #RQEggLayDelay (days)

#RQQueenStrength<- runif(Nsims, 1, 5) ; inputdf <- cbind(inputdf, RQQueenStrength) #ICQueenStrength

#drnadults <- runif(Nsims, 1, 5000) ; inputdf <- cbind(inputdf, drnadults) #ICDroneAdults
#_________________________________________________________________________________________________
# wkradults <- runif(Nsims, 7000, 8000) ; inputdf <- cbind(inputdf, wkradults) #ICWorkerAdults
# 
# #drnbrood <- runif(Nsims, 1, 5000) ; inputdf <- cbind(inputdf, drnbrood) #ICDroneBrood
# 
# wkrbrood <- runif(Nsims, 9000, 14000) ; inputdf <- cbind(inputdf, wkrbrood) #ICWorkerBrood
# 
# #drnlarv <- runif(Nsims, 1, 5000) ; inputdf <- cbind(inputdf, drnlarv) #ICDroneLarvae 
# 
# wkrlarv <- runif(Nsims, 6500, 7500) ; inputdf <- cbind(inputdf, wkrlarv) #ICWorkerLarvae
# 
# #drneggs <- runif(Nsims, 1, 5000) ; inputdf <- cbind(inputdf, drneggs) #ICDroneEggs
# 
# wkreggs <- runif(Nsims, 5500, 6500) ; inputdf <- cbind(inputdf, wkreggs) #ICWorkerEggs
#________________________________________________________________________________________________

# drnadultinfest <- runif(Nsims, 0, 10) ; inputdf <- cbind(inputdf, drnadultinfest) #ICDroneAdultInfest
# drnbroodinfest <- runif(Nsims, 0, 10) ; inputdf <- cbind(inputdf, drnbroodinfest) #ICDroneBroodInfest
# drnmiteoffspring <- runif(Nsims, 0, 5) ; inputdf <- cbind(inputdf, drnmiteoffspring) #ICDroneMiteOffspring
# wkradultinfest <- runif(Nsims, 0, 10) ; inputdf <- cbind(inputdf, wkradultinfest) #ICWorkerAdultInfest
# wkrbroodinfest <- runif(Nsims, 0, 10) ; inputdf <- cbind(inputdf, wkrbroodinfest) #ICWorkerBroodInfest
# wkrmiteoffspring <- runif(Nsims, 0, 5) ; inputdf <- cbind(inputdf, wkrmiteoffspring) #ICWorkerMiteOffspring

# #requeendate <- rep("mm/dd/yyyy", Nsims) ; inputdf <- cbind(inputdf, requeendate) #RQReQueenDate
# rqenable <- rep("true", Nsims) ; inputdf <- cbind(inputdf, rqenable) #RQEnableReQueen
# rqscheduled <- rep("true", Nsims) ; inputdf <- cbind(inputdf, rqscheduled) #RQScheduled
#rqqueenstrength <- runif(Nsims, 1, 6) ; inputdf <- cbind(inputdf, rqqueenstrength) #RQQueenStrength
#rqonce <- rep("true", Nsims) ; inputdf <- cbind(inputdf, rqonce) #RQOnce

## viticide tab of https://docs.google.com/spreadsheets/d/1SG1aceXAoWoxFPag52y09zaYtvnkYH4gXVp9LXj1Yxw/edit#gid=555526776
##Viticide
#vtduration <- runif(Nsims, 1, 4) ; inputdf <- cbind(inputdf, vtduration) #VTTreatmentDuration (weeks)
#vtmortality <- runif(Nsims, 0, 100) ; inputdf <- cbind(inputdf, vtmortality) #VTMortality
#vtenable <- rep("true", Nsims) ; inputdf <- cbind(inputdf, vtmortality) #VTEnable
#vtstart <- rep("mm/dd/yyyy", Nsims) ; inputdf <- cbind(inputdf, vtstart) #VTTreatmentStart
#vtresistant <- runif(Nsims, 0, 100) ; inputdf <- cbind(inputdf, vtresistant) #InitMitePctResistant

## pesticide tab of https://docs.google.com/spreadsheets/d/1SG1aceXAoWoxFPag52y09zaYtvnkYH4gXVp9LXj1Yxw/edit#gid=1238958414
##pesticide exposure
#________________________________________________________
# adslope<- runif(Nsims, 1, 9) ; inputdf <- cbind(inputdf, adslope)  #AIAdultSlope
# adLD50<- runif(Nsims, 0.001, 1) ; inputdf <- cbind(inputdf, adLD50)  #AIAdultLD50 (ug/bee)
# adslopec<- runif(Nsims, 1,10) ; inputdf <- cbind(inputdf, adslopec)  #AIAdultSlopeContact
# adLD50c<- runif(Nsims, 0.001, 100) ; inputdf <- cbind(inputdf, adLD50c)  #AIAdultLD50Contact (ug/bee)
# lslope<- runif(Nsims, 1, 9) ; inputdf <- cbind(inputdf, lslope)  #AILarvaSlope
# lLD50<- runif(Nsims, 0.001, 100) ; inputdf <- cbind(inputdf, lLD50)  #AILarvaLD50 (ug/larva)
# kow<- runif(Nsims, 0.01, 100000) ; inputdf <- cbind(inputdf, kow)  #AIKOW
# koc<- runif(Nsims, 1, 100000) ; inputdf <- cbind(inputdf, koc)  #AIKOC
# halflife<- runif(Nsims, 0.1, 35) ; inputdf <- cbind(inputdf, halflife)  #AIHalfLife (days)
# apprate <- runif(Nsims, 0.001, 10) ; inputdf <- cbind(inputdf, apprate) #EAppRate (lb/A)
# contactfactor <- runif(Nsims, 0.26, 2.4) ; inputdf <- cbind(inputdf, halflife) #AIContactFactor
# ## Consumption Data (mg/day)
# cl4pollen <- runif(Nsims, 0, 4) ; inputdf <- cbind(inputdf, cl4pollen) #CL4Pollen
# cl4nectar <- runif(Nsims, 0, 100) ; inputdf <- cbind(inputdf, cl4nectar) #CL4Nectar
# cl5pollen <- runif(Nsims, 0, 6) ; inputdf <- cbind(inputdf, cl5pollen) #CL5Pollen
# cl5nectar <- runif(Nsims, 0, 150) ; inputdf <- cbind(inputdf, cl5nectar) #CL5Nectar
# cldpollen <- runif(Nsims, 0, 6) ; inputdf <- cbind(inputdf, cldpollen) #CLDPollen
# cldnectar <- runif(Nsims, 0, 150) ; inputdf <- cbind(inputdf, cldnectar) #CLDNectar
# ca13pollen <- runif(Nsims, 2.2, 8.2) ; inputdf <- cbind(inputdf, ca13pollen) #CA13Pollen
# ca13nectar <- runif(Nsims, 20, 100) ; inputdf <- cbind(inputdf, ca13nectar) #CA13Nectar
# ca410pollen <- runif(Nsims, 2.2, 9.5) ; inputdf <- cbind(inputdf, ca410pollen) #CA410Pollen
# ca410nectar <- runif(Nsims, 20, 200) ; inputdf <- cbind(inputdf, ca410nectar) #CA410Nectar
# ca1120pollen <- runif(Nsims, 0, 3) ; inputdf <- cbind(inputdf, ca1120pollen) #CA1120Pollen
# ca1120nectar <- runif(Nsims, 20, 100) ; inputdf <- cbind(inputdf, ca1120nectar) #CA1120Nectar
# #cadpollen
# #cadnectar
# #cforagerpollen
# #cforagernectar
# ptrips <- runif(Nsims, 4, 30) ; inputdf <- cbind(inputdf, ptrips) #IPollenTrips (per day)
# ntrips <- runif(Nsims, 4, 48) ; inputdf <- cbind(inputdf, ntrips) #INectarTrips (per day)
# #pctnectarfrgrs <- runif(Nsims, 0, 100) ; inputdf <- cbind(inputdf, pctnectarfrgrs) #IPercentNectarForagers
# pload <- runif(Nsims, 4, 16) ; inputdf <- cbind(inputdf, pload) #IPollenLoad (mg/bee)
# nload <- runif(Nsims, 30, 100) ; inputdf <- cbind(inputdf, nload) #INectarLoad (mg/bee)
# foliarenable <- rep("true", Nsims) ; inputdf <- cbind(inputdf, foliarenable) #FoliarEnabled
# foliar_appdate<- rep("07/01/1989", Nsims) ; inputdf <- cbind(inputdf, foliar_appdate) #FoliarAppDate
# foliar_begin<- rep("07/01/1989", Nsims) ; inputdf <- cbind(inputdf, foliar_begin) #FoliarForageBegin
# foliar_end<- rep("07/31/1989", Nsims) ; inputdf <- cbind(inputdf, foliar_end) #FoliarForageEnd
# soilenable <- rep("true", Nsims) ; inputdf <- cbind(inputdf, soilenable) #SoilEnabled
# seedenable <- rep("true", Nsims) ; inputdf <- cbind(inputdf, seedenable) #SeedEnabled
# #soiltheta <- runif(Nsims, 1, 5) ; inputdf <- cbind(inputdf, soiltheta) #ESoilTheta
# soilp <- runif(Nsims, 1, 2) ; inputdf <- cbind(inputdf, soilp) #ESoilP
# soilfoc <- runif(Nsims, 0.001, 0.02) ; inputdf <- cbind(inputdf, soilfoc) #ESoilFoc
# #soilconc <- runif(Nsims, 1, 10) ; inputdf <- cbind(inputdf, soilconc) #ESoilConcentration
# seedconc <- runif(Nsims, 1, 10) ; inputdf <- cbind(inputdf, seedconc) #ESeedConcentration
# soil_begin <- rep("07/01/1989", Nsims) ; inputdf <- cbind(inputdf, soil_begin) #SoilForageBegin
# soil_end <- rep("07/31/1989", Nsims) ; inputdf <- cbind(inputdf, soil_end) #SoilForageEnd
# seed_begin <- rep("07/01/1989", Nsims) ; inputdf <- cbind(inputdf, seed_begin) #SeedForageBegin
# seed_end <- rep("07/31/1989", Nsims) ; inputdf <- cbind(inputdf, seed_end) #SeedForageEnd
# 

# 
# max_nectar <- runif(Nsims, 70000, 130000) ; inputdf <- cbind(inputdf, soilp) #MaxColNectar
# max_pollen <- runif(Nsims, 30000, 70000) ; inputdf <- cbind(inputdf, soilp) #MaxColPollen
#_____________________________________________________________
## leftovers
#folforagebeg <- rep("mm/dd/yyyy", Nsims) ; inputdf <- cbind(inputdf, folforagebeg) #FoliarForageBegin
#folforageend <- rep("mm/dd/yyyy", Nsims) ; inputdf <- cbind(inputdf, folforageend) #FoliarForageEnd
#soilforagebeg <- rep("mm/dd/yyyy", Nsims) ; inputdf <- cbind(inputdf, soilforagebeg) #SoilForageBegin
#soilforageend <- rep("mm/dd/yyyy", Nsims) ; inputdf <- cbind(inputdf, soilforageend) #SoilForageEnd
#seedforagebeg <- rep("mm/dd/yyyy", Nsims) ; inputdf <- cbind(inputdf, seedforagebeg) #SeedForageBegin
#seedforageend <- rep("mm/dd/yyyy", Nsims) ; inputdf <- cbind(inputdf, seedforageend) #SeedForageEnd

##plotting
#plotnone <- rep("false", Nsims) #PlotNone
#PlotAD <- rep("false", Nsims)
#PlotAW <- rep("false", Nsims)
#PlotCS <- rep("false", Nsims)
#PlotDB <- rep("false", Nsims)
#PlotDE <- rep("false", Nsims)
#PlotDL <- rep("false", Nsims)
#PlotF <- rep("false", Nsims)
#PlotTM <- rep("false", Nsims)
#PlotMDB <- rep("false", Nsims)
#PlotMWB <- rep("false", Nsims)
#PlotPDB <- rep("false", Nsims)
#PlotPWB <- rep("false", Nsims)
#PlotPRM <- rep("false", Nsims)
#PlotRM <- rep("false", Nsims)
#PlotWB <- rep("false", Nsims)
#PlotWE <- rep("false", Nsims)
#PlotWL <- rep("false", Nsims)
#PlotIM <- rep("false", Nsims)

#DENone
#DESwarm
#DEChalkbrood
#DEResource
#DESupercedure
#DEPesticide
##

#immstart <- rep("mm/dd/yyyy", Nsims) ; inputdf <- cbind(inputdf, immstart) #ImmStart
#immend <- rep("mm/dd/yyyy", Nsims) ; inputdf <- cbind(inputdf, immend) #ImmEnd
#immenabled <- rep("false", Nsims) ; inputdf <- cbind(inputdf, immenabled) #ImmEnabled

#immtype <- c("Polynomial", "Cosine", "Sine", "Exponential", "Tangent", "Logarithmic")
#miteimmtype <- sample(immtype, size=Nsims, replace=T) #ImmType


######## Create input dataframe
# inputdata_control <- subset(inputdf, select = -c(foliarenable, seedenable, soilenable, apprate))
#  inputdata_foliar <- subset(inputdf, select = -c(seedenable, soilenable))
#  inputdata_seed <- subset(inputdf, select = -c(foliarenable, soilenable))
#  inputdata_soil <- subset(inputdf, select = -c(foliarenable, seedenable))

inputdata_control<- data.frame(queenstrength)#,wkrdrnratio, drnmitesurvive, wkrmitesurvive, fgrlifespan, miteimmtype)
                 #          adslope,adLD50,adslopec,adLD50c,lslope,lLD50,kow,koc,halflife,apprate_con, foliar_false)
inputdata_level1<- data.frame(queenstrength)#,wkrdrnratio, drnmitesurvive, wkrmitesurvive, fgrlifespan, miteimmtype)#,
                           #adslope,adLD50,adslopec,adLD50c,lslope,lLD50,kow,koc,halflife,apprate_exp, foliar_true,
                           #foliar_appdate, foliar_begin, foliar_end)
inputdata_level2<- data.frame(queenstrength)#,wkrdrnratio, drnmitesurvive, wkrmitesurvive, fgrlifespan, miteimmtype)
inputdata_level3<- data.frame(queenstrength)#,wkrdrnratio, drnmitesurvive, wkrmitesurvive, fgrlifespan, miteimmtype)
inputdata_level4<- data.frame(queenstrength)#,wkrdrnratio, drnmitesurvive, wkrmitesurvive, fgrlifespan, miteimmtype)
# ___________________________________________________________________________
# inputdata_control<- data.frame(wkradults,wkrbrood, wkrlarv, wkreggs)
# inputdata_level1<- data.frame(wkradults,wkrbrood, wkrlarv, wkreggs)
# inputdata_level2<- data.frame(wkradults,wkrbrood, wkrlarv, wkreggs)
# inputdata_level3<- data.frame(wkradults,wkrbrood, wkrlarv, wkreggs)
# inputdata_level4<- data.frame(wkradults,wkrbrood, wkrlarv, wkreggs)
#____________________________________________________________________________
# inputdata_control<- data.frame(1,2,3,4)#wkradults,wkrbrood, wkrlarv, wkreggs)
# inputdata_level1<- data.frame(1,2,3,4)#(wkradults,wkrbrood, wkrlarv, wkreggs)
# inputdata_level2<- data.frame(1,2,3,4)#(wkradults,wkrbrood, wkrlarv, wkreggs)
# inputdata_level3<- data.frame(1,2,3,4)#(wkradults,wkrbrood, wkrlarv, wkreggs)
# inputdata_level4<- data.frame(1,2,3,4)#(wkradults,wkrbrood, wkrlarv, wkreggs)
#putting the input in the io directory so it can be read from there later
write.csv(inputdata_control, file = paste(vpdir_in_control, "inputdata_control.csv", sep = ""))
write.csv(inputdata_level1, file = paste(vpdir_in_level1, "inputdata_level1.csv", sep = ""))
write.csv(inputdata_level2, file = paste(vpdir_in_level2, "inputdata_level2.csv", sep = ""))
write.csv(inputdata_level3, file = paste(vpdir_in_level3, "inputdata_level3.csv", sep = ""))
write.csv(inputdata_level4, file = paste(vpdir_in_level4, "inputdata_level4.csv", sep = ""))
