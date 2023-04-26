# perf Usage

`perf` is a Linux profiler, it is an event-oriented observability tool.

It can help us to solve advanced performance and troubleshooting functions.


## It can answer questions

1. Why is the kernel on-CPU so much? What code-paths?
    Why the kernel of an operating system is using a significant amount of CPU time, and which 
    parts of the kernel code are responsible for this usage?
2. Which code-paths are causing CPU level 2 cache misses?
    Identifying the specific code-paths that are causing CPU level 2 cache misses requires 
    profiling the application or kernel code to measure cache performance and identify which parts 
    of the code are causing cache misses.
3. Are the CPUs stalled on memory I/O?
    "CPUs stalled on memory I/O" means that the CPU is waiting for data to be loaded from or 
    stored to memory, and cannot perform any other operations during this time. Memory input/output
    (I/O) operations include operations such as reading data from RAM, writing data to RAM, or 
    accessing data from external devices.
4. Which code-paths are allocating memory, and how much?
5. What is triggering TCP retransmits?
6. Is a certain kernel function being called, and how often?
7. What reasons are threads leaving the CPU?
    When a thread is running on a CPU, it is said to be "on-CPU." However, at some point, the 
    thread may "leave the CPU" and allow another thread to run. This can happen for various 
    reasons, such as the thread blocking on I/O, waiting for a resource, or yielding the CPU 
    voluntarily.
    Threads can leave the CPU for various reasons, such as:
    a. Blocking I/O operations: If a thread is waiting for input/output (I/O) operations to 
        complete, it may voluntarily yield the CPU to other threads to continue processing.
    b. Sleep or wait operations: Threads may need to wait for certain events or signals, such as 
        synchronization primitives or timers. During this time, the thread may leave the CPU and 
        let other threads continue executing.
    c. Context switches: A thread may be preempted by the scheduler to allow other threads with 
        higher priority to run.
    d. Resource contention: If multiple threads are contending for the same resources, such as 
        locks or shared memory, some threads may have to wait for the resources to become available.
    e. Garbage collection: If the program is using a garbage collector, threads may leave the CPU 
        to allow the garbage collector to reclaim unused memory.


## Basic Workflow

1. list -> find events
2. stat -> count them
3. record -> write event data to file
4. report -> browse summary
5. script -> event dump for post processing

### Example

1. `perf list sched:\*` -> found an event of interest

2. `perf stat -e sched:sched_process_exec -a -- sleep 10`

Check the frequency of it, e.g. 10 per 10 sec is a very low rate so it is safe to record.

3. `perf record -e sched:sched_process_exec -a -g -- sleep 10`

Capture samples.

4. `perf report -n --stdio`

Summary style may be sufficient, or

5. `perf script`

## perf stat/record Format

- These have three main parts: action, event, scope
- e.g., profiling on-CPU stack traces:
```
perf record -F 99 -a -g -- sleep 10
        |     |    |
        |     |   Scope: all CPUs
        |   Event: 99 Hertz
    Action: record stack traces
```
Note: sleep 10 is a dummy command to set the duration

### perf Actions

- Count events(perf stat ...)
- Sample event(perf record ...)
- Others:
    - List events
    - Report
    - Dump a perf.data file as text(perf script)
    - top style profiling(perf top)

### perf Events

- Custom timers
    - e.g., 99 Hertz (samples per second)
- Hardware events
- Tracepoints
- Dynamic tracing

![Linux perf Event Sources](./perf_events_map.png)

### perf Scope

- System-wide: all CPUs(-a)
- Traget PID(-p PID)
- Target command
- Specific CPUs(-c ...)
- User-level only(<event>:u)
- Kernel-level only(<event>:k)
- A custom filter to match variables(--filter ...)
- This cgroup(container) only(--cgrout ...)
