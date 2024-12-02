# Errors and Exceptions

- Inherit from the BaseExceptino class
- ValueError

  ```python
  >>> user_choice = int(input(“Enter Menu Option”))
  >>> “Hello”
  ```

- TypeError

  ```python
  >>> my_list = [1,2,3]
  >>> my_list + ‘4’

  ```

- AttributeError

  ```python
  >>> my_list.add(4)

  ```

- ZeroDivisionError
- SyntaxError

  ```python
  >>> print “99”  # This used to work in Python 2
  ```

- NameError

  ```python

  print(my_variable)

  ```

## Throwing an Exception

```python
def divide(num1, num2):
    if num2 == 0:
        raise ZeroDivisionError()
    return num1/num2
```

## Try-Except Block

```python
try:
    # The code that can possibly throw an exception
    add_something(1,3)
    add_something(‘3’,4)
except:
# Executed if an exception occurs
    print("An Exception was caught")
else:
    print("No exceptions")
finally:
    print("always execute this")

```

## Exception Inheritance Hierachy

- Most exceptions we handle inherit from `Exception`
  ![alt text](image-39.png)
- NEVER have an empty except
  - it will catch all the exceptions
- put smaller exceptions first, and go larger

## Easier to Ask for Forgiveness than Permission

- Multiple if-checks are bad (look before you leap)
  - exceptions are fast
  - waste CPU cycles
  - keep our functions atomic

## Custom Exceptions

```python
class MyCustomException(Exception): ◦ #class code
    pass

#Optional : Create an init with a custom error message
def __init__(self, my_msg):
    super().__init__(my_msg)
```

## `args` and `as` in Exceptions

- `args`
  - Get the instance of an exception to retrieve some data

```python
# catches the exception into the instance variable e
except MyException as e:
    print(e.args[0])
```

- `as`
  - the `BaseException`'s initializer contains an args to stroe a tuple of arguments
    - typically there is only one argument
      - string describign an error
  - additional arguments can be accessed using `[]` on the args

```python
try:
    raise MyException("Custom Error message", 999)
except MyException as e:
    print(e.args) #('Custom Error message', 999)
    print(e.args[0]) #Custom Error message
    print(e.args[1]) #999
```

# Unit Test

- A piece of code that exercises a very small, specific area of functionality of a given system
- A unit test invokes a particular function with a given input.
  - It then asserts whether the output received matches a given expected output
- It is an organized approach which helps break down our program into small bite sized pieces of functionality
- Each chunk of functionality can be tested in isolation
- Steps

1. Assemble – Create an environment in which the function can run
2. Act – Run the code with a given input(s).
3. Assert – Compare the result

- Rules
- A collectin of unit tests
- Each test is function that contains an **`assertion`**
- Assertions must test individual functions of your code
- The unit test functions go inside the test class
- The functions must all begin with **`test`**
  ![alt text](image-40.png)

```python
class Test(TestCase):
    def test_sum(self):
        self.assertTrue(MyClass.sum(1, 2)==3)
```

# File-Handling

1. Open a file
   - specify the encoding, file mode, file name
2. Conduct File Operations
   - read, write, append
3. Close the file
   - release memory and tie up any loose ends

```python
#Step1: Open a file
my_text_file = open("sample.txt", mode='r', encoding='utf-8')
#Step2: File operations
data = my_text_file.read() print(f"File Data:\n{data}")
#Step3: Close the file
my_text_file.close()
```

![alt text](image-41.png)

## `With` Keyword

- Closing files safely
- `With` defines an **identifier**
  - represents an object like a file, an active connection to a server, anything that needs to be initialized and de-initialized
- `__enter__(self)`, `__exit__(self)` needs to be implemented

```python
with open("test.txt", mode = 'w',encoding = 'utf-8') as f:
    f.write("my first file\n")
    f.write("This file\n\n")
    f.read() # This will cause an exception. The file will close safely
    f.write("contains three lines\n")
```

## `.seek(0)`

- EOF -> need to seek back to the begging for multiple reads

```python
with open("sample.txt", mode='r') as my_text_file:
    data = my_text_file.read()
    print(f"File Data:\n{data}")
    # This wont print anything since the file pointer # is at the end of the file
    data = my_text_file.read()
    print(f"Printing Data again: {data}")
    # You need to seek back to the beginning for # multiple reads
    my_text_file.seek(0)
    data = my_text_file.read()
    print(f"Printing data after seeking to the beginning:\n {data}")

```

## Load json from File

- `json.load(identifier)` to convert data into a dictionary

```python
import json
with open("data.json", mode='r', encoding='utf-8') as data_file:
    data = json.load(data_file)
    print(data)
```

## Write to json file

- Convert dictionary into json, then write json file out

```python
import json

person_dict = {"name": "Homer", "children": ["Bart", "Lisa","Maggie"], "married": True, "fav_food": 'Donut' }

with open('person.json', 'w') as json_file:
    json_data = json.dumps(person_dict)
    json_file.write(json_data)
    # json.dump(person_dict, json_file) #same as above 2 lines
```

# Enums

- An enumeration (Enum) is a user-defined type that consists of a set of named value constants that are known as enumerators
- Cannot modify the name or value after it's been created
- Cannot have duplicated keys

```python
import enum
class Days(enum.Enum):
    SUN = 0
    MON = 1
    TUE = 2
    WED = 3
    THU = 4
    FRI = 5
    SAT = 6

day = Days.MON
print(type(day)) #<enum 'Days'>
print(day) #Days.MON
print(day.name) #MON
print(day.value) #1
print (Days['SAT']) #Days.SAT
print (Days(4)) #Days.THU

day.name = Days.THU.name #ERROR
day.value = 5 #ERROR
day = Days.TUE # ok

for day in Days:
    print(day)
# Days.SUN Days.MON Days.TUE Days.WED Days.THU Days.FRI Days.SAT
```

# Iterators

# Comprehensions

# Function Object and Observers
