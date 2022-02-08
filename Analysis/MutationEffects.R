require(ggplot2)
install.packages("viridis")
library(viridis)


#Set your working directory to the Analysis folder from the git repo https://github.com/anyaevostinar/Dirty-Transmission-Hypothesis-Paper/tree/main/Analysis

#Line and box plot Interaction Value
initial_data <- read.table("02.01.2022-HorizMutSweep/munged_average.dat", h=T)
symbiont <- subset(initial_data, partner=="Sym")
symbiont <- na.omit(symbiont)
symbiont_final <-subset(symbiont, update ==10000)


#Low and medium HTMR 
low_htmr <- subset(symbiont_final, HMR<"HMR0.9")
labelForX <- c("10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%")
labelForLeg = c("10%", "50%")


#3inx5in
ggplot(data=low_htmr, aes(x=VR, y=donate, color=HMR)) + geom_boxplot(alpha=0.5, outlier.size=0) + ylab("Final Mean Symbiont Interaction Value") + xlab("Vertical Transmission Rate") + theme(panel.background = element_rect(fill='white', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), legend.position = c(0.87, 0.25)) + guides(fill=FALSE) +ylim(-1,1) + scale_color_manual(name="Horizontal\nTransmission\nMutation Rate", values=viridis(4), labels = labelForLeg) +  scale_x_discrete(labels= labelForX)

hmr01VR01 <- subset(subset(low_htmr, HMR=="HMR0.1"), VR=="VR0.1")
hmr05VR01 <- subset(subset(low_htmr, HMR=="HMR0.5"), VR=="VR0.1")
wilcox.test(hmr01VR01$donate, hmr05VR01$donate)

hmr01VR02 <- subset(subset(low_htmr, HMR=="HMR0.1"), VR=="VR0.2")
hmr05VR02 <- subset(subset(low_htmr, HMR=="HMR0.5"), VR=="VR0.2")
wilcox.test(hmr01VR02$donate, hmr05VR02$donate)

hmr01VR03 <- subset(subset(low_htmr, HMR=="HMR0.1"), VR=="VR0.3")
hmr05VR03 <- subset(subset(low_htmr, HMR=="HMR0.5"), VR=="VR0.3")
wilcox.test(hmr01VR03$donate, hmr05VR03$donate)

hmr01VR04 <- subset(subset(low_htmr, HMR=="HMR0.1"), VR=="VR0.4")
hmr05VR04 <- subset(subset(low_htmr, HMR=="HMR0.5"), VR=="VR0.4")
wilcox.test(hmr01VR04$donate, hmr05VR04$donate)

hmr01VR05 <- subset(subset(low_htmr, HMR=="HMR0.1"), VR=="VR0.5")
hmr05VR05 <- subset(subset(low_htmr, HMR=="HMR0.5"), VR=="VR0.5")
median(hmr01VR05$donate)
median(hmr05VR05$donate)
wilcox.test(hmr01VR05$donate, hmr05VR05$donate)

hmr01VR06 <- subset(subset(low_htmr, HMR=="HMR0.1"), VR=="VR0.6")
hmr05VR06 <- subset(subset(low_htmr, HMR=="HMR0.5"), VR=="VR0.6")
median(hmr01VR06$donate)
median(hmr05VR06$donate)
wilcox.test(hmr01VR06$donate, hmr05VR06$donate)

hmr01VR07 <- subset(subset(low_htmr, HMR=="HMR0.1"), VR=="VR0.7")
hmr05VR07 <- subset(subset(low_htmr, HMR=="HMR0.5"), VR=="VR0.7")
wilcox.test(hmr01VR07$donate, hmr05VR07$donate)

#Efficiency Plots
initial_data <- read.table("02.01.2022-HorizMutSweep/munged_efficiency.dat", h=T)
initial_data <- na.omit(initial_data)

