works_with_R("3.1.1", dplyr="0.2", directlabels="2014.6.13", ggplot2="1.0",
             reshape2="1.2.2")

load("microbenchmark.arrays.RData")
load("systemtime.arrays.RData")

refs <- data.frame(unit=c("1 second","1 minute"),
                   seconds=c(1, 60))
small.refs <- refs[1,]

algo.colors <-
  c(pDPA="#1B9E77", pelt="#D95F02", fpop="#7570B3", binseg="#E7298A",
    "#66A61E", "#E6AB02",  "#A6761D", "#666666")

u <- unique(systemtime.arrays[, c("pid.chr", "probes")])
rownames(u) <- u$pid.chr
expr2algo <- c(fpop="fpop", pelt="pelt", multiBinSeg="binseg")
joined <- inner_join(microbenchmark.arrays, u) %.%
  mutate(seconds=time/1e9,
         algorithm=expr2algo[expr])
stopifnot(nrow(joined) == nrow(microbenchmark.arrays))
seconds.stats <- joined %.%
  group_by(pid.chr, probes, expr, algorithm) %.%
  summarise(mad=mad(seconds),
            q25=quantile(seconds, 0.25),
            median=median(seconds),
            q75=quantile(seconds, 0.75))
probes.stats <- joined %.%
  group_by(probes, algorithm) %.%
  summarise(mad=mad(seconds),
            upper.quartile=quantile(seconds, 0.99),
            median=median(seconds),
            q05=quantile(seconds, 0.05),
            min=min(seconds),
            max=max(seconds)) %.%
  mutate(what="inliers [min, q99]")
joined.stats <- inner_join(joined, probes.stats) %.%
  filter(seconds > upper.quartile)
seconds.wide <-
  data.frame(fpop=filter(seconds.stats, expr=="fpop"),
             pelt=filter(seconds.stats, expr=="pelt"),
             binseg=filter(seconds.stats, expr=="multiBinSeg"))
stopifnot(with(seconds.wide, mean(fpop.pid.chr==pelt.pid.chr)) == 1)

br <- 10^((-4):0)
ref.color <- "red"
labfun <- function(x)sprintf("%.4f", x)
pelt <- 
ggplot()+
  geom_rect(aes(xmin=0, ymin=0,
                xmax=0.01, ymax=0.01),
            fill="violet", alpha=1/2)+
  geom_point(aes(pelt.median, fpop.median),
             data=seconds.wide, pch=1)+
  ## geom_segment(aes(pelt.q25, fpop.median,
  ##                  xend=pelt.q75, yend=fpop.median),
  ##              data=seconds.wide)+
  ## geom_segment(aes(pelt.median, fpop.q25,
  ##                  xend=pelt.median, yend=fpop.q75),
  ##              data=seconds.wide)+
  geom_segment(aes(pelt.median-pelt.mad, fpop.median,
                   xend=pelt.median+pelt.mad, yend=fpop.median),
               data=seconds.wide)+
  geom_segment(aes(pelt.median, fpop.median-fpop.mad,
                   xend=pelt.median, yend=fpop.median+fpop.mad),
               data=seconds.wide)+
  coord_equal()+
  geom_hline(aes(yintercept=seconds),
             data=small.refs, color=ref.color)+
  geom_vline(aes(xintercept=seconds),
             data=small.refs, color=ref.color)+
  ## geom_text(aes(seconds, -0.5, label=unit),
  ##            data=small.refs, color=ref.color, angle=90, vjust=-0.5)+
  geom_text(aes(0.01, seconds, label=unit),
            data=small.refs, vjust=1.5, hjust=0, color=ref.color)+
  ggtitle(paste0("fpop faster than pelt for ", nrow(seconds.wide),
                 " tumor chromosome segmentation problems\n",
        "median +/- 1 absolute deviation over 100 trials (microbenchmark)"))+
  scale_x_log10("seconds to compute segmentation using pelt",
                minor_breaks=NULL,
                breaks=br, labels=labfun)+
  scale_y_log10("seconds to compute segmentation using fpop",
                minor_breaks=NULL,
                breaks=br, labels=labfun)+
  geom_abline()+
  theme_grey()+
  geom_text(aes(0.1, 0.001, label=paste("microbenchmark accurate",
                              "for small times", sep="\n")),
            color="violet")
pdf("figure-microbenchmark-arrays-fpop-pelt.pdf")
print(pelt)
dev.off()

labfun <- function(x)sprintf("%.4f", x)
binseg <- 
ggplot()+
  geom_rect(aes(xmin=0, ymin=0,
                xmax=0.01, ymax=0.01),
            fill="violet", alpha=1/2)+
  geom_point(aes(binseg.median, fpop.median),
             data=seconds.wide, pch=1)+
  geom_segment(aes(binseg.median-binseg.mad, fpop.median,
                   xend=binseg.median+binseg.mad, yend=fpop.median),
               data=seconds.wide)+
  geom_segment(aes(binseg.median, fpop.median-fpop.mad,
                   xend=binseg.median, yend=fpop.median+fpop.mad),
               data=seconds.wide)+
  coord_equal()+
  geom_hline(aes(yintercept=seconds),
             data=small.refs, color=ref.color)+
  geom_vline(aes(xintercept=seconds),
             data=small.refs, color=ref.color)+
  ## geom_text(aes(seconds, -0.5, label=unit),
  ##            data=small.refs, color=ref.color, angle=90, vjust=-0.5)+
  geom_text(aes(0.01, seconds, label=unit),
            data=small.refs, vjust=1.5, hjust=0, color=ref.color)+
  ggtitle(paste0("fpop same speed as binseg for ", nrow(seconds.wide),
                 " tumor chromosome segmentation problems\n",
        "median +/- 1 absolute deviation over 100 trials (microbenchmark)"))+
  scale_x_log10("seconds to compute segmentation using binseg",
                minor_breaks=NULL,
                breaks=br, labels=labfun)+
  scale_y_log10("seconds to compute segmentation using fpop",
                minor_breaks=NULL,
                breaks=br, labels=labfun)+
  geom_abline()+
  theme_grey()+
  geom_text(aes(0.1, 0.001, label=paste("microbenchmark accurate",
                              "for small times", sep="\n")),
            color="violet")
