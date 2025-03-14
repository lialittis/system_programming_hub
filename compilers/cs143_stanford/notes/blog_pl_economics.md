# 编程语言的经济学 101

2020 年当我在 EPFL 交换的时候， 我的房东是一个 EPFL 的物理教授， 当他知道我是计算机专业并且用不同的编程语言的时候， 他问了我一个问题，“为什么我们需要这么多不同的编程语言”。 虽然当时我也并没有思考过这个非常“显然”的问题， 我凭借我对不同语言的理解， 从功能性和发展的角度胡乱解释了这个问题， 然后我便将其抛之脑后。

今天我在浏览 Stanford 的一门 Compilers 的课程的时候， 我看到了 Programming Language Economics 这个词， 让我重新理解了当初的那个问题。

实际上， 这个问题可以被扩展成为三个问题：

1. 为什么有这么多的不同的编程语言？

2. 为什么已经有这么多的语言， 还是不断有新的编程语言出现？

3. 什么样的编程语言算是一种好的编程语言？

## Language-need pairs

现实中， 我们的各种应用（硬件或软件）可能有着完全不同甚至互相冲突的功能或需求， 并不存在一种完美的语言， 可以同时满足所有的需求， 因此语言与应用需求之间的适配是非常重要的。

例如， 对于科学计算类的应用， 其核心需求为准确的浮点数计算、 更好的列表表达以及并行计算等， 在这种情况下， FORTRAN 的特点便非常适合此类应用； 而对于一些商业应用， 其对于 persistence、 数据库处理、 生成报告等需求， 促使了 SQL 的诞生和发展； 对于我最感兴趣的系统编程领域， 需要对资源的控制、

