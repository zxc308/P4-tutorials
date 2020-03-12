# Port Mirroring

## Introduction

The objective of this exercise is to write a P4 program that mirrors all the incoming packets to a specific port where a collector is located at.

Upon receiving a packet, your program should make a copy of the corresponding packet and send it to the collector. Your switch will have a single table, which we have populated with static rules. You will only need to implement the logic for cloning packets. 

We will use a simple topology for this exercise. It is a single switch connected to three hosts, h1, h2 and h3 where h3 acts as the collector connected to the mirroring port (port 3) as follow: 

```
                h1       h3 (Collector)
                 \      /
                  \    /
                    s1  
                  /    
                 /      
               h2        

```
> **Spoiler alert:** There is a reference solution in the `solution`
> sub-directory. Feel free to compare your implementation to the
> reference.

## Step 1: Run the (incomplete) starter code

The directory with this README also contains a skeleton P4 program,
`mirroring.p4`, which forwards packets between h1 and h2. Your job will be to
extend this skeleton program to mirror all the packets to the collector host, h3.

Before that, let's compile the incomplete `mirroring.p4` and bring
up a switch in Mininet to test its behavior.

1. In your shell, run:
   ```bash
   make run
   ```
   This will:
   * compile `mirroring.p4`, and
   * start the topology in Mininet and configure all switches with
   the appropriate P4 program + table entries, and
   * configure all hosts with the commands listed in
   [topology.json](topology.json)

2. You should now see a Mininet command prompt. Bring up the terminal for h3.
   ```bash
   mininet> Xterm h3
   ```
   Since this is the collector host, run `tcpdump` to observe incoming mirrored packets.
   ```
   root@p4:~/tutorials/exercise/mirroring# tcpdump -i eth0
   ```

2. You should now see a Mininet command prompt. Try to ping between
   hosts in the topology:
   ```bash
   mininet> h1 ping h2
   mininet> pingall
   ```
   If the packets are mirrored properly, you should observe the corresponding packets on `tcpdump`.
3. Type `exit` to leave each xterm and the Mininet command line.
   Then, to stop mininet:
   ```bash
   make stop
   ```
   And to delete all pcaps, build files, and logs:
   ```bash
   make clean
   ```

No packets should be received by h3, since the `mirror` action is not implemented yet.
Your job is to extend this file so it mirrors packets to the collector host.

## Step 2: Implement Port Mirroring
1. **TODO:** An action (called `mirror`) that: 
    1. Invokes the `clone` extern of the V1Model.
    2. Passes the appropriate CloneType and session ID as the parameter to the `clone` method.
2. **TODO:** Call the `mirror` action in your program so that it mirrors all arriving packets.
3. **TODO:** Add port 3 to your specified session.
    1. In a new terminal, start the `simple_switch_CLI`
    2. Execute the command `mirroring_add` followed the session ID the port number.

## Step 3: Run your solution

Follow the instructions from Step 1. This time, you should be able to
observe packets being mirrored to h3. And, you're done!

### Useful Resources
Check out the resources below that contains further explanations on how `clone/clone3` works!
- [V1Model](https://github.com/p4lang/p4c/blob/master/p4include/v1model.p4)
- [BMv2](https://github.com/p4lang/behavioral-model/blob/master/docs/simple_switch.md)
- Guide on [V1Model Special Ops](https://github.com/jafingerhut/p4-guide/blob/master/v1model-special-ops/v1model-special-ops.p4)

### Food for thought

Questions to consider:
- 
 - What is the difference between clone and clone3?

### Troubleshooting

There are several problems that might manifest as you develop your program:

1. `mirroring.p4` might fail to compile. In this case, `make run` will
report the error emitted from the compiler and halt.

2. `mirroring.p4` might compile,  but the switch might not process packets in the desired
way. The `logs/s1.log` file contain detailed logs describing how each switch processes each packet. The output is
detailed and can help pinpoint logic errors in your implementation.

#### Cleaning up Mininet

In the latter two cases above, `make run` may leave a Mininet instance
running in the background. Use the following command to clean up
these instances:

```bash
make stop
```