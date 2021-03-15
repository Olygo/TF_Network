## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

#Default route table 
resource "oci_core_default_route_table" "default_route_table" {
    manage_default_resource_id = oci_core_vcn.vcn_01.default_route_table_id
    route_rules {
        network_entity_id = oci_core_internet_gateway.igw_01.id
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
    }
}

#Public route table 
resource "oci_core_route_table" "public_route_table" {
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn_01.id
    display_name = var.public_route_table_display_name

    route_rules {
        network_entity_id = oci_core_internet_gateway.igw_01.id
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
    }
    route_rules {
        network_entity_id = oci_core_drg.drg_01.id
        destination       = var.on-premise_04_cidr_block
        destination_type  = "CIDR_BLOCK"
    }    
    route_rules {
        network_entity_id = oci_core_drg.drg_01.id
        destination       = var.on-premise_05_cidr_block
        destination_type  = "CIDR_BLOCK"
    }
    route_rules {
        network_entity_id = oci_core_drg.drg_01.id
        destination       = var.on-premise_06_cidr_block
        destination_type  = "CIDR_BLOCK"
    }
}

#Private route table
resource "oci_core_route_table" "private_route_table" {
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn_01.id
    display_name = var.private_route_table_display_name


    route_rules {
        network_entity_id = oci_core_nat_gateway.ngw_01.id
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
    }
    route_rules {
        destination = lookup(data.oci_core_services.OCIServices.services[0], "cidr_block")
        destination_type = "SERVICE_CIDR_BLOCK"
        network_entity_id = oci_core_service_gateway.sgw_01.id
    }
    route_rules {
        network_entity_id = oci_core_drg.drg_01.id
        destination       = var.on-premise_01_cidr_block
        destination_type  = "CIDR_BLOCK"
    }    
    route_rules {
        network_entity_id = oci_core_drg.drg_01.id
        destination       = var.on-premise_02_cidr_block
        destination_type  = "CIDR_BLOCK"
    }
    route_rules {
        network_entity_id = oci_core_drg.drg_01.id
        destination       = var.on-premise_03_cidr_block
        destination_type  = "CIDR_BLOCK"
    }
    route_rules {
        network_entity_id = oci_core_drg.drg_01.id
        destination       = var.on-premise_04_cidr_block
        destination_type  = "CIDR_BLOCK"
    }
    route_rules {
        network_entity_id = oci_core_drg.drg_01.id
        destination       = var.on-premise_05_cidr_block
        destination_type  = "CIDR_BLOCK"
    }
    route_rules {
        network_entity_id = oci_core_drg.drg_01.id
        destination       = var.on-premise_06_cidr_block
        destination_type  = "CIDR_BLOCK"
    }
}