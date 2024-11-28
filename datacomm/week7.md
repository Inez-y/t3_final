# Week7

## Learning Outcome
- Error types
- Error detection vs Error correction
- Block coding and Hamming Distance
- Cyclinc Code
- Calculate a checksum
- Forwarding Error Correction Techniques
- DLC

## Intro
- Networks must be able to transfer data from one device to another with **acceptable accuracy**.
    - The data received must be **identical** to the data transmitted.
- Data may be corrupted in passage.
- A small level of error may be tolerated by some applications.
- The approach of most link-layer protocols for error control: **discard the frame** and let the **upper-layer protocols handle** the retransmission of the frame.
- The **data link control(DLC)** deals with procedures for communicatino between two adjacent nodes (node-to-node communication)
    - No matter whehter the link is dedicated or broadcast
    - other sublayer in data link layer = MAC
    - DLC functions/services : Framing, Flow control, Error control

## Error types
- *Interference* can change the shape of signal.
    - bits are subject to unpredictable changes
### **Single-Bit Error**
- Only 1 bit of given data unit is changed from 1 to 0 or from 0 to 1

### **Burst Error**
- 2 or more bits in data unit have changed from 1 to 0 or from 0 to 1
- More likely to happen: Why?
    Number of Bits Affected by the **Noise**

    > *Number of bits are affected* = *data rate* * *duration of noise*
    
#### Example
- Assuming we are sending data and there is noise of 0.001 second, how many bits are affected by the noise if 
    
    (a) the data rate is 1kbps:

        0.001 * 1,000 = 1 bit

    (b) the data rate is 1Mbps:

        0.001 * 1,000,0000 = 1,000 bits


## Error Detection vs Error Correction
### Error Detection
- Only looking to see if any error has occured
- The number of corrupted bits (type of error) is not important

### **Error Correction**
- The exact **number of currupted bits** and **their location** in the message need to be identified 
- Important factors: number of errors and the size of the message
- Way difficul than the detection

## **Extra bits**: Redundancy for Error Control
- Sending extra bits with the original data
- Added by sender and removed by the receiver
- Redundant bits *allow the receiver to detect or correct corrupted bits*
- Redundancy is achived through **coding schemes**
- The sender adds redundatn bits which have a relationship with the actual data

## Block Coding
#### Dataword
- The message is divided into blocks, each of *k* bits
- Possible combination of *k*-bit datawords: **2^k**
#### Codeword
- *r* redundant bits are added to each block to make the length *n = k + r*
- Possible combination of *n*-bit codewords: **2^n**

##### 2^k (datawords) < 2^n (codewords)
- *2^k* is the total number of valid datawords, and each dataword corresponds to one valid codeword.
- *2^n* is the total number of possible n-bit codewords. However, not all *2^n* codewords are valide because only *2^k* valid datawords exist

- The same dataword is always encoded as the same codeword
- *2^n - 2^k* codewords are not used(invalid codes) -> **The trick in error detection** 

- Error detection by receiver in 3 conditions
    1. The receiver has (finds) a list of valid codewords
    2. The original codeword has changed to an invalid one and it'll be discarded
    3. The original codeword changes to a valid one (the error undetectable)

#### Error Detection in Block Coding
- If the codeword is corrupted during transmission but the received word still matches a valid codeword, *the error remains undetected*

### Haming Distance: d(x,y)
- The number of differences between corresponding bits between two words
- d(x,y) is **the number of bits that are corrupted during transmission**
> 
    - d(x,y) = 0 : no error
    - d(x,y) > 0 : error

    - d(0101,1010) = 2 : error
- XOR operation ⊕ counts the number of 1s in the result (or : 1)
    10101 ⊕ 11110 = 01011
- **The minimum hamming distance** between all paris of valid codewords (detect up to *s* errors)
    > *(d)min = s + 1*

### Linear Block Codes
- Almost all block codes belong to a subset of block codes, **linear block codes**
- Nonlinear bock codes are not suitable for error detection and correction due to their structure(theorical analysis)
- Abstract algebra (partial Galois field) required
- Informal definition:
    a linear block code is a code in which the **XOR** (addition modulo-2) of two valide codewords creates another valid codeword
 
#### Parity-Check Code (linear blcok code)
- **Parity bit**: the extra bit that makes the total number of 1s in codewords **even**
- Minimum hamming distance for parity check code: (a single-bit error-detecting code)
    > *(d)min = 2*
- *k*-bit dataword is changed to an *n*-bit codeword where 
    > *n = k + 1*

- Parity bit garantees to **detect one single error** and find **any odd number of errors**
    - example1
        ```
        dataword 1001 and codeword 1001'0'
        ```
        Codeword is generated using *even parity bit* of **0**. 
        If another computer receives the incorrect data *011*010, this code has *odd parity* (number of 1s = 3).
        Therefore, the codeword is corrupted

    - example2 - C(5,4)
        ```
        n = 5 (codeword), k = 4(dataword), even parity
        ```

        dataword 0000 -> codeword 0000**0**
        dataword 0001 -> codeword 0000**1**
        dataword 1101 -> codeword 1101**1**
        dataword 1110 -> codeword 1110**1**



