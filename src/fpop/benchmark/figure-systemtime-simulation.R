works_with_R("3.1.1", dplyr="0.2", directlabels="2014.6.13", ggplot2="1.0")

load("systemtime.simulation.RData")

algo.colors <-
  c(pDPA="#1B9E77", pelt="#D95F02", fpop="#7570B3", binseg="#E7298A",
    "#66A61E", "#E6AB02",  "#A6761D", "#666666")

refs <- data.frame(unit=c("1 second", "1 minute"),
                   seconds=c(1, 60),
                   vjust=c(-0.5, 1.5))
timings <- systemtime.simulation %.%
  mutate(models=ifelse(algorithm %in%
           c("fpop", "pelt"),
           "one", "several"))
counts <- table(timings$algorithm)
tit <-
  paste(length(counts), "algorithms on",
        counts[1],
        "simulated segmentation problems (system.time)")
with.leg <-
  ggplot()+
  geom_hline(aes(yintercept=seconds), data=refs)+
  geom_text(aes(1, seconds, label=unit, vjust=vjust),
            data=refs, size=4)+
  geom_point(aes(Ktrue, seconds, color=algorithm),
             data=timings, pch=1)+
  scale_color_manual(values=algo.colors)+
  theme_grey()+
  scale_x_log10("number of true of changes",
                breaks=10^seq(0, 5, by=1),
                limits=c(0.05, 1e4),
                minor_breaks=NULL)+
  scale_y_log10("seconds",
                minor_breaks=NULL,
                breaks=10^seq(-3, 3, by=1))

pos.method <-
 list("first.points",
      "calc.boxes",
      ##dl.trans(x=max(x)),
      dl.trans(h=h*3/2, x=x-0.1),
      "calc.borders",
      ##"draw.rects",
      qp.labels("y","bottom","top",make.tiebreaker("x","y"),ylimits))

dl <- direct.label(with.leg, pos.method)

pdf("figure-systemtime-simulation-small.pdf", h=3, w=3.5)
print(dl)
dev.off()

with.leg <-
  ggplot()+
  geom_hline(aes(yintercept=seconds), data=refs)+
  geom_text(aes(10^4, seconds, label=unit, vjust=vjust),
            data=refs, hjust=1)+
  geom_point(aes(Ktrue, seconds, color=algorithm,
                 shape=models),
             data=timings)+
  scale_shape_manual(values=c(one=1, several=19))+
  scale_color_manual(values=algo.colors)+
  theme_grey()+
  scale_x_log10("number of true of changes",
                breaks=10^seq(0, 5, by=1),
                limits=c(0.5, 1e4),
                minor_breaks=NULL)+
  scale_y_log10("seconds",
                minor_breaks=NULL,
                breaks=10^seq(-3, 3, by=1))+
  ggtitle(tit)

pos.method <-
 list("first.points",
      "calc.boxes",
      ##dl.trans(x=max(x)),
      dl.trans(h=h*3/2, x=x-0.1),
      "calc.borders",
      ##"draw.rects",
      qp.labels("y","bottom","top",make.tiebreaker("x","y"),ylimits))

dl <- direct.label(with.leg, pos.method)

pdf("figure-systemtime-simulation.pdf")
print(dl)
dev.off()


