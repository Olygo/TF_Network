## Default Security Lists
	// ref: https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/terraformbestpractices_topic-vcndefaults.htm
	// ref: https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_security_list 
	// ref: https://github.com/oracle-terraform-modules/terraform-oci-vcn/blob/master/vcn_defaultresources.tf
	
	// set & get the default security list in the VCN
		resource "oci_core_default_security_list" "default_sl" {
		manage_default_resource_id = oci_core_vcn.vcn_01.default_security_list_id

        // if no rules define, will clear all existing rule.
		ingress_security_rules {
			// allow ICMP for all type 3 code 4
			protocol = "1"
			source   = "0.0.0.0/0"

			icmp_options {
			type = "3"
			code = "4"
			}
		}
	}

## Create Subnets

#Public subnet
resource "oci_core_subnet" "public_subnet_01" {
    cidr_block = var.public_subnet_01_cidr_block
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn_01.id
    display_name = var.public_subnet_01_display_name
    route_table_id = oci_core_route_table.public_route_table.id
    prohibit_public_ip_on_vnic = false
    security_list_ids = [oci_core_security_list.sl00.id,oci_core_default_security_list.default_sl.id]
    dns_label = var.public_subnet_01_dns_label
}


#Private subnets
resource "oci_core_subnet" "private_subnet_01" {
    cidr_block = var.private_subnet_01_cidr_block
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn_01.id
    display_name = var.private_subnet_01_display_name
    route_table_id = oci_core_route_table.private_route_table.id
    prohibit_public_ip_on_vnic = true
    security_list_ids = [oci_core_security_list.sl01.id,oci_core_default_security_list.default_sl.id]
    dns_label = var.private_subnet_01_dns_label
}

resource "oci_core_subnet" "private_subnet_02" {
    cidr_block = var.private_subnet_02_cidr_block
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn_01.id
    display_name = var.private_subnet_02_display_name
    route_table_id = oci_core_route_table.private_route_table.id
    prohibit_public_ip_on_vnic = true
    security_list_ids = [oci_core_security_list.sl02.id,oci_core_default_security_list.default_sl.id]
    dns_label = var.private_subnet_02_dns_label
}

resource "oci_core_subnet" "private_subnet_03" {
    cidr_block = var.private_subnet_03_cidr_block
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn_01.id
    display_name = var.private_subnet_03_display_name
    route_table_id = oci_core_route_table.private_route_table.id
    prohibit_public_ip_on_vnic = true
    security_list_ids = [oci_core_security_list.sl03.id,oci_core_default_security_list.default_sl.id]
    dns_label = var.private_subnet_03_dns_label
}

resource "oci_core_subnet" "private_subnet_04" {
    cidr_block = var.private_subnet_04_cidr_block
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn_01.id
    display_name = var.private_subnet_04_display_name
    route_table_id = oci_core_route_table.private_route_table.id
    prohibit_public_ip_on_vnic = true
    security_list_ids = [oci_core_security_list.sl04.id,oci_core_default_security_list.default_sl.id]
    dns_label = var.private_subnet_04_dns_label    
}

resource "oci_core_subnet" "private_subnet_05" {
    cidr_block = var.private_subnet_05_cidr_block
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn_01.id
    display_name = var.private_subnet_05_display_name
    route_table_id = oci_core_route_table.private_route_table.id
    prohibit_public_ip_on_vnic = true
    security_list_ids = [oci_core_security_list.sl05.id,oci_core_default_security_list.default_sl.id]
    dns_label = var.private_subnet_05_dns_label    
}

resource "oci_core_subnet" "private_subnet_06" {
    cidr_block = var.private_subnet_06_cidr_block
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn_01.id
    display_name = var.private_subnet_06_display_name
    route_table_id = oci_core_route_table.private_route_table.id
    prohibit_public_ip_on_vnic = true
    security_list_ids = [oci_core_security_list.sl06.id,oci_core_default_security_list.default_sl.id]
    dns_label = var.private_subnet_06_dns_label
}