##### Encoder and Decoder for Simple Parity-Check Code (linear blcok code)
- The calculation is done in modular arithmetic (**XOR operation**)
- If the syndrome is 0, there is *no detectable error* in the received codeword


### Cyclinc Codes (linear block code)
- Special linear block codes with **one extra property**
- If a codeword is cyclically shifted(rotated), the result is another codeword
- **Cyclic Redundancy Check (CRC)**
    - A subset of cyclic codes
    - used in LANs and WANs
- Advantages of cyclic codes
    - Good performance to detect single-bit errors, double errors, bust errors
    - Easily be implemented in hardware and software
    - Especially fasgt when implemented in hardware
- **G(x)** : The generator polynomial determines the number of redundatn bits (r)
    - **n (dataword) = k (codeword) + r (redundant bits)**
        - *CRC-3 : G(x) = x^3 + x + 1* : detect max 3 len
        - CRC-8 : G(x) = x^8 + x^2 + x + 1
        - CRC-16 : G(x) = x^16 + x^15 + x^2 + 1
        - CRC-32 : G(x) = x^32 + x^26 + x^23 + x^22 ... + 1
    - Detectable errors
        - single-bit errors: always detectable if G(x) has at least two terms
        - two-bit errors: detectable if G(x) does not devide x^t + 1 for any t(distance between errors)
        - odd numbers of bit errors: detectable if G(x) includes x + 1 as a factor
        - burst errors: error length r or fewer is always detectable if G(x) has r redundant bits

- Example : C(7,4)
    - dataword *k = 4* and codeword *n = 7*
        ```
        parity bit : 7 - 4 = 3 
        3 bits of each codeword are derived using CRC polynomial division
        ```

        ```
        CRC polynomial
        G(x) = x^3 + x^1 + 1 
        
        x^0 - 1
        x^1 - 1
        x^2 - 0
        x^3 - 1
        = 1011(2)

        So, devide dataword by 1011 (XOR) and add remainder 
        ```
        
        - dataword 0000 -> add parity bits 0000*000* ⊕ 1011 -> codeword 0000*000* 
        - dataword 0001 -> add parity bits 0001*000* ⊕ 1011 -> codeword 1001*011* 
        - dataword 1100 -> add parity bits 1100*000* ⊕ 1011 -> codeword 1100*010*
        - dataword 0111 -> add parity bits 0111*000* ⊕ 1011 -> 0111*010*


#### CRC Encoder and Decoder
- divisor sahred between sender (generator) <-> receiver (checker)
- If the syndrome is zero, either no bit is corrupted, or the decoder failed to detect any errors

## Checksum
- An error-detecting technique that can be applied to a message of **any length**
- Mostly used at the *network and transport layer* 
- Message is a list of five 4-bit numbers to a destination 
    `(7, 11, 12, 0, 6)`

    - **Send the sum** of the numbers (7, 11, 12, 0, 6, **36**)
    - Receiver will check the sum -> discard if sum is not correct

### One's complement
- *m* bits unsigned number range: *0 to 2^m -1*
- Wrapping: if number has more than m bits, the extra **left most bits** need to be added to the **m rightmost bits**

    36 -> 10100(2), to change to a 4 bit number

    (10)2 + (0100)2 = (0110)2 = 6(10)

- The complement of a nubmer is found by changing all 1s to 0s and all 0s to 1s
- Positive 0 : all *m* bits set to 0 (0000)
- Negative 0 : all *m* bits set to 1 (1111) <- (It is 2^m -1)

    (0110)2 flip -> (1001)2 = 9(10)

    Packet carries (7, 11, 12, 0 ,6, **9**)

    **Receiver** calculates all the sum in the packet 
    7 + 11 + 12 + 0 + 6 + 9 = 45 = 101101(2)
    10(2) + 1101(2) = 1111(2) 

    1111(2) flip -> 0000(2)

### Procedure to Calculate the Traditional Checks
- The internet has used a 16-bit checksum
- Sender 
    - The message is devided into 16-bit words
    - The value of the checksum word is initially set to 0
    - All words including the checksum are added using one's complement addition
    - The sum is complemented and becomes the checksum
    - The checksum is sent with the data
- Receiver
    - The message and the checksum is received
    - The message is divided into 16-bit words
    - All words are added using one's complement addition
    - The sum is complemented and becomes the new checksum
    - If the value of the checksum is 0, the message is accepted; ohterwise, it is rejected

## Forward Error Correction (FEC)
- Retransmission of corrupted and lost packets is not useful for real-time multimedia transmission due to **unacceptable delay** in reproducing
- Need to correct the error or reproduce the packet immediately

### FEC Techniques - Hamming Distance
- More distance needed for error correction
- To correct *s* errors, we need
    > d(min) = 2s + 1
    - For example, if we want to correct 10 bits in a packet, we need 21 bits -> redundatn bits need to be sent with the data

