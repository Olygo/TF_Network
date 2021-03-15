## Security Lists

	  ### MULTI security lists
	  resource "oci_core_security_list" "sl01" {
		  compartment_id = var.compartment_ocid
		  vcn_id         = oci_core_vcn.vcn_01.id
		  display_name   = var.sl_01_display_name

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
		  source    = var.private_subnet_01_cidr_block
		  stateless = false
          }
		  // allow inbound traffic on all ports from public subnet
		  ingress_security_rules {
		  description = "Allow ANY from interco subnet"
		  protocol  = "all"
		  source    = var.public_subnet_01_cidr_block
		  stateless = false
		  }
		  // allow inbound traffic on all ports from private subnet
		  ingress_security_rules {
		  description = "Allow ANY from rect subnet"
		  protocol  = "all"
		  source    = var.private_subnet_02_cidr_block
		  stateless = false
		  }
		  // allow inbound traffic on all ports from private subnet
		  ingress_security_rules {
		  description = "Allow ANY from dev subnet"
		  protocol  = "all"
		  source    = var.private_subnet_03_cidr_block
		  stateless = false
		  }
		  // allow inbound SQLNET traffic from on-prem
		  ingress_security_rules {
		  description = "Allow SQLNET from N_XXXX_HOLDING"
		  protocol  = "6"
		  source    = var.on-premise_01_cidr_block
		  stateless = false
		  tcp_options {
              max = 1521
              min = 1521
            }
          }		  
		  // allow inbound SQLNET traffic from on-prem
		  ingress_security_rules {
		  description = "Allow SQLNET from N_XXXX_ALTERYX"
		  protocol  = "6"
		  source    = var.on-premise_02_cidr_block
		  stateless = false
		  tcp_options {
              max = 1521
              min = 1521
            }
          }	
		  // allow inbound SQLNET traffic from on-prem
		  ingress_security_rules {
		  description = "Allow SQLNET from N_XXXX_PIE"
		  protocol  = "6"
		  source    = var.on-premise_03_cidr_block
		  stateless = false
		  tcp_options {
              max = 1521
              min = 1521
            }
          }	
		  // allow inbound SSH traffic from on-prem
		  ingress_security_rules {
		  description = "Allow SSH from N_XXXX_LAN_Global"
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
		  description = "Allow SSH from N_XXXX_Pool_VPN_SSL1"
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
		  description = "Allow SSH from N_XXXX_Pool_VPN_SSL2"
		  protocol  = "6"
		  source    = var.on-premise_06_cidr_block
		  stateless = false
		  tcp_options {
              max = 22
              min = 22
            }
          }
}
	  resource "oci_core_security_list" "sl02" {
		  compartment_id = var.compartment_ocid
		  vcn_id         = oci_core_vcn.vcn_01.id
		  display_name   = var.sl_02_display_name

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
		  source    = var.private_subnet_02_cidr_block
		  stateless = false
          }
		  // allow inbound traffic on all ports from public subnet
		  ingress_security_rules {
		  description = "Allow ANY from interco subnet"
		  protocol  = "all"
		  source    = var.public_subnet_01_cidr_block
		  stateless = false
		  }
		  // allow inbound traffic on all ports from private subnet
		  ingress_security_rules {
		  description = "Allow ANY from prod subnet"
		  protocol  = "all"
		  source    = var.private_subnet_01_cidr_block
		  stateless = false
		  }
		  // allow inbound traffic on all ports from private subnet
		  ingress_security_rules {
		  description = "Allow ANY from dev subnet"
		  protocol  = "all"
		  source    = var.private_subnet_03_cidr_block
		  stateless = false
		  }

		  // allow inbound SQLNET traffic from on-prem
		  ingress_security_rules {
		  description = "Allow SQLNET from N_XXXX_HOLDING"
		  protocol  = "6"
		  source    = var.on-premise_01_cidr_block
		  stateless = false
		  tcp_options {
              max = 1521
              min = 1521
            }
          }		  
		  // allow inbound SQLNET traffic from on-prem
		  ingress_security_rules {
		  description = "Allow SQLNET from N_XXXX_ALTERYX"
		  protocol  = "6"
		  source    = var.on-premise_02_cidr_block
		  stateless = false
		  tcp_options {
              max = 1521
              min = 1521
            }
          }	
		  // allow inbound SQLNET traffic from on-prem
		  ingress_security_rules {
		  description = "Allow SQLNET from N_XXXX_PIE"
		  protocol  = "6"
		  source    = var.on-premise_03_cidr_block
		  stateless = false
		  tcp_options {
              max = 1521
              min = 1521
            }
          }	
		  // allow inbound SSH traffic from on-prem
		  ingress_security_rules {
		  description = "Allow SSH from N_XXXX_LAN_Global"
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
		  description = "Allow SSH from N_XXXX_Pool_VPN_SSL1"
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
		  description = "Allow SSH from N_XXXX_Pool_VPN_SSL2"
		  protocol  = "6"
		  source    = var.on-premise_06_cidr_block
		  stateless = false
		  tcp_options {
              max = 22
              min = 22
            }
          }


}
	  resource "oci_core_security_list" "sl03" {
		  compartment_id = var.compartment_ocid
		  vcn_id         = oci_core_vcn.vcn_01.id
		  display_name   = var.sl_03_display_name

		  // allow outbound traffic on all ports
		  egress_security_rules {
		  description = "Allow ANY to Outbound"
		  destination = "0.0.0.0/0"
		  protocol    = "all"
		  stateless   = false
		  }
		  // allow inbound traffic from the subnet itself
		  ingress_security_rules {
		  description = "Allow ANY from the subnet itself"
		  protocol  = "all"
		  source    = var.private_subnet_03_cidr_block
		  stateless = false
          }
		  // allow inbound traffic on all ports from public subnet
		  ingress_security_rules {
		  description = "Allow ANY from Interco subnet"
		  protocol  = "all"
		  source    = var.public_subnet_01_cidr_block
		  stateless = false
		  }
		  // allow inbound traffic on all ports from private subnet
		  ingress_security_rules {
		  description = "Allow ANY from prod subnet"
		  protocol  = "all"
		  source    = var.private_subnet_01_cidr_block
		  stateless = false
		  }
		  // allow inbound traffic on all ports from private subnet
		  ingress_security_rules {
		  description = "Allow ANY from rect subnet"
		  protocol  = "all"
		  source    = var.private_subnet_02_cidr_block
		  stateless = false
		  }
		  // allow inbound SQLNET traffic from on-prem
		  ingress_security_rules {
		  description = "Allow SQLNET from N_XXXX_HOLDING"
		  protocol  = "6"
		  source    = var.on-premise_01_cidr_block
		  stateless = false
		  tcp_options {
              max = 1521
              min = 1521
            }
          }		  
		  // allow inbound SQLNET traffic from on-prem
		  ingress_security_rules {
		  description = "Allow SQLNET from N_XXXX_ALTERYX"
		  protocol  = "6"
		  source    = var.on-premise_02_cidr_block
		  stateless = false
		  tcp_options {
              max = 1521
              min = 1521
            }
          }	
		  // allow inbound SQLNET traffic from on-prem
		  ingress_security_rules {
		  description = "Allow SQLNET from N_XXXX_PIE"
		  protocol  = "6"
		  source    = var.on-premise_03_cidr_block
		  stateless = false
		  tcp_options {
              max = 1521
              min = 1521
            }
          }	
		  // allow inbound SSH traffic from on-prem
		  ingress_security_rules {
		  description = "Allow SSH from N_XXXX_LAN_Global"
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
		  description = "Allow SSH from N_XXXX_Pool_VPN_SSL1"
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
		  description = "Allow SSH from N_XXXX_Pool_VPN_SSL2"
		  protocol  = "6"
		  source    = var.on-premise_06_cidr_block
		  stateless = false
		  tcp_options {
              max = 22
              min = 22
            }
          }		  	  
}
