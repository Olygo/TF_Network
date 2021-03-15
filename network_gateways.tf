## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

#IGW
resource "oci_core_internet_gateway" "igw_01" {
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn_01.id
    enabled = "true"
    display_name = var.igw_01_display_name
}

#NATGW
resource "oci_core_nat_gateway" "ngw_01" {
    compartment_id = var.compartment_ocid
    vcn_id = oci_core_vcn.vcn_01.id
    display_name = var.ngw_01_display_name
}

#SGW
resource "oci_core_service_gateway" "sgw_01" {
    compartment_id = var.compartment_ocid
    services {service_id = lookup(data.oci_core_services.OCIServices.services[0], "id")}
    vcn_id = oci_core_vcn.vcn_01.id
    display_name = var.sgw_01_display_name
}