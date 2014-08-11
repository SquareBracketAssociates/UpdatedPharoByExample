

##The Smalltalk object model

<a name="cha:model"></a>

Smalltalk's programming model is simple and uniform: everything is an object, and objects communicate only by sending each other messages\.
However, this simplicity and uniformity can be a source of difficulty for programmers used to other languages\. In this chapter we present the core concepts of the Smalltalk object model; in particular we discuss the consequences of representing classes as objects\.



###1\. The rules of the model

<a name="sec:rules"></a>

The Smalltalk object model is based on a set of simple
rules that are applied *uniformly*\. The rules are as follows:



-  **Rule 1**\. Everything is an object\.
-  **Rule 2**\. Every object is an instance of a class\.
-  **Rule 3**\. Every class has a superclass\.
-  **Rule 4**\. Everything happens by sending messages\.
-  **Rule 5**\. Method lookup follows the inheritance chain\.



Let us look at each of these rules in some detail\.




###2\. Everything is an Object



The mantra *everything is an object* is highly contagious\.
After only a short while working with Smalltalk, you will start to be surprised at how this rule simplifes everything you do\.
Integers, for example, are truly objects, so you can send messages to them, just as you do to any other object\.



```smalltalk
3 + 4            --> 7    "send '+ 4' to 3, yielding 7"
20 factorial  --> 2432902008176640000   "send factorial, yielding a big number"
```



The representation of `20 factorial` is certainly different from the representation of `7`, but because they are both objects, none of the code ,not even the implementation of `factorial`, needs to know about this\.


Perhaps the most fundamental consequence of this rule is the following:
&nbsp;<p class="important">**Classes are objects too\.**</p>Furthermore, classes are not second\-class objects: they are really first\-class objects that you can send messages to, inspect, and so on\.
This means that Pharo is a truly reflective system, which gives a great deal of expressive power to developers\.

Deep in the implementation of Smalltalk, there are three different kinds of objects\.  There are \(1\) ordinary objects with instance variables that are passed by references, there are \(2\) *small integers* that are passed by value, and there are \(3\) indexable objects like arrays that hold a contiguous portion of memory\.  The beauty of Smalltalk is that you normally don't need to care about the differences between these three kinds of object\.



###3\. Every object is an instance of a class



Every object has a class; you can find out which by sending it the message `class`\.



```smalltalk
1 class                 --> SmallInteger
20 factorial class --> LargePositiveInteger
'hello' class          --> ByteString
#(1 2 3) class       --> Array
(4@5) class         --> Point
Object new class --> Object
```



A class defines the *structure* of its instances via instance variables,
and the *behavior* of its instances via methods\.
Each method has a name, called its *selector*, which is unique within the class\.

Since *classes are objects*, and *every object is an instance of a class*, it follows that classes must also be instances of classes\.
A class whose instances are classes is called a *metaclass*\.
Whenever you create a class, the system automatically creates a metaclass for you\.
The metaclass defines the structure and behavior of the class that is its instance\.
99%  of the time you will not need to think about metaclasses, and may happily ignore them\.
\(We will have a closer look at metaclasses in Chapter 13\)



####3\.1\. Instance variables


Instance variables in Smalltalk are private to the *instance* itself\.
This is in contrast to Java and C\+\+, which allow instance variables \(also known as *fields* or *member variables*\) to be accessed by any other instance that happens to be of the same class\. We say that the *encapsulation boundary* of objects in Java and C\+\+ is the class, whereas in Smalltalk it is the instance\.


In Smalltalk, two instances of the same class cannot access each other's instance variables unless the class defines *accessor methods*\.There is no language syntax that provides direct access to the instance variables of any other object\.\(Actually, a mechanism called reflection does provide a way to ask another object for the values of its instance variables; meta\-programming is intended for writing tools like the object inspector, whose sole purpose is to look inside other objects\.\)

Instance variables can be accessed by name in any of the instance methods of the class that defines them, and also in the methods defined in its subclasses\. This means that Smalltalk instance variables are similar to *protected* variables in C\+\+ and Java\. However, we prefer to say that they are private, because it is considered bad style in Smalltalk to access an instance variable directly from a subclass\.



#####3\.1\.1\. Example

Method `Point>>dist:` computes the distance between the receiver and another point\. The instance variables `x` and `y` of the receiver are accessed directly by the method body\.  However, the instance variables of the other point must be accessed by sending it the messages `x` and `y`\.




```smalltalk
Point>>>dist: aPoint
    "Answer the distance between aPoint and the receiver."
    | dx dy |
    dx := aPoint x - x.
    dy :=  aPoint y - y.
    ^ ((dx * dx) + (dy * dy)) sqrt
```





