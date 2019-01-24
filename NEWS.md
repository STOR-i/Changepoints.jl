# Version 0.3.1 (2019-01-24)
* Bug fix to CROPS function

# Version 0.3 (2018-10-26)
* Increased minimum Julia requirement to v0.7
* In specification of changepoint models in `@PELT`, `@BS`, `@segment_cost` macros, changing
  parameters should now be indicated with `:?` rather than `?`
* `CROPS` interface changed to `CROPS(seg_cost, n, pen1, pen2)` instead of `CROPS(seg_cost, n, (pen1, pen2))`
* Updated documentation, including new documentation for `@changepoint_sampler`

# Version 0.2
* Increased Julia requirement to v0.4
* Added support for Gadfly
* Fixed bugs in Binary Segmentation and changepoint sampler
