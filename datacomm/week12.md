# Learning Outcomes

- Explain how TCP works and what are its characteristics

# TCP

- **Transmission Control Protocol**: connection-oriented protocol
  - TCP explicity defines
    - connectoin establishment
    - data transwer
    - connection teardown phases
      - a _single logic pathway_ is used for the segments belonging to the same message
  - _logical connection_
  - **full-duplex service**: data is exchanged in both directions

## TCP - A Stream-Oriented Protocol

- **Stream-oriented protocol** (byte-oriented)
  - the sending process delivers data as a **stream of bytes** and the receiving process obtains data as a stream of bytes
    ![alt text](./img/image-56.png)

## TCP - Sending and Receiving Buffers

- Buffers are necessary for _flow control_ and _error control_
  ![alt text](./img/image-57.png)

## TCP - Numbering System

- TCP numbers all data byts (octets) that are transmitted in a connection
- Number is **independent** in each direction
- Byte numbering is used for **flow and error control**
- Two filed in the segment header -_sequence number_ -_acknowledgement number_
  - each of above fields refer to a **byte number** and not a segment nubmer

## TCP Segment - Format

![alt text](./img/image-58.png)

- HLEN(4bits) : the lengh of the TCP header in words (4-bytes)
- Control bits(flags)
  - URG: urgent pointer is valid (generally not used)
  - ACK: ACK# is valid
  - PSH: request for push(generally not used)
  - RST, SYN, FIN: connection establishment/set up and teardown
- Window size (16 bits): Receiving window size(rwnd) and determined by the receiver
  - used for flow control
  - the num of bytes the receiver is willing to accept
- Checksum(16 bits): _MANDATORY_ in TCP
- Options and padding (up to 40 bytes): optional field
  -e.g., when a sender and reeceiver negotiate the maximum segment size (MSS)

## TCP - Connection

### Extablishment

![alt text](./img/tcp_connection.png)

- TCP connection-establishment procedure is often referred to as a **three-way handshake**

### Termination

- Either of the two parties involved in exchanging data(client or server) can close the connection, although it is _usually initiated by the clinet_

- Most implementations today allow two options for connection termination
  1. three-way handshaking
  2. four-way handshaking with a half-close option

![alt text](./img/tcp_termination.png)

#### Termination - Half-Close

- Half-close
  - one end can stop sending data while still receiving data.
  - client half-closes the connection by sending a FIN segment

![alt text](./img/tcp_halfclose.png)

## TCP - Flow Control

- Flow control is used to **eliminate the possibility** of the sender **overflowing** the receiver's buffer
- TCP sender(at each side of the connection) maintains a variable called **receive window (rwnd)**
  - gives the sender an idea of how much free buffer space is available at the receiver
  - initial value of rwnd = receive buffer size(RcvBuffer)
- **Receiver** advertisees free buffer space by including _rwnd_ valud in TCP header of receiver-to-sender segments -_RcvBuffer_ size sent via socekt options (defaul = 4096 bytes)
  -auto-adjust RcvBuffer by operating systems
  ![alt text](./img/tcp_flowcontrol.png)

- **Sender** limits amount of unACKed data(in-flight or outstanding) to reecever's _rwnd_ value
  > LastByteSent - LastByteAcked <= rwnd
  - guarantees receive buffer will not overflow
- At **receiver**
  > rwnd = RcvBuffer - [LastByteRcvd - LastByteRead]

![alt text](./img/tcp_flowcontrol2.png)

- TCP is a **reliable transport-layer protocol**
  - in order, without error, without any part lost/duplicated
  - an application program that delivers a stream data to TCP
    - relies on TCP deliver the entire stream to the application program on the other end

## TCP Error Control Mechanisms

1. Acknowledgements
2. Sequence Numbers
3. Retransmission
4. Checksum

### Acknowledgements

• An acknowledgement confirms the receipt of data segments.
• The value of the acknowledgment field in a segment defines the byte
number of the next byte a party expects to receive.
• The acknowledgment number is cumulative.
➢The party takes the last byte number that it has received, safe and
sound, adds 1 to it, and announces this sum as the acknowledgment
number.
TCP only acknowledges bytes up to the first missing byte in the stream

### Sequence Numbers

• The value in the sequence number field of a segment indicates the number
assigned to the first data byte contained in that segment.
• The sequence number, in each direction, is indicated as follows:

1. ISN (initial sequence number): The sequence number of the first segment (a
   random number between 0 and 232
   -1).
2. The sequence number of any other segment is the sequence number of the
   previous segment plus the number of bytes carried by the previous segment.
   • Some segments, when carrying only control information, need a sequence
   number to allow an acknowledgment from the receiver.
   ➢segments for connection establishment, termination, or abortion.
   ➢each of these segments consume one seq

• Detection of a lost segment
➢gaps in the sequence numbers of the received segments.
• Detection of a duplicate segment
➢received segments with duplicate sequence numbers.
• Detection of out-of-order segments
➢the receiver flags the out-of-order segments and stores them
temporarily until the missing segments arrive (TCP guarantees that data
are delivered to the process in order).