```smalltalk
1@1 dist: 4@5 --> 5.0
```



The key reason to prefer instance\-based encapsulation to class\-based encapsulation is that it enables different implementations of the same abstraction to coexist\. For example, method `point>>>dist:`, need not know or care whether the argument `aPoint` is an instance of the same class as the receiver\.  The argument object might be represented in polar coordinates, or as a record in a database, or on another computer in a distributed system; as long as it can respond to the messages `x` and `y`, the code in mthref\{dist:\} will still work\.



####3\.2\. Methods


All methods are public\.footnote\{Well, almost all\.  In Pharo, methods whose selectors start with the string `pvt` are private: a `pvt` message can be sent *only* to self\.  However, `pvt` methods are not used very much\.\}
Methods are grouped into protocols that indicate their intent\.
Some common protocol names have been established by convention, for example, `accessing` for all accessor methods, and `initialization` for establishing a consistent initial state for the object\.
The protocol `private` is sometimes used to group methods that should not be seen from outside\.
Nothing, however, prevents you from sending a message that is implemented by such a *private* method\.

Methods can access all instance variables of the object\.
Some Smalltalk developers prefer to access instance variables only through accessors\.
This practice has some value, but it also clutters the interface of your classes, and worse, exposes private state to the world\.



####3\.3\. The instance side and the class side


Since classes are objects, they can have their own instance variables and their own methods\.
We call these *class instance variables* and *class methods*, but they are really no different from ordinary instance variables and methods:
class instance variables are just instance variables defined by a metaclass, and class methods are just methods defined by a metaclass\.




A class and its metaclass are two separate classes, even though the former is an instance of the latter\.
However, this is largely irrelevant to you as a programmer: you are concerned with defining the behavior of your objects and the classes that create them\.

<a name="fig:Buttons"></a><figure><img src="figures/Color-Buttons.png" width="90%"></img><figcaption>Browsing a class and its metaclass</figcaption></figure>

