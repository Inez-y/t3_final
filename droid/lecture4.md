# Classes & Interface

## Classes & Objects

- We define properties and use them with our objects

  ```kotlin
  val sponge = Species() // Object
  sponge.name = "Bob"
  sponge.friends = 3
  sponge.occupation = "cook"

  class Species{
    //properties
    var name: String = ""
    var friends: Int = 0
    var occupation: String = ""
  }
  ```

## Getters & Setters

- Auto generated and hidden
- W can change defaul implementation if needed

```kotlin
var name: String = ""
    set(value) {
        field = value.uppercase()
    }
```

## Class Functions

- Class can have functions

## Constructors

- We use parameters in a constructor to pass aruments into our class
- We cannot use the constructor parameters in regular functions

```kotlin
class Species constructor(occupation:String) {
    var name: String = ""

    fun displayBio(){
        println(name)
        println(occupation) // CANNOT use this
    }
}
```

- Constructor parameters can either be used ouside functions
  - or used inside the `init` function
    - init bloc is run whenever the class is instanciated

```kotlin
class Species constructor(occupation:String) {
    var name: String = ""
    var job: String = occupation // or use init

    init {
        job = occupation
    }

    fun displayBio(){
        println(name)
        println(occupation) // CANNOT use this
    }
}
```

- Pass in aruments when we initialize a new object

```kotlin
fun main() {
    val sponge = Species("cook")
}
```

- We can also create properties as parameters in a constructor
  - the difference to regular parameters is declaring them with `val` or `var`
    - they can be used everywehre in the class
    ```kotlin
    class Species constructor (
        var name: String,
        var friends: Int = 1
    )
    ```
- Contructor keyword can be dropped
- Getters and Setters cannot be used inside a constructor

  - to override them while also using a constructor parameter
    ```kotlin
    class Species (
        name: String,
        var friends: Int = 1
    ) {
        var name = name
            get() = field
            set(value) {
                field = value
            }
    }
    ```

### Object Instancitation

- We can provide multiple ways to create a new object with **default values**

```kotlin
class Species(
    var name: String? = null,
    var friends: Int? = null,
    var occupation: String? = null
) {...}

fun main() {
    val sponge = Species("Bob", 3)
    var star = Species("Patrick")
    var squirrel = Species("Sandy", occupation = "Astronaut")
}
```

### Multiple Constructors

- Create a secondary constructor
- The parameter we want to isolate gets passed into the primary constructor
  ```kotlin
    class Species(
        var name: String?,
        var friends: Int?,
        var occupation: STring?
    ) {
        // pass the primary contructor
        constructor(name: String): this(name, null, null)
    }
  ```
- With multiple constructors, you can have specific initialization logic for that constructor

```kotlin
class Species(val names: String?){
    init {
        println("Primary constructor")
    }

    constructor() : this(null){
        println("Secondary constructor")
    }
}
```

## Visibility Modifiers

- Visibility Modifiers
  - `public`: default and can be accessed anywhere
  - `internal`: availalbe anywhere in the same module
  - `private`: available only inside the same file or class
  - `protected`: available only inside same class and subclass
- Functions and properties that are `private` and **declared outside classes**

  - tied to the file

    ```kotlin
    //in main
    private fun greet() {}

    //species.kt
    greet() // cannot access
    ```

- Functions and properties that are `private` and ** declared inside classes**

  - tied to the class

    ```kotlin
    class Species(
        private var occupation: String? = null){
            ...
    }

    fun fact()
    val species = Species("cook")
    species.occupation // cannot access
    ```

- The visibility for getters is the same as the property

```kotlin
class Private(){
    var occupation: String? = null
    private get() = field // NOPE.
}
```

## Inheritance

- One of main featues in OOP
- Inheritance allows us to inherit membes from a nother class which promotes reusability
- The class being inherited or derived from is called the `parent`, `super` or `base` class
- The clas that is inheriting or deriving from the parent is called `child` or `subclass` class
- All classes in Kotlin are `final` by default
  - use **`open`** keyword to allow class to be interited
  ```kotlin
  open class Species(
    private val name: String? = null
  ) { ... }
  ```
