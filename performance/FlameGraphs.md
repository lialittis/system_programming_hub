# Flame Graphs

- x-axis: alphabetical stack sort, to maximize merging
- y-axis: stack depth
- color: random, or hue can be a dimension

## Simply

It is just a Perl program to conver perf stacks into SVG

## Details

A flame graph is a visualization technique that shows the distribution of CPU time across the call
stack of a program. To analyze a flame graph, you can follow these general steps:

1. Understand the basic structure of the flame graph: The flame graph consists of a series of 
horizontal bars that represent functions in the call stack, with the width of each bar indicating 
the amount of CPU time spent in that function. The bars are arranged vertically to show the call 
hierarchy, with the top bar representing the main function and the lower bars representing 
functions called by the main function.

2. Identify hotspots: Look for wide bars, which represent functions that consume a large amount of 
CPU time. These are the hotspots that you may want to investigate further to optimize performance.

3. Identify call paths: Follow the bars downward to trace the call path of the program. This can 
help you identify any unnecessary or redundant function calls that may be contributing to 
performance issues.

4. Filter out noise: You may see some very narrow bars that represent functions that were only 
called a few times or consumed a negligible amount of CPU time. These bars may not be useful for 
performance analysis, so you can filter them out to focus on the more significant functions.

5. Compare multiple flame graphs: You can create flame graphs for different runs of your program,
or for different parts of your program, and compare them to see how the call stack and CPU usage 
have changed. This can help you identify performance regressions or improvements.

6. Use additional tools: Flame graphs can be used in combination with other profiling tools and 
techniques, such as tracing or sampling, to get a more complete picture of program performance.

Overall, flame graphs can be a powerful tool for analyzing program performance and identifying 
hotspots and call paths. With practice and experience, you can develop an intuition for 
interpreting flame graphs and using them to optimize your code.