### FEC Techniques - XOR
- We can devide a packet into *N* chuncks, create the XOR of all the chunks and send *(N + 1)* chunks. 
- If any chunk is lost or corrupted, it can be created at the reciver site
    - If *N = 4* 25% percent extra data required, and be able to correct the data if only one out of four chunk is lost

- When R is the redundancy packet and Pi is lost or corrupted
    - **R** = P1 ⊕ P2 ⊕ ... ⊕ Pi ⊕ ... PN
    - Pi = P1 ⊕ P2 ⊕ ... ⊕ **R** ⊕ ... Pn

### FEC Techniques - Chunk Interleaving
- Allowing some small chunks to be missing at the receiver
    - Not all the chunks belonging to the same packet can be missing
    - Let one chunk be missing in each packet

## Data link Control (DLC) : node-to-node communication
- DLC deals with prodecues for comunication between two adjacent nodes, no matter what the link is
- Responsibilities and services: Framing, flow control, error control
- DLC Protocols: Simple Protocol, Stop-and-Wait Protocol
### Framing
- The data-link layer needs to pack bits into frames, so that each frame is distinguishable from another
- The message is usually packed into multiple frames
    - If frame is very large, inefficient flow and error control -> single bit error requires retransmission of the whole frame
- Framing in the data-link lyaer separates a message from one source to a destination by adding a **sender address** and a **destination address**

- Frame size is **FIXED** : no need to defined boundaries
- Frame size is **variable** : prevalent in LANs (Need to define at the end of frame and at the begging of the next frame)
- To define : character(byte)-oriented approach, bit-oriented approach

#### Character-Oriented Approach 
```
|Flag| header | Data from upper layer & variable number of characters | trailer | Flag|
```
   
- Characters: data to be carreid are 8-bit characters from a codind system (ex: ASCII)
- Header: source and destination addresses and other control information
- Trailer: Error detection redundatn bits
- Flag: Separate one frame from the next. Composed of protocol-dependent special characters (8-bits (1-byte))

- Problem
    - Text based
    - Any character used for the *flag could also be part of the information* if other types of information sent -> Receiver regards it as the pattern reached the end of the frame


##### Character-Oriented Approach: Byte Stuffing and Unstuffing
- **Byte Stuffing** (character stuffing)
    One extra byte with a predefined bit pattern(Escape character ESC) whenever there is a flag or ESC in the text
    - Whenever the receiver encounters the esc character, it *removes ESC character* from the data section and treats the *next character as data*, not as a delimiting flag

- Problem
    - The universal coding systems these days have 16-bit and 32-bit (Unicode). Conflict with 8-bit characters
    - The tendency is moving toward the **bit-oriented** procotols

#### Bit-Oriented Approach
```
Flag| Header | Data from upper layer & variable number of bits | Trailer |Flag
```
- Flag: a special 8-bit pattern as the delimiter to define beginning and the end of the frame (01111110 is the common flag)

##### Bit-Oriented Approach: Bit Stuffing and Unstuffing
- **Bit stuffing** is the process of adding one extra 0 whenever 5 consecutive 1's floolw a 0 in the data, so that the *receiver does not mistake the pattern 01111110 for a flag*


### Flow Control
- Strategies to implement flow control
1. The receiving data-link layer **drops the frames** if its buffer is full
2. Receiving data-link layer sends a **feedback** to the sending data-link layer to ask it to stop or slow down

### Error Control
- A CRC (Cyclinc Redundancy Check)is added to the frame header by the sender and checked by the receiver
- Two approaches
    1. **Corrupted frames are discarded**, and the uncorrupted ones are delivered to the network layer (Mostly used in wired LANs such Ethernet)
    2. **Corrupted frames are discarded, and an acknolwedgment is sent** to the sender for the uncorrupted frames (for the purpose of both flow and error control)
        - The lack of acknolwedgement means that there is a problem in the sent frame
    
### Data-Link Layer Protocols
- Two DLC protocols to deal with flow and error control: Simple and Stop-and-Wait
- The behaviour of a data-link-layer protocol can be better shown as a finite sate machine (FSM)

#### Finite State Machine (FSM) 
- To simulate sequential logic
- Thought of as a machine (system) with a finite number of states
- The machine is **alwyas in one of states** until an event occurs
    - Rounded-corner retangles to show states
    - Coloured text to show events
    - Regular black text to show actions
#### Simple Protocol
- No flow and error control
- Assumption is that the receiver can never be overwhelemd with incoming frames

#### Stop-and-Wait Protocol
- A **connection-based** protocol (connection-oriented)
- **Both flow and error control provided**
- The sender sends one frame at a time and waits for an acknowledgement before sending the next one
- A **timer** used by the sender -> the frame is retransmitted if expires
- If the CRC is correct, the receiver will send and acknolegement
- Duplicates and orders and be handled by adding a **sequence number** and **acknowledgement number** to the frames
    - Sequence numbers start with 0
    - Acknowledgement numbers start with 1, always define the sequence number of the next frame to receive
- A smaller concept in TCP in transport layer



