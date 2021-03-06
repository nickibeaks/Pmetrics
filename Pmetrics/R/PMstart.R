
.onLoad <- function(...){
  if(interactive()){
    currentVersion <- package_version(suppressWarnings(
      tryCatch(scan("http://www.lapk.org/software/Pmetrics/PmetricsVersion.txt",what="character",quiet=T), 
               error = function(e) e <- "0.1")))  
    installedVersion <- packageVersion("Pmetrics")
    
    if(currentVersion > installedVersion){
      packageStartupMessage(paste("\nPmetrics version ",currentVersion," is available from www.lapk.org/software.  You have version ",installedVersion,".\nUse PMupdate() to get the new version.\n",sep=""))
    }
  }
  
  #find Pmetrics installation folder and set environmental variable
  for(path in .libPaths()){
    if(file.exists(paste(path,"Pmetrics",sep="/"))){
      Sys.setenv("PmetricsPath" = path)
    }
  }
  #figure out 32 or 64 bit
  if(length(grep("64-bit",utils::sessionInfo()))>0) {Sys.setenv("PmetricsBit" = "64")} else {Sys.setenv("PmetricsBit" = "32")}
  
  
  #load Defaults package if not installed
  #   defInstalled <- suppressWarnings(require(Defaults,quietly=T)) #yes this is against convention!!
  #   if(!defInstalled){
  #     packageStartupMessage("\nLoading Defaults package to enable custom defaults for any Pmetrics function.\n")
  #     install.packages("Defaults",dependencies=T,repos="http://cran.cnr.Berkeley.edu")
  #     require(Defaults,quietly=T)
  #   }
  
  #restore user defaults
  if(length(system.file(package="Defaults"))==1){PMreadDefaults()}
  
  
  
}

.onAttach <- function(...){
  #version and OS-specific startup messages
  OS <- getOS()
  if(interactive()){
    installedVersion <- packageVersion("Pmetrics")
    file <- "http://www.lapk.org/PMmsg.txt"
    msg <- c(paste("\nWelcome to Pmetrics, version ",packageVersion("Pmetrics"),".",sep=""),
             "\nUse PMmanual() or visit the LAPK website at http://www.lapk.org/pmetrics.php for help.",
             "\nSee PMnews() for version log.\n")      
    messages <- suppressWarnings(
      tryCatch(scan(file,skip=2,sep="\n",what="character",quiet=T), 
               error = function(e) e <- "NoConnect"))
    if(length(messages)>1){
      for(i in messages){
        temp <- strsplit(i,">")
        if(temp[[1]][1]=="all") {
          msg <- c(msg,paste("\n",temp[[1]][2],"\n",sep=""))

        } else {
          temp2 <- strsplit(temp[[1]][1],",")
          if(temp2[[1]][1]==installedVersion & temp2[[1]][2]==OS) msg <- c(msg,(paste("\n",temp[[1]][2],"\n",sep="")))
        }
      }
    } 
    packageStartupMessage(msg)
  }
  
  #check for need to compile fortran objects
  #new fortran 
  newfort <- paste(system.file("config",package="Pmetrics"),"newFort.txt",sep="/")
  needToBuild <- F
  if(!file.exists(newfort)){
    needToBuild <- T
  } else {
    if(readLines(newfort)=="1") needToBuild <- T
  }
  #never compiled before
  destdir <- switch(OS,"~/.config/Pmetrics/compiledFortran",
                    paste(Sys.getenv("APPDATA"),"\\Pmetrics\\compiledFortran",sep=""),
                    "~/.config/Pmetrics/compiledFortran")
  if(!file.exists(destdir)){
    needToBuild <- T
  }
  
  if(needToBuild){
    packageStartupMessage("\nCRITICAL: Pmetrics needs to compile fortran modules.  You must run PMbuild().\n")
  }
  
}