labelForX <- c("10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%")
labelForLeg = c("10%", "50%", "100%")
ggplot(data=initial_data, aes(x=VR, y=efficiency*100, color=HMR)) + geom_boxplot(alpha=0.5, outlier.size=0) + ylab("Final Mean Symbiont Efficiency Value (%)") + xlab("Vertical Transmission Rate") + theme(panel.background = element_rect(fill='white', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), legend.position = c(0.15, 0.3)) + guides(fill=FALSE)  + scale_color_manual(name="Horizontal\nTransmission\nMutation Rate", values=viridis(4), labels = labelForLeg) +  scale_x_discrete(labels= labelForX) +ylim(90, 100)


#All HTMR, VR < 70%
low_vr <- subset(symbiont_final, VR<"VR0.7")
labelForX <- c("10%", "20%", "30%", "40%", "50%", "60%")
labelForLeg = c("10%", "50%", "100%")
ggplot(data=low_vr, aes(x=VR, y=donate, color=HMR)) + geom_boxplot(alpha=0.5, outlier.size=0) + ylab("Final Mean Symbiont Interaction Value") + xlab("Vertical Transmission Rate") + theme(panel.background = element_rect(fill='white', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), legend.position = c(0.8, 0.25)) + guides(fill=FALSE) +ylim(-1,1) + scale_color_manual(name="Horizontal\nTransmission\nMutation Rate", values=viridis(4), labels = labelForLeg) +  scale_x_discrete(labels= labelForX)

hmr05VR03 <- subset(subset(symbiont_final, HMR=="HMR0.5"), VR=="VR0.3")
hmr1VR03 <- subset(subset(symbiont_final, HMR=="HMR1.0"), VR=="VR0.3")
median(hmr05VR03$donate)
median(hmr1VR03$donate)
wilcox.test(hmr05VR03$donate, hmr1VR03$donate)

hmr05VR04 <- subset(subset(symbiont_final, HMR=="HMR0.5"), VR=="VR0.4")
hmr1VR04 <- subset(subset(symbiont_final, HMR=="HMR1.0"), VR=="VR0.4")
median(hmr05VR04$donate)
median(hmr1VR04$donate)
wilcox.test(hmr05VR04$donate, hmr1VR04$donate)

#Stacked Histograms

correct_labels <- function(first_try) {
  neg1_9 <- cbind(subset(first_try, interval=="-1_-.9"), Interaction_Rate="-1 to -0.8 (Antagonistic)")
  neg9_8 <- cbind(subset(first_try, interval=="-.9_-.8"), Interaction_Rate="-1 to -0.8 (Antagonistic)")
  neg8_7 <- cbind(subset(first_try, interval=="-.8_-.7"), Interaction_Rate="-0.8 to -0.6 (Antagonistic)")
  neg7_6 <- cbind(subset(first_try, interval=="-.7_-.6"), Interaction_Rate="-0.8 to -0.6 (Antagonistic)")
  neg6_5 <- cbind(subset(first_try, interval=="-.6_-.5"), Interaction_Rate="-0.6 to -0.4 (Detrimental)")
  neg5_4 <- cbind(subset(first_try, interval=="-.5_-.4"), Interaction_Rate="-0.6 to -0.4 (Detrimental)")
  neg4_3 <- cbind(subset(first_try, interval=="-.4_-.3"), Interaction_Rate="-0.4 to -0.2 (Detrimental)")
  neg3_2 <- cbind(subset(first_try, interval=="-.3_-.2"), Interaction_Rate="-0.4 to -0.2 (Detrimental)")
  neg2_1 <- cbind(subset(first_try, interval=="-.2_-.1"), Interaction_Rate="-0.2 to 0 (Nearly Neutral)")
  neg1_0 <- cbind(subset(first_try, interval=="-.1_0"), Interaction_Rate="-0.2 to 0 (Nearly Neutral)")
  pos0_1 <- cbind(subset(first_try, interval=="0_.1"), Interaction_Rate="0 to 0.2 (Nearly Neutral)")
  pos1_2 <- cbind(subset(first_try, interval==".1_.2"), Interaction_Rate="0 to 0.2 (Nearly Neutral)")
  pos2_3 <- cbind(subset(first_try, interval==".2_.3"), Interaction_Rate="0.2 to 0.4 (Positive)")
  pos3_4 <- cbind(subset(first_try, interval==".3_.4"), Interaction_Rate="0.2 to 0.4 (Positive)")
  pos4_5 <- cbind(subset(first_try, interval==".4_.5"), Interaction_Rate="0.4 to 0.6 (Positive)")
  pos5_6 <- cbind(subset(first_try, interval==".5_.6"), Interaction_Rate="0.4 to 0.6 (Positive)")
  pos6_7 <- cbind(subset(first_try, interval==".6_.7"), Interaction_Rate="0.6 to 0.8 (Mutualistic)")
  pos7_8 <- cbind(subset(first_try, interval==".7_.8"), Interaction_Rate="0.6 to 0.8 (Mutualistic)")
  pos8_9 <- cbind(subset(first_try, interval==".8_.9"), Interaction_Rate="0.8 to 1.0 (Mutualistic)")
  pos9_1 <- cbind(subset(first_try, interval==".9_1"), Interaction_Rate="0.8 to 1.0 (Mutualistic)")
  
  combined <- rbind(neg1_9, neg9_8, neg8_7, neg7_6, neg6_5, neg5_4, neg4_3, neg3_2, neg2_1, neg1_0, pos0_1, pos1_2, pos2_3, pos3_4, pos4_5, pos5_6, pos6_7, pos7_8, pos8_9, pos9_1)
  
  combined$Interaction_Rate <- factor(combined$Interaction_Rate, levels=c("-1 to -0.8 (Antagonistic)", "-0.8 to -0.6 (Antagonistic)", "-0.6 to -0.4 (Detrimental)", "-0.2 to 0 (Nearly Neutral)", "0 to 0.2 (Nearly Neutral)", "0.2 to 0.4 (Positive)", "0.4 to 0.6 (Positive)", "0.6 to 0.8 (Mutualistic)", "0.8 to 1.0 (Mutualistic)"))
  return(combined)
  
}

