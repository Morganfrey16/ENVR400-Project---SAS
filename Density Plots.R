
install.packages('reshape')
library(ggplot2)
library(reshape)

# Time Categories
# 8:30-10pm = Early Evening (red)
# 10-11:30pm = Late Evening (blue)
# 11:30pm-1am = Night (orange)

# GRAPH DAY 1 

# Trip 1 = Late Evening (blue)
# Trip 2 = Night (orange)

# import data
trip_1<-read.csv("Aethelometer Complete Dataset Jan 12 - Trip 1.csv")
head(trip_1)
trip_2<-read.csv("Aethelometer Complete Dataset Jan 12 - Trip 2.csv")
head(trip_2)

# creat dataframes
df_early <- trip_1[, c("Time.hh.mm.ss.", "X3.Sec.Moving.Avg..Delta.C.ug.m.3.")]
View(df_early)
names(df_early) <- c("Time", "Delta C")

df_late <- trip_2[, c("Time.hh.mm.ss.", "X3.Sec.Moving.Avg..Delta.C.ug.m.3.")]
View(df_late)
names(df_late) <- c("Time", "Delta C")

# Let's assume you have data frames df_early and df_late with 2 columns each 
# (time, concentration). Add a column for the time category

df_early$Time <- "Late Evening"
df_late$Time <- "Night"

df <- rbind(df_early, df_late) #(if column order is the same)
df <- melt(df) # (might need to specify the id, unless you delete the time column first --> check how df looks like after melting)
head(df)

ggplot(df, aes(x=value, fill=Time, color=Time)) +
  geom_density(alpha = 0.7, color=NA) +
  scale_fill_manual(values=c("blue", "orange")) + # choose some colours
  theme_light() + 
  coord_cartesian(xlim=c(0,1.5), ylim=c(0,2.5)) + # x axis range
  labs(title = " ", x = "BC (µg/m³)", y = "Density") +
  theme(plot.title = element_text(hjust = 0.5)) + # centre title
  theme(plot.title = element_text(face = "bold", size = 12)) + #Bold and smaller title
  theme(panel.grid = element_blank()) + # remove gridlines
  theme(axis.line = element_line(color = "black"))  # Make axis lines black

# GRAPH DAY 2

# Trip 3 = Late Evening (blue)
# Trip 4 = Night (orange)

# import data
trip_3<-read.csv("Aethalometer Complete Dataset Feb 3 - Trip 3.csv")
head(trip_3)
trip_4<-read.csv("Aethalometer Complete Dataset Feb 3 - Trip 4.csv")
head(trip_4)

# creat dataframes
df_early_3 <- trip_3[, c("Time.hh.mm.ss.", "X3.Sec.Moving.Avg..Delta.C.ug.m.3.")]
View(df_early_3)
names(df_early_3) <- c("Time", "Delta C")

df_late_4 <- trip_4[, c("Time.hh.mm.ss.", "X3.Sec.Moving.Avg..Delta.C.ug.m.3.")]
View(df_late_4)
names(df_late_4) <- c("Time", "Delta C")

# Let's assume you have data frames df_early and df_late with 2 columns each 
# (time, concentration). Add a column for the time category

df_early_3$Time <- "Late Evening"
df_late_4$Time <- "Night"

df <- rbind(df_early_3, df_late_4) #(if column order is the same)
df <- melt(df) # (might need to specify the id, unless you delete the time column first --> check how df looks like after melting)
head(df)

ggplot(df, aes(x=value, fill=Time, color=Time)) +
  geom_density(alpha = 0.7, color=NA) +
  scale_fill_manual(values=c("blue", "orange")) + # choose some colours
  theme_light() + 
  coord_cartesian(xlim=c(0,1.5), ylim=c(0,2.5)) + # x axis range
  labs(title = " ", x = "BC (µg/m³)", y = "Density") +
  theme(plot.title = element_text(hjust = 0.5)) + # centre title
  theme(plot.title = element_text(face = "bold", size = 12)) + #Bold and smaller title
  theme(panel.grid = element_blank()) + # remove gridlines
  theme(axis.line = element_line(color = "black"))  # Make axis lines black
  
# GRAPH DAY 3

# Trip 5 = Evening (red)
# Trip 6 = Late Evening (blue)

# import data
trip_5<-read.csv("Aethalometer Complete Dataset Feb 4 - Trip 5.csv")
head(trip_5)
trip_6<-read.csv("Aethalometer Complete Dataset Feb 4 - Trip 6.csv")
head(trip_6)

# creat dataframes
df_early_5 <- trip_5[, c("Time.hh.mm.ss.", "X3.Sec.Moving.Avg..Delta.C.ug.m.3.")]
df_early_5 <- df_early_5[df_early_5[, 2] != 0, ] # remove zero values
View(df_early_5)
names(df_early_5) <- c("Time", "Delta C")

df_late_6 <- trip_6[, c("Time.hh.mm.ss.", "X3.Sec.Moving.Avg..Delta.C.ug.m.3.")]
View(df_late_6)
names(df_late_6) <- c("Time", "Delta C")

# Let's assume you have data frames df_early and df_late with 2 columns each 
# (time, concentration). Add a column for the time category

df_early_5$Time <- "Early Evening"
df_late_6$Time <- "Late Evening"

df <- rbind(df_early_5, df_late_6) #(if column order is the same)
df <- melt(df) # (might need to specify the id, unless you delete the time column first --> check how df looks like after melting)
head(df)

ggplot(df, aes(x=value, fill=Time, color=Time)) +
  geom_density(alpha = 0.7, color=NA) +
  scale_fill_manual(values=c("red", "blue")) + # choose some colours
  theme_light() + 
  coord_cartesian(xlim=c(0,1.5), ylim=c(0,2.5)) + # x axis range
  labs(title = " ", x = "BC (µg/m³)", y = "Density") +
  theme(plot.title = element_text(hjust = 0.5)) + # centre title
  theme(plot.title = element_text(face = "bold", size = 12)) + #Bold and smaller title
  theme(panel.grid = element_blank()) + # remove gridlines
  theme(axis.line = element_line(color = "black"))  # Make axis lines black
