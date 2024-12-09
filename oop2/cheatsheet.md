# **Python Fundamentals - Week 1 Summary**

#### **Goal of OOP2**

- Master Python coding with **OOP concepts**, containers, exceptions, concurrency, etc.
- Write clean, reusable code using **S.O.L.I.D principles**.
- Implement **design patterns** (Behavioral, Creational, Structural).

---

#### **Key Python Characteristics**

- **Interpreted**, **dynamically typed**, **strongly typed**.
- Supports multiple paradigms: **OOP, functional, procedural**.
- Large standard library.

---

### **Basics**

#### **Main Function**

- Use `if __name__ == '__main__':` to define entry points in scripts.

#### **Indentation**

- Critical for defining blocks of code in Python.

#### **Dynamically Typed**

- Variables don't require explicit types; types are inferred at runtime.

#### **Comments & Docstrings**

- **Docstrings**: Document modules, functions, classes, methods.
  ```python
  def add(a, b):
      """Return sum of a and b."""
      return a + b
  ```
- Retrieve docstrings with `help(module_name)`.

#### **PEP-8 Style Guide**

- Standard for Python code formatting:
  - Variables: `my_variable`
  - Classes: `MyClass`
  - Constants: `CONSTANT`
  - Methods: `my_method`

---

### **Strings**

- **Immutable** sequences of Unicode (UTF-8) codepoints.
- Escape characters like `\n`, or use **raw strings** (`r"string\n"`).
- Common methods:
  - `.title()`, `.upper()`, `.lower()`, `.replace()`, `.split()`, `.join()`.
  ```python
  "hello".upper()  # HELLO
  "-".join(["a", "b"])  # "a-b"
  ```
