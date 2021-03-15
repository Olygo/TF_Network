## Security Lists
	  ### DMZ Bastion Subnet
	  resource "oci_core_security_list" "sl00" {
		  compartment_id = var.compartment_ocid
		  vcn_id         = oci_core_vcn.vcn_01.id
		  display_name   = var.sl_00_display_name

		  // allow outbound traffic on all ports
		  egress_security_rules {
		  description = "Allow ANY to outbound"
		  destination = "0.0.0.0/0"
		  protocol    = "all"
		  stateless   = false
		  }

		  // allow inbound traffic from the subnet itself
		  ingress_security_rules {
		  description = "Allow ANY from the subnet itself"
		  protocol  = "all"
		  source    = var.public_subnet_01_cidr_block
		  stateless = false
          }

		  // allow inbound SSH traffic from internet
		  ingress_security_rules {
		  description = "Allow SSH to Bastion from internet network"
		  protocol  = "6"
		  source    = "0.0.0.0/0"
		  stateless = false
		  tcp_options {
              max = 22
              min = 22
            }
          }		  

// allow inbound SSH traffic from internet
		  ingress_security_rules {
		  description = "Allow SQLNET (ATP DBLINK) to Bastion from internet network"
		  protocol  = "6"
		  source    = "0.0.0.0/0"
		  stateless = false
		  tcp_options {
              max = 1521
              min = 1521
            }
          }		

		  // allow inbound SSH traffic from on-prem
		  ingress_security_rules {
		  description = "Allow SSH from on-prem network"
		  protocol  = "6"
		  source    = var.on-premise_01_cidr_block
		  stateless = false
		  tcp_options {
              max = 22
              min = 22
            }
          }		  

		  // allow inbound SSH traffic from on-prem
		  ingress_security_rules {
		  description = "Allow SSH from on-prem network"
		  protocol  = "6"
		  source    = var.on-premise_02_cidr_block
		  stateless = false
		  tcp_options {
              max = 22
              min = 22
            }
          }	

		  // allow inbound SSH traffic from on-prem
		  ingress_security_rules {
		  description = "Allow SSH from on-prem network"
		  protocol  = "6"
		  source    = var.on-premise_03_cidr_block
		  stateless = false
		  tcp_options {
              max = 22
              min = 22
            }
          }	

		  // allow inbound SSH traffic from on-prem
		  ingress_security_rules {
		  description = "Allow SSH from on-prem network"
		  protocol  = "6"
		  source    = var.on-premise_04_cidr_block
		  stateless = false
		  tcp_options {
              max = 22
              min = 22
            }
          }	

		  // allow inbound SSH traffic from on-prem
		  ingress_security_rules {
		  description = "Allow SSH from on-prem network"
		  protocol  = "6"
		  source    = var.on-premise_05_cidr_block
		  stateless = false
		  tcp_options {
              max = 22
              min = 22
            }
          }	

		  // allow inbound SSH traffic from on-prem
		  ingress_security_rules {
		  description = "Allow SSH from on-prem network"
		  protocol  = "6"
		  source    = var.on-premise_06_cidr_block
		  stateless = false
		  tcp_options {
              max = 22
              min = 22
            }
          }	
}