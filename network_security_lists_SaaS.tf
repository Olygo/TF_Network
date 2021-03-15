## Security Lists

	### SaaS security lists

	  resource "oci_core_security_list" "sl04" {
		  compartment_id = var.compartment_ocid
		  vcn_id         = oci_core_vcn.vcn_01.id
		  display_name   = var.sl_04_display_name

		  // allow outbound traffic to Argus DB
		  egress_security_rules {
		  destination = var.argus_cidr_block
		  protocol    = "6"
		  description = "Allow SQLNET to Argus Database"
		  stateless = false
		  tcp_options {
              max = 1521
              min = 1521
            }		  
			}

		  // allow inbound traffic from the subnet itself
		  ingress_security_rules {
		  description = "Allow ANY from the subnet itself"
		  protocol  = "all"
		  source    = var.private_subnet_04_cidr_block
		  stateless = false
          }

		  // allow inbound SQLNET traffic from multi prod subnet
		  ingress_security_rules {
		  description = "Allow SQLNET from prod subnet"
		  source    = var.private_subnet_01_cidr_block
		  protocol    = "6"
		  stateless = false
		  tcp_options {
              max = 1521
              min = 1521
            }
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
}
	  resource "oci_core_security_list" "sl05" {
		  compartment_id = var.compartment_ocid
		  vcn_id         = oci_core_vcn.vcn_01.id
		  display_name   = var.sl_05_display_name

		  // allow outbound traffic to Argus DB
		  egress_security_rules {
		  destination = var.argus_cidr_block
		  protocol    = "6"
		  description = "Allow SQLNET to Argus Database"
		  stateless = false
		  tcp_options {
              max = 1521
              min = 1521
            }		  
			}

		  // allow inbound traffic from the subnet itself
		  ingress_security_rules {
		  description = "Allow ANY from the subnet itself"
		  protocol  = "all"
		  source    = var.private_subnet_05_cidr_block
		  stateless = false
          }

		  // allow inbound SQLNET traffic from multi rect subnet
		  ingress_security_rules {
		  description = "Allow SQLNET from rect subnet"
		  source    = var.private_subnet_02_cidr_block
		  protocol    = "6"
		  stateless = false
		  tcp_options {
              max = 1521
              min = 1521
            }
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
}
	  resource "oci_core_security_list" "sl06" {
		  compartment_id = var.compartment_ocid
		  vcn_id         = oci_core_vcn.vcn_01.id
		  display_name   = var.sl_06_display_name

		  // allow outbound traffic to Argus DB
		  egress_security_rules {
		  destination = var.argus_cidr_block
		  protocol    = "6"
		  description = "Allow SQLNET to Argus Database"
		  stateless = false
		  tcp_options {
              max = 1521
              min = 1521
            }		  
			}

		  // allow inbound traffic from the subnet itself
		  ingress_security_rules {
		  description = "Allow ANY from the subnet itself"
		  protocol  = "all"
		  source    = var.private_subnet_06_cidr_block
		  stateless = false
          }

		  // allow inbound SQLNET traffic from multi dev subnet
		  ingress_security_rules {
		  description = "Allow SQLNET from dev subnet"
		  source    = var.private_subnet_03_cidr_block
		  protocol    = "6"
		  stateless = false
		  tcp_options {
              max = 1521
              min = 1521
            }
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
}