- **Multiline Strings**: Use triple quotes (`"""string"""`) or line breaks with `\`.

#### **String Formatting**

1. **`.format()` Method**
   ```python
   "I scored {0} in {1}".format(98.5, "Math")
   ```
2. **f-Strings**
   ```python
   score = 98.5
   f"I scored {score} in Math"
   ```
3. **Conversion Specifiers**
   ```python
   "Value: %.2f" % 3.14159  # Value: 3.14
   ```

---

### **Data Types**

#### **Mutability**

- Strings, `int`, `tuple`: **Immutable**.
- Lists, dicts: **Mutable**.

#### **Sequence Types**

- `str`, `list`, `range`, `tuple`, `bytes`.
- Operators: Indexing `[i]`, slicing `[start:end]`, membership (`in`).

#### **List**

- **Mutable** and supports various data types.
  ```python
  my_list = [1, "two", 3.0]
  my_list.append(4)
  ```

#### **Tuple**

- **Immutable** sequences.
  ```python
  coordinates = (45.0, -75.0)
  ```

#### **Dictionary**

- **Key-Value** pairs; keys must be **immutable**.
  ```python
  my_dict = {"name": "Jeff", "age": 25}
  del my_dict["age"]
  ```

#### **Views**

- Provide dynamic views of dictionary content:
  - `dict.keys()`, `dict.values()`, `dict.items()`.

---

### **Loops**

#### **For Loop**

- Iterates over sequences like lists or strings:
  ```python
  for item in [1, 2, 3]:
      print(item)
  ```

#### **While Loop**

- Executes while a condition is true:
  ```python
  x = 0
  while x < 5:
      x += 1
  ```

#**Python Study Summary - Week 2**

---

#### **Daytime and Time Modules**

- **Unix Epoch**: Time begins at `1970-01-01 00:00:00 UTC`.
- **Time Module**:

  - `time.time()`: Seconds since epoch (float).
  - `time.sleep(seconds)`: Pauses code execution.

- **Datetime Module**:

  - **Datetime Object**: Represents a specific moment.
    ```python
    datetime.datetime(year, month, day, hour, minute, second)
    ```
  - **Comparing Times**:
    ```python
    halloween = datetime(2018, 10, 31)
    nyd = datetime(2019, 1, 1)
    delta = nyd - halloween  # timedelta: 62 days
    ```
  - **Timedata Datatypes**:
    - `datetime`: Point in time.
    - `timedelta`: Duration of time.

- **Example**: Pause program until a specific date:
  ```python
  while datetime.datetime.now() < final_exam:
      time.sleep(1)
  ```

---

#### **Essential OOP Concepts**

1. **Class**:

   - Blueprint for creating objects (defines attributes and methods).
   - Example:
     ```python
     class Cat:
         def __init__(self, name):
             self.name = name
     ```

2. **Object**:

   - Instance of a class with its own attributes and behavior.

3. **Special Methods**:

   - `__init__(self)`: Initializer for creating objects.
   - `__repr__(self)`: Developer-friendly object representation.
   - `__str__(self)`: User-friendly object representation.

4. **Accessors & Mutators**:

   - Accessor: Gets attribute value.
   - Mutator: Sets attribute value.
     ```python
     def set_name(self, name):
         self.name = name
     ```

5. **Static/Class Methods**:
   - `@classmethod`: Works with the class itself using `cls`.
   - `@staticmethod`: Independent function within class, no `self` or `cls`.

---

#### **OOP Principles**

1. **Modularity and Abstraction**:

   - Break problems into modular components.
   - Hide implementation details.

2. **Encapsulation**:

   - Bind data and methods inside a class.
   - Use `_` or `__` for private attributes.

3. **Interface**:

   - Public interface defines interaction methods for an object.

4. **Polymorphism**:
   - Context-aware behavior:
     ```python
     5 + 4  # 9
     "5" + "4"  # "54"
     ```

---

#### **Inheritance**

- Subclasses inherit attributes and methods from a superclass.
- Use `super()` to access parent class methods.
  ```python
  class Animal:
      def __init__(self):
          print("Animal")
  class Dog(Animal):
      def __init__(self):
          super().__init__()
          print("Dog")
  ```

---

#### **Interfaces and Protocols**

1. **Duck Typing**:

   - Suitability checked at runtime.
   - Example:
     ```python
     len(obj)  # Calls obj.__len__()
     ```

2. **Protocols**:

   - Informal interfaces like `Sized`, `Container`, and `Sequence`.
   - Implement methods like `__len__`, `__contains__`, `__getitem__`.

3. **Formal Interfaces (ABCs)**:
   - Define required methods and properties with `abc.ABC`.
     ```python
     class Bird(abc.ABC):
         @abc.abstractmethod
         def fly(self):
             pass
     ```

---

#### **Unified Modeling Language (UML)**

- Describes the static structure of a system.
- Key relationships:
  - **Dependency**: A uses methods from B.
  - **Association**: A contains data attributes from B.
  - **Aggregation**: A contains B; B persists if A is destroyed.
  - **Composition**: A is composed of B; B is destroyed with A.
  - **Inheritance**: A is a subclass of B.
  - **Realization**: A implements interface B.

---

# **Python Study Summary - Week 2**

---

#### **Daytime and Time Modules**

- **Unix Epoch**: Time begins at `1970-01-01 00:00:00 UTC`.
- **Time Module**:

  - `time.time()`: Seconds since epoch (float).
  - `time.sleep(seconds)`: Pauses code execution.

- **Datetime Module**:

  - **Datetime Object**: Represents a specific moment.
    ```python
    datetime.datetime(year, month, day, hour, minute, second)
    ```
  - **Comparing Times**:
    ```python
    halloween = datetime(2018, 10, 31)
    nyd = datetime(2019, 1, 1)
    delta = nyd - halloween  # timedelta: 62 days
    ```
  - **Timedata Datatypes**:
    - `datetime`: Point in time.
    - `timedelta`: Duration of time.

- **Example**: Pause program until a specific date:
  ```python
  while datetime.datetime.now() < final_exam:
      time.sleep(1)
  ```

---

#### **Essential OOP Concepts**

1. **Class**:

   - Blueprint for creating objects (defines attributes and methods).
   - Example:
     ```python
     class Cat:
         def __init__(self, name):
             self.name = name
     ```

2. **Object**:

   - Instance of a class with its own attributes and behavior.

3. **Special Methods**:

   - `__init__(self)`: Initializer for creating objects.
   - `__repr__(self)`: Developer-friendly object representation.
   - `__str__(self)`: User-friendly object representation.

4. **Accessors & Mutators**:

   - Accessor: Gets attribute value.
   - Mutator: Sets attribute value.
     ```python
     def set_name(self, name):
         self.name = name
     ```

5. **Static/Class Methods**:
   - `@classmethod`: Works with the class itself using `cls`.
   - `@staticmethod`: Independent function within class, no `self` or `cls`.

---

#### **OOP Principles**

1. **Modularity and Abstraction**:

   - Break problems into modular components.
   - Hide implementation details.

2. **Encapsulation**:

   - Bind data and methods inside a class.
   - Use `_` or `__` for private attributes.

3. **Interface**:

   - Public interface defines interaction methods for an object.

4. **Polymorphism**:
   - Context-aware behavior:
     ```python
     5 + 4  # 9
     "5" + "4"  # "54"
     ```

---

#### **Inheritance**

- Subclasses inherit attributes and methods from a superclass.
- Use `super()` to access parent class methods.
  ```python
  class Animal:
      def __init__(self):
          print("Animal")
  class Dog(Animal):
      def __init__(self):
          super().__init__()
          print("Dog")
  ```

---

#### **Interfaces and Protocols**

1. **Duck Typing**:

   - Suitability checked at runtime.
   - Example:
     ```python
     len(obj)  # Calls obj.__len__()
     ```

2. **Protocols**:

   - Informal interfaces like `Sized`, `Container`, and `Sequence`.
   - Implement methods like `__len__`, `__contains__`, `__getitem__`.

3. **Formal Interfaces (ABCs)**:
   - Define required methods and properties with `abc.ABC`.
     ```python
     class Bird(abc.ABC):
         @abc.abstractmethod
         def fly(self):
             pass
     ```

---

#### **Unified Modeling Language (UML)**

- Describes the static structure of a system.
- Key relationships:
  - **Dependency**: A uses methods from B.
  - **Association**: A contains data attributes from B.
  - **Aggregation**: A contains B; B persists if A is destroyed.
  - **Composition**: A is composed of B; B is destroyed with A.
  - **Inheritance**: A is a subclass of B.
  - **Realization**: A implements interface B.

---

# **Python Study Summary - Week 3**

---

### **Interfaces and UML Diagrams**

#### **Collaboration Diagram**

- Describes interactions between objects via a **sequence of messages**.
- Shows structural perspectives of use cases or their subsets.
  - Components:
    - **Object**: Instances involved in interactions.
    - **Actor**: External entities (e.g., user).
    - **Links**: Connections between objects and actors.
    - **Messages**: Communication exchanged between objects.

---

#### **Sequence Diagram**

- Focuses on **time-based interactions** between objects.
- Shows **lifetime of interactions** during communication.
  - Components:
    - **Lifeline**: Represents an object's existence during interaction.
    - **Messages**: Arrows showing communication.
    - **Activation**: Represents a method execution by an object.

---

### **Dependencies and Coupling**

#### **Dependency**

- When one entity relies on another:
  ```python
  # Example: Sushi depends on Rice and Fish
  class Sushi:
      def __init__(self, rice, fish):
          self.rice = rice
          self.fish = fish
  ```

#### **Coupling**

- **Coupling**: Strong dependency between modules or classes.
  - Minimize coupling to increase modularity and maintainability.
  - Use **inheritance** and **interfaces** to decouple.

---

### **SOLID Design Principles**

1. **Single Responsibility Principle**:

   - A class should only have **one responsibility**.

2. **Open/Closed Principle**:

   - Classes should be **open for extension**, but **closed for modification**.

3. **Liskov Substitution Principle**:

   - Subtypes must be replaceable with their base types without affecting program correctness.

4. **Interface Segregation Principle**:

   - Avoid forcing clients to depend on **interfaces they don’t use**.

5. **Dependency Inversion Principle**:
   - Depend on **abstractions**, not on **concrete implementations**.

---

### **Law of Demeter**

- Each unit (class or function) should have **limited knowledge** of other units.
  - Communicate only with:
    - Directly related objects.
    - Objects created/returned by related objects.

---

### **Function Parameters**

- Python is **pass by object reference**:
  - **Mutable objects** (e.g., lists): Changes affect the original.
  - **Immutable objects** (e.g., integers): Changes do not affect the original.

---

# **Python Study Summary - Week 4**

---

### **Slicing**

- Extract portions of sequences like lists, strings, or tuples.
- Syntax: `sequence[start:end:step]`.
  ```python
  breakfast = ["Eggs", "Toast", "Granola", "Yoghurt", "Banana"]
  breakfast[2:5:2]  # ['Granola', 'Banana']
  breakfast[::-1]  # Reverse list
  ```

---

### **Ranges**

- Represents a sequence of numbers, generated on demand.

  ```python
  range(start, stop, step)
  list(range(0, 10, 2))  # [0, 2, 4, 6, 8]
  ```

- Common range operations:
  - `max(range)`, `min(range)`, `sum(range)`.
  - Access elements using `.index(value)`.

---

### **Iterators**

- Objects that represent a stream of data.
- Use `iter()` to create an iterator and `next()` to retrieve values.

  ```python
  mystr = "hello"
  it = iter(mystr)
  print(next(it))  # 'h'
  ```

- Iterators are **exhaustible**; once all elements are retrieved, they raise a `StopIteration` exception.

---

### **Function Overloading**

Python supports overloading via:

1. **Default Arguments**:
   ```python
   def greet(name="World"):
       print(f"Hello, {name}!")
   ```
2. **Variable Arguments**:

   - `*args`: Accepts a variable number of positional arguments.
   - `**kwargs`: Accepts a variable number of keyword arguments.
     ```python
     def print_items(*args, **kwargs):
         print(args, kwargs)
     print_items("apple", color="red")
     ```

3. **Unpacking**:
   - Expand sequences into positional arguments.
   ```python
   def display(a, b, c):
       print(a, b, c)
   my_list = [1, 2, 3]
   display(*my_list)
   ```

---

### **Function Parameters**

1. **Mutable Parameters**:
   - Can modify the original object (e.g., lists).
   - Assignment creates a new object, leaving the original unchanged.
2. **Immutable Parameters**:
   - Cannot modify the original object directly (e.g., strings, tuples).

---

### **Multiple Inheritance and Mixins**

#### **Multiple Inheritance**

- Combine behaviors from multiple parent classes.
- **Diamond Problem**: Resolved using **Method Resolution Order (MRO)**.
  - Linearization ensures consistent inheritance hierarchy.
  - Use `super()` to call parent class methods.

#### **Mixins**

- Provide reusable functionality for multiple classes.
- Not meant to be instantiated directly.
  ```python
  class Mixin1:
      def greet(self):
          print("Hello")
  class MultiDerived(Mixin1):
      pass
  ```

---

### **Interface Segregation Principle**

- Use multiple inheritance to implement distinct interfaces from abstract base classes (ABCs).
- Combine interfaces using mixins for cohesive functionality.
  ```python
  class Walk(abc.ABC):
      @abc.abstractmethod
      def walk(self):
          pass
  class Human(Walk):
      def walk(self):
          print("Walking")
  ```

---

# **Python Study Summary - Week 5**

---

### **Errors and Exceptions**

- **Common Exceptions**:

  - `ValueError`: Invalid input for a function.
  - `TypeError`: Operation applied to an incompatible type.
  - `AttributeError`: Invalid attribute access.
  - `ZeroDivisionError`: Division by zero.
  - `SyntaxError`: Invalid syntax.
  - `NameError`: Undefined variable.

- **Throwing Exceptions**:

  ```python
  def divide(a, b):
      if b == 0:
          raise ZeroDivisionError("Cannot divide by zero.")
      return a / b
  ```

- **Try-Except Block**:

  ```python
  try:
      risky_operation()
  except ZeroDivisionError:
      print("Caught ZeroDivisionError.")
  else:
      print("No exceptions.")
  finally:
      print("This always executes.")
  ```

- **Custom Exceptions**:

  ```python
  class CustomError(Exception):
      pass
  ```

- **`args` and `as`**:
  - Use `as` to access exception details.
  ```python
  try:
      raise CustomError("Error message", 42)
  except CustomError as e:
      print(e.args)  # ("Error message", 42)
  ```

---

### **Unit Testing**

- **Steps**:

  1. **Assemble**: Setup the environment.
  2. **Act**: Run the code.
  3. **Assert**: Verify results using assertions.

- **Example**:

  ```python
  from unittest import TestCase

  class TestSum(TestCase):
      def test_sum(self):
          self.assertEqual(sum([1, 2, 3]), 6)
  ```

---

### **File Handling**

- **Open a File**:

  ```python
  file = open("example.txt", "r")
  content = file.read()
  file.close()
  ```

- **Using `with`**:

  ```python
  with open("example.txt", "r") as file:
      content = file.read()
  ```

- **Seek**:

  ```python
  with open("example.txt", "r") as file:
      file.seek(0)
      content = file.read()
  ```

- **JSON Operations**:
  - Read:
    ```python
    import json
    with open("data.json", "r") as file:
        data = json.load(file)
    ```
  - Write:
    ```python
    import json
    data = {"name": "Alice", "age": 25}
    with open("data.json", "w") as file:
        json.dump(data, file)
    ```

---

### **Enums**

- **Enumerations**: A set of constant values.
  ```python
  from enum import Enum
  class Days(Enum):
      MON = 1
      TUE = 2
  print(Days.MON.name)  # MON
  print(Days.MON.value)  # 1
  ```

---

### **Iterators**

- **Custom Iterator**:

  ```python
  class Counter:
      def __init__(self, limit):
          self.limit = limit
          self.current = 0

      def __iter__(self):
          return self

      def __next__(self):
          if self.current < self.limit:
              self.current += 1
              return self.current
          raise StopIteration
  ```

- **Generators**:
  ```python
  def my_generator(limit):
      for i in range(limit):
          yield i
  ```

---

### **Comprehensions**

- **List Comprehension**:

  ```python
  squares = [x**2 for x in range(10)]
  ```

- **Dictionary Comprehension**:
  ```python
  squares = {x: x**2 for x in range(10)}
  ```

---

### **Function Objects and Observers**

- Functions are first-class objects:

  ```python
  def my_function():
      print("Hello")
  f = my_function
  f()
  ```

- **Observer Pattern**:
  - Notify observers when a state changes.
  - Decouples components.

---

### **Callable Objects**

- **Custom Callable**:
  ```python
  class Adder:
      def __call__(self, x, y):
          return x + y
  add = Adder()
  print(add(1, 2))  # 3
  ```

# **Python Study Summary - Week 6**

---

### **Generators**

- **Definition**: Special iterators that save memory and handle large/infinite sequences.
- Use `yield` to return a value and pause execution.
- **Benefits**:
  - Memory efficient.
  - Handle infinite sequences.
  - Ideal for pipeline processing.
- **Limitations**: Single iteration, no random access.

#### **Example**:

```python
def fibonacci(limit):
    a, b = 0, 1
    for _ in range(limit):
        yield a
        a, b = b, a + b