stacked_histogram_gen <- function(file_name) {
  first_try <- read.table(file_name, h=T)
  
  combined <- correct_labels(first_try)
  
  temp <- aggregate(list(count = combined$count), list(update=combined$update, treatment=combined$treatment, Interaction_Rate=combined$Interaction_Rate), sum)
  
  return(temp)
  
}

break_out_gen <- function(file_name, treatment_wrap) {
  input_data <- read.table(file_name, h=T)
  input_data <-subset(input_data, update<5000)
  combined <- correct_labels(input_data)
  breakout <- subset(combined, treatment == treatment_wrap)
  
  temp <- aggregate(list(count = breakout$count), list(update=breakout$update, rep=breakout$rep, Interaction_Rate=breakout$Interaction_Rate, partner=breakout$partner), sum)
  
  return(temp)
  
}

#Stacked Histograms 40% VT Investigation
temp <- stacked_histogram_gen("02.01.2022-HorizMutSweep/munged_histogram_sym_vt40.dat")
hmr01 <- cbind(subset(temp, treatment=="HMR0.1VR0.4"), Treatment="HTMR 10%")
hmr05 <- cbind(subset(temp, treatment=="HMR0.5VR0.4"), Treatment="HTMR 50%")
hmr1 <- cbind(subset(temp, treatment=="HMR1.0VR0.4"), Treatment="HTMR 100%")
temp <- rbind(hmr01, hmr05, hmr1)
temp$Treatment <- factor(temp$Treatment, levels=c("HTMR 10%", "HTMR 50%", "HTMR 100%"))

