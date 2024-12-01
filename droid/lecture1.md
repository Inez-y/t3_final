# Basics

## Android

- Most popular operation system in world
  - based on linux
  - designed mainly for touch screen mobile devices
- SDK
  - software developer kit
  - build, platform tools
  - emulator
  - google play services
- Gradle
  - build software for android studio
  - automates and manages the build process for us when creating builds
- Native development
  - Kotlin, Java with Android Studio
- Cross platform tools
  - Flutter (Google), React (Meta), Xamerin(Microsoft), Unity, logic, etc

## Kotlin

- Google's preferred language
- Objectied oriented + Functional programing feature
  - OOP : data stored in objects
  - Functional: data transformed by creating functions

### vs Java

- Kotlin is **more concise and streamlined** than Java
- Can be used in any situation you would use Java
  - ex. server-side code

### Basics

- All programs need an **entry point** to be run which is the main function
  - when building for Android, we don't use the main function directly
- variables
- println

#### Basic Datatypes

- every variable type can be type `Any` because every Kotlin class has Any as a superclass
- **Type inference**: Kotlin can determine the type for us when we initalize a variable
  ```kotlin
  val num: Int = 5
  val d: Double = 5.5
  val l: Long = 500L
  val f: Float = 2.3F
  val b: Boolean = true
  val s: String = "Hi"
  val c: Char = 'g' // single quote
  ```

#### Val vs Var

- `Val`: read only, can only be assigned once, **use this**
- `Var`: mutable, can be reassigned

#### Const

- **Read only** known befoe code execution
  - better for performance
- constants are determined at compile time
  - you can only define _primitive types and strings_ as const
- anything besides primitives and strings may have runtime _side effects_ contradicting how constants work
- const variables cannot be declared inside a function

```kotlin
const val num = 5
fun main() { }
```

#### Null Safety

- Null safety was created to avoid _null references_ -> common bug in the past
- Kotlin allows types to be nullor not null
  - nullable `val str:String? = null`
  - non null `val str:String = "hi"`
- Cannot assign null to a non null type
- Operators to proect us from a null exception (concole complains)
  - Safe (`?.`)
    ```kotlin
    val str:String? = null
    str?.length
    ```
  - Non-null asserted (`!!.`)
    - only use if you know it won't be null
      ```kotlin
      private var str:String? = "Not null"
      private fun doSomething() : Int {
          return str!!.length
      }
      ```

#### Strings

- Strings have many properties and methods we can work with
  ```kotlin
  val name = "Hi"
  name.length
  name.uppercase()
  name.lowercase()
  name.isEmpty()
  name.[0]
  ```
  - you can still will get ut of bounds errors in Kotlin, but the compiler will try and give you a heads up
    ```kotlin
    name[12] // Index is always out of bounds
    ```
- **String Template**

  - `${expression}`
  - omit {} if a single variable

    ```kotlin
    val name = "Meow"
    val weight = 3

    println("$name is $weight kg")
    ```

    - the format method with `%`

    ```kotlin
    val str = "%s is %s kg"
    println(str.format("Meow", 3))
    ```

    - Multiple Strings

      - `trimIndent()` removes a common minimal inden from each line
        - removes first and last line if they are blank

      ```kotlin
      val name = "Meow"
      val str = """
          $name is...
              %s kg...!!
      """.trimIndent()
      println(str.format("may be 5"))
      ```

    - String Comparison

      - use `==` or `str1.equals(str2)`

    - String Referential Equality `===`

      - compare the memory location
      - it checks if there is already a value of that string in the string pool memory

        - if there is, then it points to that string in memory

          - example 1

          ```kotlin
          val str1 = "Jerry"
          val str2 = "Jerry"

          println(str1 === str2) // true
          // only one string is created in the heap memory
          ```

          - example 2

          ```kotlin
          val str1 = "Jerry"
          val str2 = String("Jerry".toCharArray()) // new object on the heap

          println(str1 === str2) // false
          ```

#### Arithmetic Operators

#### Math

- use `kotlin.math` package

```kotlin
kotlin.math.sqrt(13.2)
kotlin.math.round(13.2)
kotlin.math.floor(13.2)
```

#### If-else Statement

```kotlin
val num1 = 5
val num2 = 7
val num3 = 4

// valid
if (num1 < num2 || num3 >= num1) {
    println("True")
} else {
    println("False)
}

// valid
val value = if (num1 < num2 || num3 >= num1) {
    println("Sponge")
    "True"
} else {
    println("Star")
    "False" // return statement
}
println(value)
```

- When expression only needs on line of code for each block

```kotlin
val value = if (num1 < num2 || num3 >= num1)
        "Sponge"
    else if (num < 4)
        "Star"
    else
        "Squirrel"
println(value) // Star

// in one line
val value = if (...) "Sponge" else if (...) "Star" else "Squirrel"
```

#### When Statement

- Switch statement

```kotlin
val species = "W"

when (species) {
    "C" -> println("Crab")
    "S" -> println("Squirrel")
    "W" -> println("Whale")
    else -> println("Human")
}
```

- Can be an expression

```kotlin
val result = when (species) {
    "C" -> println("Crab")
    "S" -> println("Squirrel")
    "W" -> println("Whale")
    else -> println("Human")
}
```

- Range

```kotlin
val height = 165
val result = when (height) {
    in 120 .. 150 -> "Short"
    in 150 .. 180 -> {"average"}
    in 180 .. 210 -> "tall"
    else -> {"Unknown height"}
}
```

- When expression doesn't need an initial value

```kotlin
val result = when  {
    4 > 5 -> "Sponge"
    5 < 4 -> "Crab"
    else -> "Star"
}
```

#### Booleans

- Nullable booleans are either `true`, `false`, or `null`
  - cannot use it for it statements if not specify the value
    ```kotlin
    val isSponge: Boolean? = null
    // specify sponge == true, or (isSponge) doesnt work
    var str = if (sponge == true) "True" else "False
    ```