```

#### **Generator Expressions**:

- Similar to list comprehensions but use `()` instead of `[]`.

```python
squares = (x ** 2 for x in range(10))
```

---

### **Lambda Functions**

- Anonymous, inline functions for short, simple tasks.
- Syntax: `lambda parameters: expression`.

```python
add = lambda x, y: x + y
print(add(3, 5))  # 8
```

---

### **Map and Filter**

- **Map**: Apply a function to all elements in an iterable.

  ```python
  nums = [1, 2, 3]
  result = map(lambda x: x * 2, nums)
  print(list(result))  # [2, 4, 6]
  ```

- **Filter**: Select elements that satisfy a condition.
  ```python
  nums = [1, 2, 3, 4]
  result = filter(lambda x: x % 2 == 0, nums)
  print(list(result))  # [2, 4]
  ```

---

### **The Zen of Python**

- **Beautiful is better than ugly**: Write clean and readable code.
- **Explicit is better than implicit**: Avoid hidden or obscure behaviors.
- **Simple is better than complex**: Strive for simplicity.
- **Complex is better than complicated**: Logical complexity is acceptable, but avoid convoluted solutions.

---

### **Profiling**

- Analyze program performance:
  - Space and time complexity.
  - Frequency/duration of function calls.
- Use `cProfile` for deterministic profiling:
  ```python
  import cProfile
  cProfile.run('some_function()')
  ```
- **Key Metrics**:
  - `ncalls`: Number of calls.
  - `tottime`: Time spent in the function.
  - `cumtime`: Cumulative time including sub-calls.

---

### **Intro to Design Patterns**

- **Purpose**: Provide reusable solutions to common design problems.
- **Advantages**:
  - Proven solutions.
  - Language agnostic.
  - Improves modularity and communication.
- **Disadvantages**:
  - May add complexity.
  - Risk of pattern overload.

---

#### **Design Pattern Categories**

1. **Creational Patterns**:

   - Handle object creation.
   - Examples: Singleton, Factory Method, Builder.

2. **Structural Patterns**:

   - Organize objects/classes into larger structures.
   - Examples: Adapter, Composite, Decorator.

3. **Behavioral Patterns**:
   - Focus on communication and responsibility among objects.
   - Examples: Observer, Strategy, Command.

---

# **Python Study Summary - Week 9**

---

### **Creational Design Patterns**

1. **Singleton**:

   - Ensures only one instance of a class exists.
   - Use when global access to a single object is needed.

   ```python
   class Singleton:
       _instance = None

       def __new__(cls, *args, **kwargs):
           if not cls._instance:
               cls._instance = super().__new__(cls)
           return cls._instance
   ```

2. **Factory (Factory Method)**:

   - Separates object creation from its usage.
   - Provides flexibility to create families of related objects.

   ```python
   class ShapeFactory:
       @staticmethod
       def create_shape(shape_type):
           if shape_type == "circle":
               return Circle()
           elif shape_type == "square":
               return Square()
   ```

3. **Abstract Factory**:
   - Produces families of related objects without specifying concrete classes.
   - Use when multiple families of related objects are needed.
   ```python
   class GUIFactory(ABC):
       @abstractmethod
       def create_button(self):
           pass
   ```

---

### **Structural Design Patterns**

1. **Proxy**:

   - Acts as a placeholder or intermediary to control access to another object.
   - Useful for logging, lazy initialization, or access control.

   ```python
   class Proxy:
       def __init__(self, real_subject):
           self._real_subject = real_subject
   ```

2. **Facade**:

   - Simplifies access to a complex subsystem by providing a unified interface.
   - Use to hide complexity and organize code into layers.

   ```python
   class Facade:
       def unified_operation(self):
           return "\n".join([
               SubsystemA().operation_a(),
               SubsystemB().operation_b()
           ])
   ```

3. **Bridge**:

   - Decouples abstraction and implementation to allow them to vary independently.
   - Use to break down large classes and manage multiple dimensions.

   ```python
   class Abstraction:
       def __init__(self, implementation):
           self._implementation = implementation
   ```

4. **Decorator**:
   - Dynamically adds functionality to an object at runtime by wrapping it in a decorator.
   - Use for extending functionality while maintaining the same interface.
   ```python
   class ConcreteDecoratorA(Decorator):
       def operation(self):
           return f"ConcreteDecoratorA({self._component.operation()})"
   ```

---

### **Key Concepts for Creational and Structural Patterns**

- **Creational Patterns**:

  - Focus on object creation.
  - Ensure flexibility and reuse in creating objects.
  - Examples: Singleton, Factory, Abstract Factory.

- **Structural Patterns**:
  - Focus on object composition and relationships.
  - Promote flexibility and maintainability.
  - Examples: Proxy, Facade, Bridge, Decorator.

---

# **Python Study Summary - Week 10**

---

### **Behavioral Design Patterns**

Behavioral patterns focus on the communication and interaction between objects while minimizing coupling. These patterns help in defining how objects collaborate and delegate responsibilities.

---

#### **Chain of Responsibility**

- **Purpose**: Pass requests along a chain of handlers until one handles it.
- **Key Features**:
  - Decouples sender and receiver of a request.
  - Implements a linked list of handlers.
  - Follows **Single Responsibility** and **Open/Closed** principles.
- **Use Cases**:
  - Validation, security checks, logging, etc.
- **Disadvantages**:
  - Requests may go unhandled if no suitable handler exists.
  - Can lead to many classes.

```python
class AuthHandler(Handler):
    def handle(self, request):
        if not request.get("authenticated"):
            print("Authentication failed!")
            return False
        print("Authentication passed.")
        if self.next_handler:
            return self.next_handler.handle(request)
        return True