For this reason, the browser  helps you to browse both class and metaclass as if they were a single thing with two *sides*: the *instance side* and the *class side*, as shown in Figure [3\.1](#fig:Buttons)\. Clicking
on the **instance** button browses the class `Color`, *i\.e\.*, you browse the methods that are executed when messages
are sent to an instance of `Color`, like the blue color\. Pressing the button\{class\} button browses the class `Color class`, *i\.e\.*, you see
the methods that will be executed when messages are sent to the class `Color` itself\.
For example, `Color blue` sends the message `blue` to the class `Color`\.
You will therefore find the method `blue` defined on the class side of `Color`, not on the instance side\.






```smalltalk
aColor := Color blue.               "Class side method blue"
aColor        --> Color blue
aColor red  --> 0.0         "Instance side accessor method red"
aColor blue --> 1.0        "Instance side accessor method blue"
```



You define a class by filling in the template proposed on the instance side\.
When you accept this template, the system creates not just the class that you defined, but also the corresponding metaclass\.
You can browse the metaclass by clicking on the **class** button\.
The only part of the metaclass creation template that makes sense for you to edit directly is the list of instance variable names\.

Once a class has been created, clicking the **instance** button lets you edit and browse the methods that will be possessed by instances of that class \(and of its subclasses\)\. For example, we can see in Figure [3\.1](#fig:Buttons) that the method `hue` is defined on instances of the class `Color`\.
In contrast, the ** button** lets you browse and edit the metaclass \(in this case `Color class`\)\.



####3\.4\. Class methods


Class methods can be quite useful; browse `Color class` for some good examples\.You will see that there are two kinds of method defined on a class: those that create instances of the class, like `Color class>>blue` and those that perform a utility function, like `Color class>>showColorCube`\. This is typical, although you will occasionally find class methods used in other ways\.

It is convenient to place utility methods on the class side because they can be executed without having to create any additional objects first\.
Indeed, many of them will contain a comment designed to make it easy to execute them\.

Browse method `Color class>>>showColorCube`, double\-click just inside the quotes on the comment `"Color showColorCube"` and type CMD\-D\.
You will see the effect of executing this method\.  \(Select menu\{World > restore display \(r\) to undo the effects\.\)

For those familiar with Java and C\+\+,  class methods may seem similar to static methods\. However, the uniformity of Smalltalk means that they are somewhat different: whereas Java static methods are really just statically\-resolved procedures, Smalltalk class methods are dynamically\-dispatched methods\.  This means that inheritance, overriding and super\-sends work for class methods in Smalltalk, whereas they don't work for static methods in Java\.



####3\.5\. Class instance variables

With ordinary instance variables, all the instances of a class have the same set of variable names, and the instances of its subclasses inherit those names; however, each instance has its own private set of values\.The story is exactly the same with class instance variables: each class has its own private class instance variables\.A subclass will inherit those class instance variables, *but it has its own private copies of those variables*\.Just as objects don't share instance variables, neither do classes and their subclasses share class instance variables\.

You could use a class instance variable called `count` to keep track of how many instances you create of a given class\.
However, any subclass would have its own `count` variable, so subclass instances would be counted separately\.

**Example: class instance variables are not shared with subclasses\.**

Suppose we define classes `Dog` and `Hyena`, where `Hyena` inherits the class instance variable `count` from `Dog`\.



```smalltalk
Object subclass: #Dog
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'PBE-CIV'

Dog class
    instanceVariableNames: 'count'

Dog subclass: #Hyena
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'PBE-CIV'
```



Now suppose we define class methods for `Dog` to initialize its `count` to `0`, and to increment it when new instances are created:


```smalltalk
Dog class>>>initialize
    super initialize.
    count := 0.

Dog class>>>new
    count := count +1.
    ^ super new

Dog class>>>count
    ^ count
```



Now when we create a new `Dog` its count is incremented, and so is that of every `Hyena`, but they are counted separately:


```smalltalk
Dog initialize.
Hyena initialize.
Dog count     --> 0
Hyena count --> 0
Dog new.
Dog count     --> 1
Dog new.
Dog count     --> 2
Hyena new.
Hyena count --> 1
```



Note also that class instance variables are private to a class in exactly the same way that instance variables are private to the instance\.
Since classes and their instances are different objects,
this has the following immediate consequences:
&nbsp;<p class="important">**A class does not have access to the instance variables of its own instances\.**</p>&nbsp;<p class="important">** An instance of a class does not have access to the class instance variables of its class\.**</p>For this reason, instance initialization methods must always be defined on the instance side, the class side has no access to instance variables, so cannot initialize them\!
All that the class can do is to send initialization messages, possibly using accessors, to newly created instances\.

Similarly, instances can only access class instance variables indirectly, by sending accessor messages to their class\.

Java has nothing equivalent to class instance variables\.
Java and C\+\+ static variables are more like Smalltalk class variables, which we will discuss in Section [¿?](#sec:classVars): all of the subclasses and all of their instances share the same static variable\.

**Example: Defining a Singleton\.**

The Singleton pattern provides a typical example of the use of class instance variables and class methods\.Imagine that we would like to implement a class `WebServer` and use the Singleton pattern to ensure that it has only one instance\.

Clicking on the **instance** button in the browser, we define the class `WebServer` as follow\.

**A singleton class
**

```smalltalk
Object subclass: #WebServer
    instanceVariableNames: 'sessions'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Web'
```



Then, clicking on the **class** button, we add the instance variable `uniqueInstance` to the class side\.

**The class side of the singleton class
**

```smalltalk
WebServer class
    instanceVariableNames: 'uniqueInstance'
```



The consequence of this is that the class `WebServer` now has another instance variable,in addition to the variables that it inherits, such as `superclass` and `methodDict`\.

We can now define a class method named `uniqueInstance` as shown in mthref\{uniqueInstance\}\.
This method first checks whether `uniqueInstance` has been initialized\.
If it has not, the method creates an instance and assigns it to the class instance variable `uniqueInstance`\.
Finally the value of `uniqueInstance` is returned\.
Since `uniqueInstance` is a class instance variable, this method can directly access it\.



<a name="uniqueInstance"></a>**uniqueInstance \(on the class side\)
**

```smalltalk
WebServer class>>>uniqueInstance
     uniqueInstance ifNil: [uniqueInstance := self new].
     ^ uniqueInstance
```



The first time that `WebServer uniqueInstance` is executed, an instance of the class `WebServer` will be created and assigned to the `uniqueInstance` variable\.The next time, the previously created instance will be returned instead of creating a new one\.

Note that the instance creation code inside the conditional in [3\.1](#uniqueInstance) is written as `self new` and not as `WebServer new`\.
What is the difference?   Since the `uniqueInstance` method is defined in `WebServer class`, you might think that they were the same\.    And indeed, until someone creates a subclass of `WebServer`, they are the same\.  But suppose that `ReliableWebServer` is a subclass of `WebServer`, and inherits the `uniqueInstance` method\.  We would clearly expect `ReliableWebServer uniqueInstance` to answer a `ReliableWebServer`:\. Using **self** ensures that this will happen, since it will be bound to the respective class\.
Note also that `WebServer` and `ReliableWebServer` will each have their own class instance variable called `uniqueInstance`\.  These two variables will of course have different values\.

































































































































































































