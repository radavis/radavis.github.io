# Gradle

[source](https://guides.gradle.org/building-java-applications/)


## init

Initialize a new Java Application using `gradle`.

```
mkdir hello-gradle
cd hello-gradle
gradle init  # choose #6
```


## build

Build the project. This does the following:

* downloads dependences to the `.gradle` folder
* compiles the classes
* run the tests and generates a test report

```
./gradlew build
```


## run

Run the application.

```
./gradlew run
```


## Spring Boot Applications

Build the app. Creates an executable jar in `build/libs`.

```
./gradlew bootJar
```

Run the application.

```
java -jar build/libs/hello-gradle.jar  # or
./gradlew bootRun
```

## Example build.gradle Files

[web3j/web3j-spring-boot-starter](https://github.com/web3j/web3j-spring-boot-starter/blob/master/build.gradle)

## Resources

* [gradle katas](https://github.com/praqma-training/gradle-katas)
* [Display test results in console - mkyong](https://www.mkyong.com/gradle/gradle-display-test-results-in-console/)
* [Gradle Exec Output](https://medium.com/@esycat/gradle-exec-output-f18f297c068)