```

---

#### **Strategy**

- **Purpose**: Swap algorithms or behaviors at runtime.
- **Key Features**:
  - Encapsulates behaviors into separate classes.
  - Allows runtime selection of a behavior.
  - Follows **Open/Closed** and **Liskov Substitution** principles.
- **Use Cases**:
  - Payment methods, sorting algorithms, etc.
- **Disadvantages**:
  - Clients must be aware of strategies to choose the correct one.

```python
context = PaymentContext(CreditCardPayment())
context.pay(100)  # Output: Paid 100 using Credit Card.
```

---

#### **State**

- **Purpose**: Allows an object to alter its behavior when its internal state changes.
- **Key Features**:
  - Implements a finite state machine.
  - Decouples state-specific behaviors from the object.
  - Follows **Single Responsibility** and **Open/Closed** principles.
- **Use Cases**:
  - Workflow processes, system states, etc.
- **Disadvantages**:
  - Complex to maintain if states and transitions are numerous.
  - High coupling if states need to know about one another.

```python
context = Context(IdleState())
context.request()  # Output: System is idle. Moving to running state.
```

---

### **Key Comparisons**

| **Aspect**   | **Strategy**                                    | **State**                                         |
| ------------ | ----------------------------------------------- | ------------------------------------------------- |
| Purpose      | Swap algorithms at runtime                      | Alter object behavior based on state              |
| Awareness    | Strategies are unaware of each other            | States may know about neighboring states          |
| Context Role | Context and strategies have separate interfaces | Context and states often share the same interface |
| Transition   | No transitions between strategies               | States may transition between one another         |

---

### **Behavioral Patterns Summary**

1. **Chain of Responsibility**: Pass requests through a chain of handlers.
2. **Strategy**: Swap algorithms or behaviors dynamically.
3. **State**: Manage behavior changes based on an object's state.

---

# **Python Study Summary - Week 11**

---

### **Concurrency in Python**

Concurrency involves managing multiple tasks in parallel, improving responsiveness and execution speed. Python supports concurrency through **Threading**, **Tasks (AsyncIO)**, and **Multiprocessing**.

---

### **Key Concepts**

1. **Asynchronous Programming**:

   - Runs tasks "in parallel" with the main thread.
   - Tasks notify the main thread upon completion via callbacks.

2. **Types of Concurrency**:

   - **Threading**: Multiple threads within a single process; ideal for I/O-bound problems.
   - **AsyncIO**: Define and manage asynchronous tasks; also ideal for I/O-bound problems.
   - **Multiprocessing**: Separate processes with distinct memory; suitable for CPU-bound problems.

3. **I/O-Bound vs. CPU-Bound**:
   - **I/O-Bound**: Waiting for input/output operations.
   - **CPU-Bound**: Heavy computation consuming CPU resources.

---

### **Threading**

- **Definition**: Smallest unit of execution within a process.
- **Shared Memory**: Threads share the same memory, making data sharing easy but prone to race conditions.
- **Race Conditions**: Occur when multiple threads access shared resources unpredictably.

#### **Locks**:

- Used to ensure only one thread accesses critical sections at a time.

```python
import threading

