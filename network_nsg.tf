### NSG for ATP Private Endpoint
	  resource "oci_core_network_security_group" "nsg_01" {
		compartment_id = var.compartment_ocid
		vcn_id = oci_core_vcn.vcn_01.id
		display_name = var.nsg_01_display_name
	  }

	## NSG Rules 

		resource "oci_core_network_security_group_security_rule" "nsg_rule_01" {
			network_security_group_id = oci_core_network_security_group.nsg_01.id
			description = "Allow ATP to connect to Argus database"

			direction = "EGRESS"
			destination = var.argus_cidr_block
			destination_type = "CIDR_BLOCK"
			protocol = "6"

			tcp_options {
				destination_port_range {
					max = 1521
					min = 1521
				}
			}
		}

	resource "oci_core_network_security_group_security_rule" "nsg_rule_02" {
			network_security_group_id = oci_core_network_security_group.nsg_01.id
			description = "Allow ATP to connect to Argus database"

			direction = "INGRESS"
			source = "0.0.0.0/0"
			source_type = "CIDR_BLOCK"
			protocol = "6"

			tcp_options {
				destination_port_range {
					max = 1521
					min = 1521
				}
			}
		}