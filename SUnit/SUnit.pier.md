,%````````````````````````````````=


##SUnit
<a name="chaSUnit"></a>


###1\. Introduction

SUnit is a minimal yet powerful framework that supports the creation and deployment of tests\.
As might be guessed from its name, the design of SUnit focussed on *Unit Tests*, but in fact it can be used for integration tests and functional tests as well\.
Sunit was originally developed by Kent Beck and subsequently extended by Joseph Pelrine and others to incorporate the notion of a resource, which we will describe in Section 7\.6\.



The interest in testing and Test Driven Development is not limited to Pharo or Smalltalk\.
Automated testing has become a hallmark of the ind\{Agile software development\} movement, and any software developer concerned with improving software quality would do well to adopt it\.
Indeed, developers in many languages have come to appreciate the power of unit testing, and versions of
*xUnit* now exist for many languages, including Java, Python, Perl, \.Net and Oracle\.

This chapter describes SUnit 3\.3 \(the current version as of this writing\); the official web site of SUnit is
sunit\.sourceforge\.net, where updates can be found\.

Neither testing, nor the building of test suites, is new: everybody knows that tests are a good way to catch errors\.
eXtreme Programming, by making testing a core practice and by emphasizing *automated* tests, has helped to make testing productive and fun, rather than a chore that programmers dislike\.
The Smalltalk community has a long tradition of testing because of the incremental style of development supported by its programming environment\.
In traditional Smalltalk development, the programmer would write tests in a workspace as soon as a method was finished\.
Sometimes a test would be incorporated as a comment at the head of the method that it exercised, or tests that needed some set up would be included as example methods in the class\.
The problem with these practices is that tests in a workspace are not available to other programmers who modify the code; comments and example methods are better in this respect, but there is still no easy way to keep track of them and to run them automatically\.
Tests that are not run do not help you to find bugs\!
Moreover, an example method does not inform the reader of the expected result:



###2\. Why testing is important