lock = threading.Lock()

def increment():
    with lock:
        # Critical section
        global counter
        counter += 1
```

#### **Daemon Threads**:

- Run in the background and stop automatically when the main thread ends.

```python
thread = threading.Thread(target=background_task, daemon=True)
thread.start()
```

#### **Deadlocks**:

- Occur when threads wait indefinitely for resources held by each other.

```python
lock1.acquire()
lock2.acquire()  # Deadlock scenario if another thread holds lock2
```

---

### **AsyncIO and Coroutines**

- **Coroutines**: Asynchronous functions using `async def`.
- **Event Loop**: Manages and schedules asynchronous tasks.

#### **Creating and Running Coroutines**:

```python
import asyncio

async def greet(name):
    print(f"Hello, {name}!")
    await asyncio.sleep(1)  # Simulates an I/O-bound task
    print(f"Goodbye, {name}!")

asyncio.run(greet("Alice"))
```

#### **Running Concurrent Tasks**:

```python
async def main():
    await asyncio.gather(task1(), task2())
asyncio.run(main())
```

#### **AsyncIO Tasks**:

- Wrap coroutines in `asyncio.create_task` to schedule them.

```python
task = asyncio.create_task(coroutine())
await task
```

---

### **HTTP Requests with `aiohttp`**

- **GET Requests**: Retrieve data from a server.
- **POST Requests**: Send data to a server.

#### **Example**:

```python
import aiohttp
import asyncio

