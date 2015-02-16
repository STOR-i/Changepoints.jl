# Changepoints.jl

A Julia package for the detection of multiple changepoints in time series.

- Detection is based on optimising a cost function over segments of the data.
- Implementations of the most efficient DP based search algorithms (PELT , Binary Segmentation and FPOP (coming soon)).
- A wide choice of cost functions already implemented such as a change in mean/variance/mean and variance for Normal errors.
- Cost functions seperated in such a way that custom costs are simple to implement.

[see](http://arxiv.org/pdf/1101.1438.pdf)