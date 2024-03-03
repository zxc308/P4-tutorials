#include <core.p4>
#include <v1model.p4>

#include "include/headers.p4"
#include "include/parsers.p4"

/*************************************************************************
************   C H E C K S U M    V E R I F I C A T I O N   *************
*************************************************************************/

control MyVerifyChecksum(inout headers hdr, inout metadata meta) {   
    apply { }
}

/*************************************************************************
**************  I N G R E S S   P R O C E S S I N G   *******************
*************************************************************************/

control MyIngress(inout headers hdr,
                  inout metadata meta,
                  inout standard_metadata_t standard_metadata) {

    // TODO: Identify the CloneType to be used
    // TODO: Define `mirror` action to clone incoming packets to the 
    // mirroring port (port 3) of session 0.
    action mirror() {
        clone(CloneType.I2E, 0);    // We'll be using session 0.
    }

    action drop() {
        mark_to_drop(standard_metadata);
    }

    action normal_forward(egressSpec_t port) {
        standard_metadata.egress_spec = port;
    }

    table lpm_forward {
        key = {
            hdr.ipv4.dstAddr : lpm;
        }
        actions = {
            normal_forward;
            NoAction;
        }
        default_action = NoAction;
        const entries = {
            0x0a000001 &&& 0xFFFFFFFF : normal_forward(9w1);
            0x0a000002 &&& 0xFFFFFFFF : normal_forward(9w2);
        }
    }

    apply {
        
        // TODO: Call `mirror` action to mirror packets
        mirror();   // For all packets, it will be mirrored.

        if(hdr.ipv4.isValid()){
            lpm_forward.apply();    
        }
    }
}

/*************************************************************************
****************  E G R E S S   P R O C E S S I N G   *******************
*************************************************************************/

control MyEgress(inout headers hdr,
                 inout metadata meta,
                 inout standard_metadata_t standard_metadata) {
    apply { }
}

/*************************************************************************
*************   C H E C K S U M    C O M P U T A T I O N   **************
*************************************************************************/

control MyComputeChecksum(inout headers  hdr, inout metadata meta) {
    apply { }
}

/*************************************************************************
***********************  D E P A R S E R  *******************************
*************************************************************************/

control MyDeparser(packet_out packet, in headers hdr) {
    apply {
        packet.emit(hdr.ethernet);
        packet.emit(hdr.ipv4);
    }
}

/*************************************************************************
***********************  S W I T C H  *******************************
*************************************************************************/

V1Switch(
MyParser(),
MyVerifyChecksum(),
MyIngress(),
MyEgress(),
MyComputeChecksum(),
MyDeparser()
) main;