async def fetch_data(url):
    async with aiohttp.ClientSession() as session:
        async with session.get(url) as response:
            return await response.text()

asyncio.run(fetch_data("https://example.com"))
```

---

### **Concurrency Issues**

1. **Race Conditions**:
   - Use locks to prevent simultaneous access to shared resources.
2. **Deadlocks**:
   - Avoid circular dependencies on locks.

---

### **When to Use Concurrency**

- Use threading or AsyncIO for I/O-bound problems like file handling, database queries, or web scraping.
- Use multiprocessing for CPU-bound problems like heavy computations.

---

### **Advantages and Disadvantages**

#### **Advantages**:

- Faster execution for appropriate tasks.
- Improved responsiveness in I/O-bound operations.

#### **Disadvantages**:

- Increased complexity.
- Debugging and handling concurrency issues like race conditions and deadlocks can be challenging.

---

# **Python Study Summary - Week 12**

---

### **Race Conditions and Locks**

A **race condition** occurs when multiple threads, tasks, or processes access and modify a shared resource simultaneously without proper synchronization. This can lead to unpredictable and incorrect outcomes.

---

### **Examples of Race Conditions**

#### **Example 1: Counter Variable**

- **Problem**: Threads simultaneously read, modify, and write to a shared counter.

```python
counter = 0  # Shared resource

