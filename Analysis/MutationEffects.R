require(ggplot2)
install.packages("viridis")
library(viridis)


#Set your working directory to the Analysis folder from the git repo https://github.com/anyaevostinar/Dirty-Transmission-Hypothesis-Paper/tree/main/Analysis

tenhelix <- c("#891901", "#B50142", "#D506AD", "#AB08FF", "#5731FD", "#4755FF", "#86E9FE", "#B2FCE3", "#D4FFDD", "#EFFDF0")


#Line and box plot Interaction Value
initial_data <- read.table("12.17.2021-HorizMutSweep/munged_average.dat", h=T)
data_90_95 <- read.table("12.23.2021-HTMR90_95/munged_average.dat", h=T)
combined <- rbind(initial_data, data_90_95)
symbiont <- subset(combined, partner=="Sym")
symbiont <- na.omit(symbiont)
symbiont_final <-subset(symbiont, update ==10000)

#All HTMR, VR < 60%
low_vr <- subset(symbiont_final, VR<"VR0.6")
ggplot(data=low_vr, aes(x=VR, y=donate, color=HMR)) + geom_boxplot(alpha=0.5, outlier.size=0) + ylab("Final Symbiont Interaction Value") + xlab("Vertical Transmission Rate") + theme(panel.background = element_rect(fill='white', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + guides(fill=FALSE) +ylim(-1,1) + scale_color_manual(name="Horizontal\nTransmission\nMutation Rate", values=viridis(5))


#Low and medium HTMR 
low_htmr <- subset(symbiont_final, HMR<"HMR0.9")
labelForX <- c("10%", "20%", "30%", "40%", "50%", "60%", "70%", "80%", "90%", "100%")
labelForLeg = c("10%", "50%")


ggplot(data=low_htmr, aes(x=VR, y=donate, color=HMR)) + geom_boxplot(alpha=0.5, outlier.size=0) + ylab("Final Mean Symbiont Interaction Value") + xlab("Vertical Transmission Rate") + theme(panel.background = element_rect(fill='white', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), legend.position = c(0.87, 0.25)) + guides(fill=FALSE) +ylim(-1,1) + scale_color_manual(name="Horizontal\nTransmission\nMutation Rate", values=viridis(3), labels = labelForLeg) +  scale_x_discrete(labels= labelForX)

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
wilcox.test(hmr01VR05$donate, hmr05VR05$donate)

hmr01VR06 <- subset(subset(low_htmr, HMR=="HMR0.1"), VR=="VR0.6")
hmr05VR06 <- subset(subset(low_htmr, HMR=="HMR0.5"), VR=="VR0.6")
wilcox.test(hmr01VR06$donate, hmr05VR06$donate)

hmr01VR07 <- subset(subset(low_htmr, HMR=="HMR0.1"), VR=="VR0.7")
hmr05VR07 <- subset(subset(low_htmr, HMR=="HMR0.5"), VR=="VR0.7")
wilcox.test(hmr01VR07$donate, hmr05VR07$donate)

#High HTMR

low_vr = subset(symbiont_final, VR<"VR0.6")

ggplot(data=low_vr, aes(x=VR, y=donate, color=HMR)) + geom_boxplot(alpha=0.5, outlier.size=0) + ylab("Final Symbiont Resource Behavior Value") + xlab("Vertical Transmission Rate") + theme(panel.background = element_rect(fill='white', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + guides(fill=FALSE) +ylim(-1,1) + scale_color_manual(name="Horizontal\nTransmission\nMutation Rate", values=viridis(4))

#Efficiency Plots
initial_data <- read.table("munged_efficiency.dat", h=T)
vt30 <- subset(initial_data, VR=="VR0.3")

ggplot(data=initial_data, aes(x=update, y=efficiency, group=HMR, colour=HMR))  + ylab("Symbiont Efficiency Value") + xlab("Updates") + stat_summary(aes(color=HMR, fill=HMR),fun.data="mean_cl_boot", geom=c("smooth"), se=TRUE) + theme(panel.background = element_rect(fill='white', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + guides(fill="none") +scale_colour_manual(name="Horizontal\nTransmission\nMutation Rate",values=viridis(3)) + scale_fill_manual(values=viridis(3)) + facet_wrap(~VR)

ggplot(data=vt30, aes(x=update, y=efficiency, group=HMR, colour=HMR))  + ylab("Symbiont Efficiency Value") + xlab("Updates") + stat_summary(aes(color=HMR, fill=HMR),fun.data="mean_cl_boot", geom=c("smooth"), se=TRUE) + theme(panel.background = element_rect(fill='white', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + guides(fill="none") +scale_colour_manual(name="Horizontal\nTransmission\nMutation Rate",values=viridis(3)) + scale_fill_manual(values=viridis(3)) + facet_wrap(~rep)



#Stacked Histograms High HTMR 30% VT Investigation
require(ggplot2)
tenhelix <- c("#891901", "#B50142", "#D506AD", "#AB08FF", "#5731FD", "#4755FF", "#86E9FE", "#B2FCE3", "#D4FFDD", "#EFFDF0")

initial_sweep <- read.table("12.17.2021-HorizMutSweep/munged_histogram_sym.dat", h=T)
histo_90_95 <- read.table("12.23.2021-HTMR90_95/munged_histogram_sym.dat", h=T)
first_try <- rbind(initial_sweep, histo_90_95)


neg1_9 <- cbind(subset(first_try, interval=="-1_-.9"), Interaction_Rate="-1 to -0.8 (Parasitic)")
neg9_8 <- cbind(subset(first_try, interval=="-.9_-.8"), Interaction_Rate="-1 to -0.8 (Parasitic)")
neg8_7 <- cbind(subset(first_try, interval=="-.8_-.7"), Interaction_Rate="-0.8 to -0.6 (Parasitic)")
neg7_6 <- cbind(subset(first_try, interval=="-.7_-.6"), Interaction_Rate="-0.8 to -0.6 (Parasitic)")
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

combined$Interaction_Rate <- factor(combined$Interaction_Rate, levels=c("-1 to -0.8 (Parasitic)", "-0.8 to -0.6 (Parasitic)", "-0.6 to -0.4 (Detrimental)", "-0.2 to 0 (Nearly Neutral)", "0 to 0.2 (Nearly Neutral)", "0.2 to 0.4 (Positive)", "0.4 to 0.6 (Positive)", "0.6 to 0.8 (Mutualistic)", "0.8 to 1.0 (Mutualistic)"))

temp <- aggregate(list(count = combined$count), list(update=combined$update, treatment=combined$treatment, Interaction_Rate=combined$Interaction_Rate), sum)

ggplot(temp, aes(update, count)) + geom_area(aes(fill=Interaction_Rate), position='stack') +ylab("Count of Symbionts with Phenotype") + xlab("Evolutionary time (in updates)") +scale_fill_manual("Interaction Rate\n Phenotypes",values=tenhelix) +facet_wrap(~treatment) + theme(panel.background = element_rect(fill='light grey', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + guides(fill=FALSE) + guides(fill = guide_legend()) + facet_wrap(~treatment)

#ggplot(temp, aes(update, count)) + geom_area(aes(fill=Interaction_Rate), position='stack') +ylab("Count of Hosts with Phenotype") + xlab("Evolutionary time (in updates)") +scale_fill_manual("Interaction Rate\n Phenotypes",values=tenhelix) +facet_wrap(~treatment) + theme(panel.background = element_rect(fill='light grey', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + guides(fill=FALSE) + guides(fill = guide_legend()) + facet_wrap(~treatment)

breakout <- subset(combined, treatment == "HMR0.5VR0.3")
#breakout<-subset(combined, treatment == "HMR1.0VR0.2")

temp <- aggregate(list(count = breakout$count), list(update=breakout$update, rep=breakout$rep, Interaction_Rate=breakout$Interaction_Rate), sum)

ggplot(temp, aes(update, count)) + geom_area(aes(fill=Interaction_Rate), position='stack') +ylab("Count of Symbionts with Phenotype") + xlab("Evolutionary time (in updates)") +scale_fill_manual("Interaction Rate\n Phenotypes",values=tenhelix) +facet_wrap(~rep) + theme(panel.background = element_rect(fill='light grey', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + guides(fill=FALSE) + guides(fill = guide_legend()) + facet_wrap(~rep)

#ggplot(temp, aes(update, count)) + geom_area(aes(fill=Interaction_Rate), position='stack') +ylab("Count of Hosts with Phenotype") + xlab("Evolutionary time (in updates)") +scale_fill_manual("Interaction Rate\n Phenotypes",values=tenhelix) +facet_wrap(~rep) + theme(panel.background = element_rect(fill='light grey', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + guides(fill=FALSE) + guides(fill = guide_legend()) + facet_wrap(~rep)

#Shortened timelines

short<-subset(temp, update<5000)

ggplot(short, aes(update, count)) + geom_area(aes(fill=Interaction_Rate), position='stack') +ylab("Count of Symbionts with Phenotype") + xlab("Evolutionary time (in updates)") +scale_fill_manual("Interaction Rate\n Phenotypes",values=tenhelix) +facet_wrap(~rep) + theme(panel.background = element_rect(fill='light grey', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + guides(fill=FALSE) + guides(fill = guide_legend()) + facet_wrap(~rep)

#ggplot(short, aes(update, count)) + geom_area(aes(fill=Interaction_Rate), position='stack') +ylab("Count of Hosts with Phenotype") + xlab("Evolutionary time (in updates)") +scale_fill_manual("Interaction Rate\n Phenotypes",values=tenhelix) +facet_wrap(~rep) + theme(panel.background = element_rect(fill='light grey', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + guides(fill=FALSE) + guides(fill = guide_legend()) + facet_wrap(~rep)

#Zoom in further
histo_90_95 <- read.table("12.23.2021-HTMR90_95/munged_histogram_sym.dat", h=T)
histo_90_95$interval <- factor(histo_90_95$interval, levels=c("-1_-.9", "-.9_-.8", "-.8_-.7", "-.7_-.6", "-.6_-.5", "-.5_-.4", "-.4_-.3", "-.3_-.2", "-.2_-.1", "-.1_0", "0_.1", ".1_.2", ".2_.3", ".3_.4", ".4_.5", ".5_.6", ".6_.7", ".7_.8", ".8_.9", ".9_1"))
breakout <- subset(subset(histo_90_95, treatment == "HMR0.9VR0.3"), update<=2000)
host_sweep <- read.table("12.23.2021-HTMR90_95/munged_histogram_host.dat", h=T)
host_sweep$interval <- factor(host_sweep$interval, levels=c("-1_-.9", "-.9_-.8", "-.8_-.7", "-.7_-.6", "-.6_-.5", "-.5_-.4", "-.4_-.3", "-.3_-.2", "-.2_-.1", "-.1_0", "0_.1", ".1_.2", ".2_.3", ".3_.4", ".4_.5", ".5_.6", ".6_.7", ".7_.8", ".8_.9", ".9_1"))
host_breakout <- subset(subset(host_sweep, treatment == "HMR0.9VR0.3"), update<=2000)




sym_temp <- aggregate(list(count = breakout$count), list(update=breakout$update, rep=breakout$rep, interval=breakout$interval, partner=breakout$partner), sum)
host_temp <- aggregate(list(count = host_breakout$count), list(update=host_breakout$update, rep=host_breakout$rep, interval=host_breakout$interval, partner=host_breakout$partner), sum)

host31 <- subset(host_temp, rep==31)
sym31 <- subset(sym_temp, rep==31)
rep31 <- rbind(host31, sym31)

#ggplot(temp, aes(update, count)) + geom_area(aes(fill=interval), position='stack') +ylab("Count of Symbionts with Phenotype") + xlab("Evolutionary time (in updates)") +scale_fill_manual("Interaction Rate\n Phenotypes",values=turbo(20)) +facet_wrap(~rep) + theme(panel.background = element_rect(fill='light grey', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + guides(fill=FALSE) + guides(fill = guide_legend()) + facet_wrap(~rep)
ggplot(rep31, aes(update, count)) + geom_area(aes(fill=interval), position='stack') +ylab("Count of Organisms with Phenotype") + xlab("Evolutionary time (in updates)") +scale_fill_manual("Interaction Rate\n Phenotypes",values=turbo(20)) +facet_wrap(~rep) + theme(panel.background = element_rect(fill='white', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + guides(fill=FALSE) + guides(fill = guide_legend()) + facet_wrap(~partner,ncol=1) + geom_vline(xintercept = 1700)

#ggplot(temp, aes(update, count)) + geom_area(aes(fill=interval), position='stack') +ylab("Count of Hosts with Phenotype") + xlab("Evolutionary time (in updates)") +scale_fill_manual("Interaction Rate\n Phenotypes",values=turbo(20)) +facet_wrap(~rep) + theme(panel.background = element_rect(fill='light grey', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + guides(fill=FALSE) + guides(fill = guide_legend()) + facet_wrap(~rep)


#Extra code
ggplot(data=low_htmr, aes(x=VR, y=donate, fill=HMR)) + geom_violin(draw_quantiles = c(0.25, 0.5, 0.75)) + theme(panel.background = element_rect(fill='white', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + guides(fill=FALSE) +ylim(-1,1) +  ylab("Final Symbiont Resource Behavior Value") + xlab("Treatment")

ggplot(data=symbiont_final, aes(x=treatment, y=donate, fill=treatment)) + geom_boxplot(alpha=0.5, outlier.size=0) + ylab("Final Symbiont Resource Behavior Value") + xlab("Treatment") + geom_jitter(height = 0, width = 0.1) + theme(panel.background = element_rect(fill='white', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + guides(fill=FALSE) +ylim(-1,1) + scale_fill_manual(values=viridis(3))

ggplot(data=symbiont, aes(x=update, y=donate, group=HMR, colour=HMR)) + labs(title=("By Vertical Transmission Rate")) + ylab("Symbiont Resource Behavior Value") + xlab("Updates") + stat_summary(aes(color=HMR, fill=HMR),fun.data="mean_cl_boot", geom=c("smooth"), se=TRUE) + theme(panel.background = element_rect(fill='white', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + guides(fill="none") +scale_colour_manual(name="Horizontal\nTransmission\nMutation Rate",values=viridis(3)) + scale_fill_manual(values=viridis(3)) +ylim(-1,1) + facet_wrap(~VR)

ggplot(data=symbiont_final, aes(x=treatment, y=donate)) + geom_violin(draw_quantiles = c(0.25, 0.5, 0.75)) + geom_jitter(height = 0, width = 0.1) + theme(panel.background = element_rect(fill='white', colour='black')) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + guides(fill=FALSE) +ylim(-1,1) +  ylab("Final Symbiont Resource Behavior Value") + xlab("Treatment")


citation("viridis")