- Inheriting another class

  - If no default class constructor, need to privde the values when inheriting

  ```kotlin
  open class Species(
  private val name: String? = null
  ) { ... }

    class Sponge(
        private val occupation: String
    ) : Species(occupation) { ... }
  ```

- We can use the **child class** and parent class members
- Use **`protected`** visibility modivier over `private`
  - make it avialble to all subclasses

## Abstract Class

- Abstract class allow us to define our members without implementation

  - Members of an abstract class = **abstract**
  - We cannot create an instance of an abstract class
  - Abstract classes can have non-abstract members with implementations

  ```kotlin
  abstract class Species(...) {
    // abstract members
    abstract val occupation: String

    // non-abstract members
    fun displayBasicBio() {
        println(...)
    }

   }
  fun main() {
    val species = Species() // Cannot create an instance of an abstract class
  }
  ```

- This allows us to create common member definition for a base class that multiple subclasses can share
- This works well when you want to set up a blueprint or template that other class can follow
- When we inherit our abstract class we have to implement and override all the abstract members

  - use `override` keyword
  - the subclass can provide it's own implementatino of the members
  - use `open` keyword to override a non-abstract member

  ```kotlin
  class Sponge(
    name: String,
    friends: Int
  ) : Species(name, friends){

    override val occupation: String
        get() = "Cook"

    override fun displaySpecificBio() { ... }
    open fun displayBasicBio() { ... }
  }
  ```

## Interfaces

- Abstract class: inherit from one
  - it can be problematic involving multiple parent class initializations
- An interface is a type of abstract class
  - allows us to maintain abstraction without the problems of multiplce class inheritance
    - interface do everything an abstract class does except
      - NO constructors
      - NO init method
- A class can implement multiple interfaces
- If a member doesn't have an implementation, the `abstract` keyword is inferred

```kotlin
interface SeaCreature{
    fun displaySeaCreatureFact()
}
```

- No () brackets: no constructors

```kotlin
class Crab: Species(name, friends), SeaCreature {
    override val occupation: String
        get() = "Manager"
    override fun displaySpecificBio()
    override fun displaySeaCreatureFact()
}
```

- **Interface Segregation Principle**
  - only sea creatures invoke displaySeaCreatureFact function
- with interfaces
  - maintain abstraction and reduced complexity

## Anonymous Class

- Anonymous classes are declared using `object` expression
  ```kotlin
    val anonymousClass = object {
        fun greet() {...}
    }
  ```
- By default, anonymous classes are _inner_

  - when declared inside another class, they can access the outer class members
  - when declaring an anonymous class as a class member, it must be marked as **`private`**to access its members within the outer class
    - if it is marked as private: it will return type Any and not accessible

  ```kotlin
  class Star{
    val name: String = "Patrick"

    private val anonymousClass = object {
        val greet = "Hello $name"
    }

    fun greeting(){
        println(anonymousClass.greet)
    }
  }
  ```

- Anonymous classes can also inherit from other classes and implement interfaces
  - ex. create a listener(callback)
  ```kotlin
    interface PokemonSleepListener {
        fun startSleeping()
        fun recoveryProgress(recovered:String)
        fun wakeUp()
    }
  ```

```kotlin
class SnorlaxSleepListener: PokemonSleepListener {
    override fun startSleeping() { ... }
    override fun recoveryProgress(recovered: String) { ... }
    override fun wakeUp() { ... }
}
```

```kotlin
class Pokemon {
    fun sleep(listener: PokemonSleepListener?) {
        listener?startSleeping()

        for (i in 1..10) {
            Thread.sleep(700)
            listener?.recoveryProgress("{$i*10}%")
        }

        listener?.wakeUp()
    }
}
```

```kotlin
fun main(){
    val snorlax = Pokemon()
    val listener = SnorlaxSleepListener()
    snorlax.sleep(listener)
}
```

- create an anonymous class that implements our POkemonSleepListener

```kotlin
fun main(){
    ...

    val jiggyPuff = Pokemon()
    jiggyPuff.sleep(object: PokemonSleepListener) {
        override fun startSleeping() { ... }
        override fun recoveryProgress(recovered: String) { ... }
        override fun wakeUp() { ... }
    }
}
```