def increment():
    global counter
    for _ in range(100000):
        counter += 1

thread1 = threading.Thread(target=increment)
thread2 = threading.Thread(target=increment)

thread1.start()
thread2.start()
thread1.join()
thread2.join()

print(f"Final counter value: {counter}")  # Expected: 200000, Actual: <200000
```

#### **Example 2: Bank Balance**

- **Problem**: Concurrent threads modify the balance, leading to incorrect updates.

```python
balance = 1000  # Shared resource

def withdraw(amount):
    global balance
    if balance >= amount:
        balance -= amount

def deposit(amount):
    global balance
    balance += amount

thread1 = threading.Thread(target=withdraw, args=(500,))
thread2 = threading.Thread(target=deposit, args=(500,))

thread1.start()
thread2.start()
thread1.join()
thread2.join()

print(f"Final balance: {balance}")  # Expected: 1000, Actual: May vary
```

#### **Example 3: File Writing**

- **Problem**: Multiple threads write to a shared file without coordination, corrupting the data.

```python
def write_to_file(file_name, text):
    with open(file_name, 'a') as f:
        f.write(text + '\n')

threads = [threading.Thread(target=write_to_file, args=('shared.txt', f"Thread {i}")) for i in range(5)]

for t in threads:
    t.start()

for t in threads:
    t.join()