pdf("figure-microbenchmark-arrays-fpop-binseg.pdf", w=8)
print(binseg)
dev.off()

with.leg <- ggplot()+
  geom_point(aes(probes, median, color=algorithm),
             data=seconds.stats, pch=1)+
  geom_segment(aes(probes, median-mad, xend=probes, yend=median+mad,
                   color=algorithm),
               data=seconds.stats)+
  coord_equal()+
  scale_x_log10("number of data points to segment",
                limits=c(25, 5000), minor_breaks=NULL,
                breaks=c(range(seconds.stats$probes), 100, 1000))+
  scale_y_log10("seconds", breaks=10^seq(-5, 0, by=1), minor_breaks=NULL)+
  scale_color_manual("algorithm", values=algo.colors)+
  geom_hline(aes(yintercept=seconds),
             data=small.refs)+
  geom_text(aes(1e2, seconds, label=unit),
            data=small.refs, vjust=1.5, hjust=0)+
  theme_grey()+
  ggtitle(paste0(nrow(seconds.wide),
                " tumor chromosome segmentation problems\n",
             "median +/- 1 absolute devation over 100 timings (microbenchmark)"))
pos.method <-
  list("last.points",
       "calc.boxes",
       dl.trans(h=h*3/2, x=x+0.1),
       "calc.borders",
       ##"draw.rects",
       qp.labels("y","bottom","top",make.tiebreaker("x","y"),ylimits))

dl <- direct.label(with.leg, pos.method)
png("figure-microbenchmark-arrays-median.png", h=10, w=7, units="in", res=100)
print(dl)
dev.off()

dl <- 
ggplot()+
  geom_ribbon(aes(probes, ymin=min, ymax=upper.quartile, fill=algorithm),
              ##color="black", size=1/4,
              data=probes.stats, alpha=1/2)+
  geom_line(aes(probes, median, group=algorithm),
            data=probes.stats, size=2)+
  geom_line(aes(probes, median, color=algorithm),
            data=probes.stats, size=1)+
  geom_point(aes(probes, seconds, color=algorithm),
            data=data.frame(joined.stats, what="outliers >q99"), pch=1)+
  coord_equal()+
  scale_x_log10("number of data points to segment",
                limits=c(25, 5000), minor_breaks=NULL,
                breaks=c(range(seconds.stats$probes), 100, 1000))+
  scale_y_log10("seconds", breaks=10^seq(-5, 0, by=1), minor_breaks=NULL)+
  scale_color_manual("algorithm", values=algo.colors)+
  scale_fill_manual("algorithm", values=algo.colors)+
  geom_hline(aes(yintercept=seconds),
             data=small.refs)+
  geom_text(aes(1e2, seconds, label=unit),
            data=small.refs, vjust=1.5, hjust=0)+
  theme_bw()+
  facet_grid(. ~ what)+
  theme(panel.margin=grid::unit(0, "cm"))+
  ggtitle(paste0(nrow(seconds.wide),
                " tumor chromosome segmentation problems\n",
                "100 timings for each problem (microbenchmark)"))+
  guides(fill="none", color="none")+
  geom_dl(aes(probes, median, label=algorithm, color=algorithm),
          data=probes.stats, method=pos.method)
png("figure-microbenchmark-arrays-bands.png", h=8, w=7, units="in", res=100)
print(dl)
dev.off()

with.leg <- ggplot()+
  ## geom_line(aes(probes, seconds, color=algorithm, group=pid.chr),
  ##           data=joined, pch=1)+
  geom_point(aes(probes, seconds, color=algorithm),
            data=joined, pch=1)+
  coord_equal()+
  scale_x_log10("number of data points to segment",
                limits=c(25, 5000), minor_breaks=NULL,
                breaks=c(range(seconds.stats$probes), 100, 1000))+
  scale_y_log10("seconds", breaks=10^seq(-5, 0, by=1), minor_breaks=NULL)+
  scale_color_manual("algorithm", values=algo.colors)+
  geom_hline(aes(yintercept=seconds),
             data=small.refs)+
  geom_text(aes(1e2, seconds, label=unit),
            data=small.refs, vjust=1.5, hjust=0)+
  theme_grey()+
  ggtitle(paste0(nrow(seconds.wide),
                " tumor chromosome segmentation problems\n",
                "100 timings for each problem (microbenchmark)"))
dl <- direct.label(with.leg, pos.method)
png("figure-microbenchmark-arrays.png", h=10, w=7, units="in", res=100)
print(dl)
dev.off()