#3in x 8in
ggplot(temp, aes(update, count)) + geom_area(aes(fill=Interaction_Rate), position='stack') +ylab("Count of Symbionts with Phenotype") + xlab("Evolutionary time (in updates)") +scale_fill_manual("Interaction Value\n Phenotypes",values=magma(9, direction=-1)) +facet_wrap(~treatment) + theme(panel.background = element_rect(fill='light grey', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + guides(fill=FALSE) + guides(fill = guide_legend()) + facet_wrap(~Treatment)

#4.5in x 8in
sym_breakout <- break_out_gen("02.01.2022-HorizMutSweep/munged_histogram_sym_vt40.dat", "HMR1.0VR0.4")
ggplot(sym_breakout, aes(update, count)) + geom_area(aes(fill=Interaction_Rate), position='stack') +ylab("Count of Symbionts with Phenotype") + xlab("Evolutionary time (in updates)") +scale_fill_manual("Interaction Value\n Phenotypes",values=magma(9, direction=-1)) +facet_wrap(~rep) + theme(panel.background = element_rect(fill='light grey', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) + guides(fill=FALSE) + guides(fill = guide_legend()) + facet_wrap(~rep)

host_data <- stacked_histogram_gen("12.17.2021-HorizMutSweep/munged_histogram_host_vt40.dat")
ggplot(host_data, aes(update, count)) + geom_area(aes(fill=Interaction_Rate), position='stack') +ylab("Count of Hosts with Phenotype") + xlab("Evolutionary time (in updates)") +scale_fill_manual("Interaction Value\n Phenotypes",values=magma(9, direction=-1)) +facet_wrap(~treatment) + theme(panel.background = element_rect(fill='light grey', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + guides(fill=FALSE) + guides(fill = guide_legend()) + facet_wrap(~treatment)

host_breakout <- break_out_gen("12.17.2021-HorizMutSweep/munged_histogram_host_vt40.dat", "HMR1.0VR0.4")
ggplot(host_breakout, aes(update, count)) + geom_area(aes(fill=Interaction_Rate), position='stack') +ylab("Count of Hosts with Phenotype") + xlab("Evolutionary time (in updates)") +scale_fill_manual("Interaction Value\n Phenotypes",values=magma(9, direction=-1)) +facet_wrap(~rep) + theme(panel.background = element_rect(fill='light grey', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) + guides(fill=FALSE) + guides(fill = guide_legend()) + facet_wrap(~rep)

## Replicate 31 Case Study
host31 <- subset(host_breakout, rep==31)
sym31 <- subset(sym_breakout, rep==31)
rep31 <- rbind(host31, sym31)
rep31 <- subset(rep31, update <2500)

ggplot(rep31, aes(update, count)) + geom_area(aes(fill=Interaction_Rate), position='stack') +ylab("Count of Organisms with Phenotype") + xlab("Evolutionary time (in updates)") +scale_fill_manual("Interaction Rate\n Phenotypes",values=magma(9, direction=-1)) +facet_wrap(~rep) + theme(panel.background = element_rect(fill='white', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + guides(fill=FALSE) + guides(fill = guide_legend()) + facet_wrap(~partner,ncol=1) + geom_vline(xintercept = 2100, colour="grey")

#Stacked Histograms 30% VT Investigation

temp <- stacked_histogram_gen("12.17.2021-HorizMutSweep/munged_histogram_sym.dat")
ggplot(temp, aes(update, count)) + geom_area(aes(fill=Interaction_Rate), position='stack') +ylab("Count of Symbionts with Phenotype") + xlab("Evolutionary time (in updates)") +scale_fill_manual("Interaction Rate\n Phenotypes",values=magma(9, direction=-1)) +facet_wrap(~treatment) + theme(panel.background = element_rect(fill='light grey', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + guides(fill=FALSE) + guides(fill = guide_legend()) + facet_wrap(~treatment)

#temp <- break_out_gen("12.17.2021-HorizMutSweep/munged_histogram_sym.dat", "HMR1.0VR0.3")
temp <- break_out_gen("12.17.2021-HorizMutSweep/munged_histogram_sym.dat", "HMR0.5VR0.3")
ggplot(temp, aes(update, count)) + geom_area(aes(fill=Interaction_Rate), position='stack') +ylab("Count of Symbionts with Phenotype") + xlab("Evolutionary time (in updates)") +scale_fill_manual("Interaction Rate\n Phenotypes",values=magma(9, direction=-1)) +facet_wrap(~rep) + theme(panel.background = element_rect(fill='light grey', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) + guides(fill=FALSE) + guides(fill = guide_legend()) + facet_wrap(~rep)





