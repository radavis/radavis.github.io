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
  -Djavac.includes=BulkTank.java \
  -Dtest.includes=BulkTankTest.java

# run single test method
ant test-single-method \
  -Djavac.source=1.8 \
  -Djavac.target=1.8 \
  -Djavac.includes=Dictionary.java \
  -Dtest.includes=DictionaryTest.java \
  -Dtest.class=DictionaryTest \
  -Dtest.method=translateMethod


ant test-single \
  -Djavac.includes=Part1_7Test.java \
  -Dtest.includes=Part1_7Test.java
```


## Notes:

* Java is case-sensitive. `main()`, `Main()`, and `MAIN()` are calls to different methods.
* Statements must end with a semicolon `;`
* Primitive data type variables are **passed by value** to methods.
* Within methods, **objects are manipulated by reference**. The value of the memory
  location of that object is passed by value to a method.
* Strings are immutable; once created, they cannot be modified.
* "Good programmers write code that humans can understand." - Martin Fowler
* Single Responsibility Principle: a class should have a singular, clear role.

### Constructor Overloading

```java
public class MindfulDictionary {
    private Map<String, String> finnishToEnglish;
    private Map<String, String> englishToFinnish;
    private String filename;

    public MindfulDictionary() {
        finnishToEnglish = new HashMap<String, String>();
        englishToFinnish = new HashMap<String, String>();
    }

    public MindfulDictionary(String filename) {
        this();  // call to other constructor must come first
        this.filename = filename;
    }
}
```

### Random numbers

Generate a random integer between two numbers:

```java
int result = new Random().nextInt(max - min + 1) + min;
```

Generate a random double between two numbers:

```java
double result = new Random().nextDouble() * (max - min) + min;
```

### `equals()` method

Useful for comparing objects when **searching**. The `equals()` method is used
by the `contains()` method in ArrayList.

```java
@Override
public boolean equals(Object obj) {
    if (this == obj) return true;
    if (obj == null) return false;
    if (getClass() != obj.getClass()) return false;

    // check instance variables
    final YourClass other = (YourClass) obj;
    if ((this.instanceVar == null) ? (other.instanceVar != null) : !this.instanceVar.equals(other.instanceVar)) {
        return false;
    }
    // repeat for other instance vars

    return true;  // if all prior conditions pass, objects must be equal
}
```

### `hashCode()` method

Used for determining where an object will fall within a data structure that uses
hashes for organization (e.g. - `HashMap`, `Map`). Implement `hashCode()` and
`equals()` in your class to allow objects to become keys within a `HashMap`.

```java
@Override
public int hashCode() {
    int hash = 3;
    hash = 67 * hash + (this.instanceVar != null ? this.instanceVar.hashCode() : 0);
    // repeat above statement for other instance vars
    return hash;
}
```

### Interfaces

An **Interface** is used to define functionality that a class should implement.
It contains method signatures, without implementation. Interfaces allow us to
create a 'loose coupling' between classes. Examples:

- [List](https://docs.oracle.com/javase/8/docs/api/java/util/List.html) (implemented by ArrayList, LinkedList)
- [Map](https://docs.oracle.com/javase/8/docs/api/java/util/Map.html) (implemented by HashMap)
- [Set](https://docs.oracle.com/javase/8/docs/api/java/util/Set.html) (implemented by HashSet)
- [Collection](https://docs.oracle.com/javase/8/docs/api/java/util/Collection.html) (implemented by List and Set interfaces)


### Generics

A **Generic** method or class can handle multiple types of objects.
For example, the ArrayList class can handle a list of Integers or Strings.

```java
ArrayList<Integer> grades = new ArrayList<Integer>();
ArrayList<String> names = new ArrayList<String>();

ArrayList<T> aList = new ArrayList<T> ();
```

Convert an array to a list:

```java
public <T> List<T> fromArrayToList(T[] a) {
    return Arrays.stream(a).collect(Collectors.toList());
}
```

### Implementing the `Comparable` Interface

Allows us to specify how a collection of objects is sorted.

```java
public class UserStory implements Comparable<UserStory> {
    private String content;
    private String author;
    private int value;

    public UserStory(String content, String author, int value) {
        this.content = content;
        this.author = author;
        this.value = value;
    }

    @Override
    public int compareTo(UserStory otherUserStory) {
        if (this.value > otherUserStory.value) return -1;  // higher-value first
        if (this.value < otherUserStory.value) return 1;
        return 0;
    }
}
```

```java
Collections.sort(userStories);  // sorts the list, in-place
```

### Writing Tests

https://github.com/junit-team/junit4/wiki/Getting-started-%E2%80%93-Ant

## References

* [Java Basics (webucator)](https://www.webucator.com/tutorial/learn-java/java-basics.cfm)
* [Streams](https://stackify.com/streams-guide-java-8/)
* [Find min/max using Streams](https://www.baeldung.com/java-collection-min-max)
* [Generics](https://www.baeldung.com/java-generics)
