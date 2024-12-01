# Basics

## ++ and -- Operators

```kotlin
var num = 5
num++ //5
++num //7
num-- //7
--num //5
```

## Converting Data Types

- string with `+ operator`, all other types are converted into their string representation

```kotlin
"10" + 6 // 106
10 + "6" // ILLEGAL
10 + "6".toInt() // 16
```

## Arrays

- To hold multiple values in a datatype
- To see the contents, `.contentToString`

  ```kotlin
  val species = arrayOf("A", "B", "C")
  println(species) // [Ljava.lnag.String;@129u320]

  println(species.contentToString()) //[A, B, C]
  ```

  ```kotlin
  nArray = arrayOfNulls<String>(5)
  bArray =booleanArrayOf(true, false)
  ```

- To change specific values of an array

```kotlin
  val species = arrayOf("A", "B", "C")
species[0] = "NEW"
species[5] = "NEW" // error
prntl species.size // 3
prtl species.contentToString() // [NEW, B, C]
```

- Element checking : `in` or `contains`

```kotlin
  val species = arrayOf("A", "B", "C")
  val str = if ("A" in species) "Found" else "Not found"

prtl
    species.indexOf("A") //0
    species.first() //A
    species.last() //C
    species.contains("D") //false
```

### Deconstructing an Array

- Omit certain variables, use `_`

```kotlin
  val species = arrayOf("A", "B", "C", "D")

  val (var1, var2, var3, _) = species

  println("$var1 $var2 $var3")


```

## Lists

- Lists are built on top of arrays and provide more _flexibility_
  - ex. more functions like `containsAll`
    ```kotlin
      val species = listOf("A", "B", "C")
      val result = species.containsAll(listOf("A", "B"))
    ```

### Mutable List

- List can be **resized** where as arrays cannot
  - listOf is read-only
  - `mutableListOf`
    ```kotlin
      val species = mutableListOf("A", "B", "C")
    species.add("D") // [A, B, C, D]
    species.addAll(listOf("E", "F")) // [A, B, C, D, E, F]
    species.removeAt(3) // [A, B, C, E, F]
    species.removeFirst()// [B, C, E, F]
    ```
    - helpful functions `sort()` and `shuffle()`

### Arrays and Lists

- Working with different collections, it is possible to mix data types
  - **BUT AVOID IT**

### For Loop

    ```kotlin
      val species = mutableListOf("A", "B", "C")

    for (each in species) {
        val toLower = each.lowercase()
        println(toLower)
    }
    //a
    //b
    //c
    ```

    ```kotlin
      val species = mutableListOf("A", "B", "C")
    for (index in species.indices) {
        print(index)
    }
    //0
    //1
    //2
    ```

    ```kotlin
      val species = mutableListOf("A", "B", "C")
    for (index in species.indices.reversed*()) {
        print("name $index is {species[index]}")
    }
    // name 2 is C
    // name 1 is B
    // name 0 is A
    ```

### Ranges & dowonTO & Step

```kotlin
 for (i in 1 .. 10 step 2)
   println(i)

 for (i in 3 downTo 1 step 1)
    println(i)
```

### forEach

- use `it`

```kotlin
val alphabets = listOf("A", "B", "C")
alphabets.forEach{
    println(it)
}
```

### While

```kotlin
val alphabets = listOf("A", "B", "C")
var i = alphabets.size - 1

while (i >= 0) {
    println(alphabets[i])
    i--
}

```

### Continue & Break

- `continue` : skip
- `break`: exit the loop

### Input

- `readin()` returns String
- `Scanner(System.` n `)` : java's scanner class
  - useful when you are expecting a specific type
  ```kotlin
  val sc = Scanner(system.` in `)
  print("Enter a num: ")
  val num = sc.nextInt()
  println("$num")
  ```

### Elvis Operator

- `?:` :helpful when work with nullable types

```kotlin
val nmae = names[0] ?: "unknown name"
```
