one <- function() {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "Fss06hid.csv");
  data <- read.csv("Fss06hid.csv");
  print("1.");
  print(lapply(names(data), function(name) { return(strsplit(name, "wgtp"))})[123]);
  # "" "15"
}

two <- function() {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "FGDP.csv");
  data <- read.csv("FGDP.csv");
  data <- (data[5:194,])
  data$gdp <- as.numeric(gsub(",", "", data$X.3));
  print(mean(data$gdp));
  
  # 377652.4
}

three <- function() {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "FGDP.csv");
  data <- read.csv("FGDP.csv");
  data <- (data[5:194,]);
  
  countryNames <- data$X.2;
  print(countryNames[grep("^United",countryNames)]);
  # 3
  
}

four <- function() {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", "FEDSTATS.csv");
  fedstats <- read.csv("FEDSTATS.csv");
  print(length(grep("Fiscal year end: June", fedstats$Special.Notes)));
  # 13
}

five <- function() {
  install.packages(quantmod);
  library(quantmod);
  amzn = getSymbols("AMZN",auto.assign=FALSE);
  sampleTimes = index(amzn);
  
  print(length(grep("^2012", sampleTimes)));
  
  # 250
}