print("File write complete.")
```

---

### **Mitigating Race Conditions with Locks**

Locks are used to synchronize threads, ensuring only one thread can access a critical section of code at a time.

#### **Using Locks**

```python
import threading

counter = 0
lock = threading.Lock()

def increment():
    global counter
    for _ in range(100000):
        with lock:  # Ensures only one thread modifies `counter` at a time
            counter += 1

thread1 = threading.Thread(target=increment)
thread2 = threading.Thread(target=increment)

thread1.start()
thread2.start()
thread1.join()
thread2.join()

print(f"Final counter value: {counter}")  # Output: 200000
```

---

### **Key Characteristics of Locks**

1. **Mutual Exclusion**:
   - Ensures only one thread enters a critical section.
2. **Context Manager Support**:
   - Simplifies lock usage with `with` statements to automatically acquire and release locks.
3. **Drawbacks**:
   - Potential for **deadlocks** if threads hold multiple locks and wait on each other indefinitely.

---

### **Deadlocks**

A **deadlock** occurs when two or more threads are waiting for resources held by each other, preventing further progress.

#### **Example: Deadlock Scenario**

```python
import threading

lock1 = threading.Lock()
lock2 = threading.Lock()

def thread1():
    with lock1:
        print("Thread 1 acquired lock1")
        with lock2:
            print("Thread 1 acquired lock2")

def thread2():
    with lock2:
        print("Thread 2 acquired lock2")
        with lock1:
            print("Thread 2 acquired lock1")

t1 = threading.Thread(target=thread1)
t2 = threading.Thread(target=thread2)

t1.start()
t2.start()
t1.join()
t2.join()
```

---

### **Summary**

1. **Race Conditions**:
   - Occur due to unsynchronized access to shared resources.
   - Lead to unpredictable and erroneous behavior.
2. **Locks**:
   - Prevent race conditions by ensuring mutual exclusion.
3. **Deadlocks**:
   - Result from improper lock management and can freeze the program.

Locks and proper synchronization are crucial to avoiding these concurrency issues, but they also add complexity. Choose concurrency mechanisms carefully to balance performance and maintainability.
