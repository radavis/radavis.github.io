# mooc.fi: OOP with Java

[Course Progress](https://tmc.mooc.fi/participants/285858)

[Week 4](https://materiaalit.github.io/2013-oo-programming/part1/week-4/)
[Week 8](https://materiaalit.github.io/2013-oo-programming/part2/week-8/)

## Running code

```
# run single class
ant run -Dmain.class=SmartCombining

# run test suite
ant test
```

## Running Tests

```
# run test suite
ant test
```

Possible error:

```
-do-compile:
    [javac] Compiling 2 source files to /Users/rd/code/TMCProjects/mooc-2013-OOProgrammingWithJava-PART1/week4-072.1.YourFirstAccount/build/classes
    [javac] warning: [options] bootstrap class path not set in conjunction with -source 6
    [javac] error: Source option 6 is no longer supported. Use 7 or later.
    [javac] error: Target option 6 is no longer supported. Use 7 or later.
```

Update `nbproject/project.properties` lines:

```
javac.source=1.8
javac.target=1.8
```

Or, add source and target command line flags:

```
ant test -Djavac.source=1.8 -Djavac.target=1.8
```

```
# run single test file
ant test-single \
  -Djavac.source=1.8 \
  -Djavac.target=1.8 \
  -Djavac.includes=Hand.java \
  -Dtest.includes=HandTest.java

# run single test method
ant test-single-method \
  -Djavac.source=1.8 \
  -Djavac.target=1.8 \
  -Djavac.includes=Dictionary.java \
  -Dtest.includes=DictionaryTest.java \
  -Dtest.class=DictionaryTest \
  -Dtest.method=translateMethod
```


## Notes:

* Java is case-sensitive. `main()`, `Main()`, and `MAIN()` are calls to different methods.
* Statements must end with a semicolon `;`
* Primitive data type variables are **passed by value** to methods.
* Within methods, **objects are manipulated by reference**. The value of the memory
  location of that object is passed by value to a method.
* Strings are immutable; once created, they cannot be modified.
* "Good programmers write code that humans can understand." - Martin Fowler
* An **Interface** is used to define functionality that a class should implement.
  It contains method signatures, without implementation. Interfaces allow us to
  create a 'loose coupling' between classes. Examples:
    - List (implemented by ArrayList, LinkedList)
    - Map (implemented by HashMap)
    - Set (implemented by HashSet)
    - Collection (implemented by List and Set interfaces)
* A **Generic** method or class can handle multiple types of objects.
  For example, the ArrayList class can handle a list of Integers or Strings.

  ```
  ArrayList<Integer> grades = new ArrayList<Integer>();
  ArrayList<String> names = new ArrayList<String>();

  ArrayList<T> aList = new ArrayList<T> ();
  ```

  Convert an array to a list:

  ```
  public <T> List<T> fromArrayToList(T[] a) {
      return Arrays.stream(a).collect(Collectors.toList());
  }
  ```
* Single Responsibility Principle: a class should have one clear role.

## References

* [Java Basics (webucator)](https://www.webucator.com/tutorial/learn-java/java-basics.cfm)
* [Streams](https://stackify.com/streams-guide-java-8/)
* [Find min/max using Streams](https://www.baeldung.com/java-collection-min-max)
* [Generics](https://www.baeldung.com/java-generics)