#### Sequence Numbers Example

Suppose a TCP connection is transferring a file of 5000 bytes. The first byte is
numbered 10,001. What are the sequence numbers for each segment if data
are sent in five segments, each carrying 1000 bytes?
![alt text](image.png)

### Retransmission

• The heart of TCP error control.
• Two types of retransmissions in TCP:

1. Retransmission after Time-out
2. Retransmission after Three Duplicate ACK Segments

#### Retransmission after Time-out

• The sending TCP maintains one retransmission time-out for each
connection.
• Time-out event:
➢The segment that caused the time-out is retransmitted
➢Timer is restarted.
• The value of retransmission time-out is dynamic and updated based on RTT
(round-trip time).
• RTT is the time needed for a segment to reach a destination and for an
acknowledgment to be received.

#### Retransmission after Three Duplicate ACKs

• This is also called fast retransmission.
• If three duplicate acknowledgments (i.e., an original ACK plus three exactly
identical copies) arrive for a segment, the next segment is retransmitted
without waiting for the time-out.
• Three or more duplicate ACKs are received in a row, it is a strong
indication that a segment has been lost.

### Checksum

• Detection of corrupted segments.
• It is a 16-bit checksum.
• It is calculated using a pseudoheader
(why?), the TCP header, and the data
coming from the application layer.
• Difference with network layer checksum?
➢ network-layer checksum is only
calculated over the header of IP
datagram.
• Difference with UDP checksum?
➢UDP checksum is optional.

### Some TCP Error Control Scenarios

#### Retransmission after Time-out: Lost Segment

#### Retransmission after Time-out: Lost Acknowledgement

#### Fast Retransmission (Three Duplicate ACKs)

#### Cumultive Acknowledgement: Lost Acknowledgement

## TCP Congestion

- Congestion in Network
  Two main results of congestion:

1. Increased end-to-end delay
2. Packet loss (due to buffer/queue overflow)

### TCP Congestion Detection

• TCP congestion control is feedback-based.
➢To detect congestion, TCP sender uses an implicit feedback from the
other end, i.e., acknowledgements (ACKs).
• Two events are considered as signs of congestion in the network:

1. Time-out: sign of a strong congestion
2. Receiving three duplicate ACKs: sign of a weak congestion

• TCP provides end-to-end congestion control.
• End host (TCP sender) adjusts its sending rate according to the network
condition.

### TCP COngestion Control: Window-based

• TCP maintains a state variable for each connection called congestion
window (cwnd): Imposes a constraint on the rate at which a TCP sender
can send traffic into the network.

The maximum number of unacknowledged (in-flight) data bytes\* <= cwnd
\*Assume that the receive window size is much larger than cwnd.

#### TCP Congeestion Window

TCP source sets the congestion window (cwnd) based on the level of
congestion it perceives to exist in the network. This involves
decreasing the congestion window when the level of congestion goes
up and increasing the congestion window when the level of
congestion goes down.

#### TCP Congestion Window and MSS

• What is Maximum Segment Size (MSS)?
➢The maximum amount of application layer data in the segment.
MSS is used in TCP congestion control algorithm to adjust the sending rate
(i.e., cwnd >= MSS) → negotiated during the connection establishment

### TCP Congestion Control Algorithms

• Three main components:

1. Slow start
2. Congestion Avoidance
3. Fast Recovery
   ➢New versions of TCP use it.
   ➢It starts when three duplicate ACKs arrive (light congestion).

#### Slow Start: Exponential Increase

• The size of the congestion window (cwnd) begins at 1 MSS and is doubled
per RTT\* (i.e., sending rate is doubled per RTT).
• The exponential increase:
➢continues until it reaches a threshold called slow start threshold
(ssthresh)
➢or is restarted if congestion is detected.

#### Congestion Avoidance

• A conservative approach.
• The size of the congestion window increases additively (linearly) until
congestion is detected.

##### Tahoe TCP - Example

#### Fast Recovery

##### TCP Congestion Control vs. TCP Flow Control

• Avoid overwhelming the net vs. Avoid overwhelming the receiver.
• TCP sender maintains cwnd , TCP receiver: maintains rwnd.
• The maximum number of unacknowledged (in-flight) data bytes <= min
{cwnd, rwnd}

# Summary

• TCP is a reliable connection-oriented protocol.
• TCP explicitly defines connection establishment, data transfer, and
connection teardown phases (connection-oriented service)
• The connection is logical and full-duplex.
• TCP packets are called segments
• TCP connection establishment is called three-way handshake.
• TCP connection is point-to-point (i.e., between a single sender and a single
receiver).
• TCP Flow control is implemented using sliding window.
• TCP uses error control to provide a reliable service.
• Checksum is used to detect corrupted segments.
• Cumulative acknowledgements are used to confirm the receipt of data
segments.
• Sequence numbers are helpful in detection of lost, out-of-order, and
duplicate segments.
• Retransmission is the heart of TCP error control (two types).
➢Retransmission time-out interval calculation based on RTT
• TCP congestion control algorithm has three phases.
