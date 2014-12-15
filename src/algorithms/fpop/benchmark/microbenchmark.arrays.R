works_with_R("3.1.1",
             microbenchmark="1.3.0",
             fpop="2014.7.16",
             changepoint="1.1.2")

### Run several algorithms to perform a more precise speed comparison
### using the microbenchmark package on just the short profiles:
### fpop/pelt/binary segmentation.

if(!file.exists("signal.list.RData")){
  u <- "http://cbio.ensmp.fr/~thocking/data/signal.list.RData"
  download.file(u, "signal.list.RData")
}
load("signal.list.RData")
load("pid.chr.pelt.fast.RData")

seg.funs <-
  list(cghseg.52=function(one.chrom){
    kmax <- min(52, nrow(one.chrom))
    with(one.chrom, run.cghseg(logratio, position, kmax))
  }, dnacopy.sd=function(one.chrom){
    probes <- nrow(one.chrom)
    cna <- with(one.chrom, {
      CNA(logratio, rep(1, probes), maploc=position)
    })
    sdvals <- sort(c(seq(20, 4, l = 20), 2^seq(2.5, -5, l = 10)[-1], 3, 0))
    for(param.i in seq_along(sdvals)){
      undo.SD <- sdvals[[param.i]]
      segment(cna, undo.SD=undo.SD, undo.splits="sdundo",
              verbose=0)
    }
  }, dnacopy.default=function(one.chrom){
    probes <- nrow(one.chrom)
    cna <- with(one.chrom, {
      CNA(logratio, rep(1, probes), maploc=position)
    })
    segment(cna, verbose=0)
  }, pelt.SIC=function(one.chrom){
    cpt.mean(one.chrom$logratio, method="PELT", penalty="Manual",
             pen.value=log(nrow(one.chrom)))
  }, fpop.SIC=function(one.chrom){
    Fpop(one.chrom$logratio, log(nrow(one.chrom)))
  },
## Segmentor gave a segfault:
## 1627 / 4467 44.19
## 1628 / 4467 57.19
## 1629 / 4467 64.19
## 1630 / 4467 67.19
## 1631 / 4467 123.19
## 1632 / 4467 145.19
## 1633 / 4467 162.19
## 1634 / 4467 173.19

##  *** caught segfault ***
## address (nil), cause 'unknown'

## Traceback:
##  1: .C("SegmentNormal", Size = as.integer(n2), KMax = as.integer(Kmax),     Data = as.double(dat), DataComp = as.integer(datasize), Breakpoints = as.integer(breaks),     Parameters = as.double(parameters), Likelihood = as.double(likelihood),     PACKAGE = "Segmentor3IsBack")
##  2: Segmentor.default(one.chrom$logratio, model = 2, Kmax = kmax)
##  3: Segmentor(one.chrom$logratio, model = 2, Kmax = kmax)
##  4: fun(one.chrom)
##  5: system.time({    fun(one.chrom)})
## aborting ...
## Segmentation fault (core dumped)
## make: *** [timings.RData] Error 139
## thocking@silene:~/breakpoints/webapp/applications-n
       
  ##      Segmentor3IsBack.52=function(one.chrom){
  ##   kmax <- min(52, nrow(one.chrom))
  ##   Segmentor(one.chrom$logratio, model=2, Kmax=kmax)
  ## },
       multiBinSeg.52=function(one.chrom){
    max.breaks <- min(51, nrow(one.chrom)-1) ## BREAKPOINTS not segments.
    multiBinSeg(one.chrom$logratio, max.breaks)
  })

## TODO: scatterplot pelt vs fpop (coord_equal). Expect pelt > fpop.
    
timings.microbenchmark <- NULL
for(pid.chr.i in seq_along(pid.chr.pelt.fast)){
  pid.chr <- pid.chr.pelt.fast[pid.chr.i]
  cat(sprintf("%4d / %4d %s\n", pid.chr.i, length(pid.chr.pelt.fast), pid.chr))
  one.chrom <- signal.list[[pid.chr]]
  these.timings <- microbenchmark(
    fpop={
    seg.funs$fpop.SIC(one.chrom)
  },
                                  pelt={
    seg.funs$pelt.SIC(one.chrom)
  },
                                  multiBinSeg={
    seg.funs$multiBinSeg.52(one.chrom)
  })
  timings.microbenchmark <- rbind(timings.microbenchmark, {
    data.frame(pid.chr, these.timings)
  })
}

save(microbenchmark.arrays, file="microbenchmark.arrays.RData")

